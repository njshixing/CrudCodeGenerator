package com.crud.generator.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ZipUtil;
import com.crud.generator.entity.ClassInfo;
import com.crud.generator.entity.MyResponse;
import com.crud.generator.entity.ParamInfo;
import com.crud.generator.service.GeneratorService;
import com.crud.generator.util.CodeGenerateException;
import com.crud.generator.util.TableParseUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipOutputStream;

/**
 * spring boot code generator
 */
@Controller
@Slf4j
public class IndexController {
    @Autowired
    private GeneratorService generatorService;

    @GetMapping("/")
    public String index() {
        return "index";
    }


    @GetMapping("/download")
    public String download() {
        return "download";
    }

    @PostMapping("/genCode")
    @ResponseBody
    public MyResponse<Map<String, String>> codeGenerate(@RequestBody ParamInfo paramInfo) {
        try {
            if (StringUtils.isBlank(paramInfo.getTableSql())) {
                return new MyResponse<>(MyResponse.FAIL_CODE, "表结构信息不可为空");
            }
            // parse table
            ClassInfo classInfo = null;
            switch (paramInfo.getDataType()) {
                //parse json
                case "json":
                    classInfo = TableParseUtil.processJsonToClassInfo(paramInfo);
                    break;
                //parse sql  by regex
                case "sql-regex":
                    classInfo = TableParseUtil.processTableToClassInfoByRegex(paramInfo);
                    break;
                //default parse sql by java
                default:
                    classInfo = TableParseUtil.processTableIntoClassInfo(paramInfo);
                    break;
            }
            // process the param
            Map<String, Object> params = new HashMap<>(8);
            params.put("classInfo", classInfo);
            params.put("tableName", classInfo.getTableName());
            params.put("authorName", paramInfo.getAuthorName());
            params.put("packageName", paramInfo.getPackageName());
            params.put("returnUtil", paramInfo.getReturnUtil());
            params.put("swagger", paramInfo.isSwagger());
            //log the params
            //log.info(JSON.toJSONString(paramInfo));
            log.info("generator table:" + classInfo.getTableName() + ",field size:" + (classInfo.getFieldList() == null ? "" : classInfo.getFieldList().size()));
            // generate the code 需要加新的模板请在里面改
            Map<String, String> result = generatorService.getResultByParams(params);
            return new MyResponse<>(result);
        } catch (IOException | CodeGenerateException | freemarker.template.TemplateException e) {
            log.error(e.getMessage(), e);
            return new MyResponse<>(MyResponse.FAIL_CODE, e.getMessage());
        }
    }

    @GetMapping("/mybatis")
    @ResponseBody
    public void mybatis(@RequestBody ParamInfo paramInfo, HttpServletResponse response) throws Exception {
        ClassInfo classInfo = TableParseUtil.processTableIntoClassInfo(paramInfo);
        Map<String, Object> params = new HashMap<>(8);
        params.put("classInfo", classInfo);
        params.put("tableName", classInfo.getTableName());
        params.put("authorName", paramInfo.getAuthorName());
        params.put("packageName", paramInfo.getPackageName());
        params.put("returnUtil", paramInfo.getReturnUtil());
        params.put("swagger", paramInfo.isSwagger());
        params.put("generateDate", DateUtil.formatTime(new Date()));

        String fileName = "mybatis.zip";
        response.setHeader("content-type", "text/plain");
        response.setHeader("content-type", "application/x-msdownload;");
        response.setContentType("text/plain; charset=utf-8");
        response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

        ZipOutputStream zipOut = new ZipOutputStream(response.getOutputStream());
        File tempFileDir = generatorService.getFileByParams(params);
        ZipUtil.zip(zipOut, true, null, tempFileDir);
        zipOut.close();
        FileUtil.del(tempFileDir.getPath());
    }
}
