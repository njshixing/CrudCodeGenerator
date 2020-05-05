package com.crud.generator.service;

import cn.hutool.core.io.FileUtil;
import cn.hutool.extra.template.TemplateEngine;
import com.crud.generator.entity.ClassInfo;
import com.crud.generator.util.TemplateEngineUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * GeneratorService
 */
@Slf4j
@Service
public class GeneratorServiceImpl implements GeneratorService {

    @Override
    public Map<String, String> getResultByParams(Map<String, Object> params) {
        TemplateEngine engine = TemplateEngineUtil.INSTANCE;
        // result
        Map<String, String> result = new HashMap<>(32);
        result.put("tableName", params.get("tableName") + "");
        //UI
        result.put("swagger-ui", engine.getTemplate("code-format/ui/swagger-ui.ftl").render(params));
        result.put("element-ui", engine.getTemplate("code-format/ui/element-ui.ftl").render(params));
        result.put("bootstrap-ui", engine.getTemplate("code-format/ui/bootstrap-ui.ftl").render(params));
        //mybatis old
        result.put("controller", engine.getTemplate("code-format/mybatis/controller.ftl").render(params));
        result.put("service", engine.getTemplate("code-format/mybatis/service.ftl").render(params));
        result.put("service_impl", engine.getTemplate("code-format/mybatis/service_impl.ftl").render(params));
        result.put("mapper", engine.getTemplate("code-format/mybatis/mapper.ftl").render(params));
        result.put("mybatis", engine.getTemplate("code-format/mybatis/mybatis.ftl").render(params));
        result.put("model", engine.getTemplate("code-format/mybatis/model.ftl").render(params));
        //jpa
        result.put("entity", engine.getTemplate("code-format/jpa/entity.ftl").render(params));
        result.put("repository", engine.getTemplate("code-format/jpa/repository.ftl").render(params));
        result.put("jpacontroller", engine.getTemplate("code-format/jpa/jpacontroller.ftl").render(params));
        //jdbc template
        result.put("jtdao", engine.getTemplate("code-format/jdbc-template/jtdao.ftl").render(params));
        result.put("jtdaoimpl", engine.getTemplate("code-format/jdbc-template/jtdaoimpl.ftl").render(params));
        //beetsql
        result.put("beetlmd", engine.getTemplate("code-format/beetlsql/beetlmd.ftl").render(params));
        result.put("beetlentity", engine.getTemplate("code-format/beetlsql/beetlentity.ftl").render(params));
        result.put("beetlentitydto", engine.getTemplate("code-format/beetlsql/beetlentitydto.ftl").render(params));
        result.put("beetlcontroller", engine.getTemplate("code-format/beetlsql/beetlcontroller.ftl").render(params));
        //mybatis plus
        result.put("pluscontroller", engine.getTemplate("code-format/mybatis-plus/pluscontroller.ftl").render(params));
        result.put("plusmapper", engine.getTemplate("code-format/mybatis-plus/plusmapper.ftl").render(params));
        //util
        result.put("util", engine.getTemplate("code-format/util/util.ftl").render(params));
        result.put("json", engine.getTemplate("code-format/util/json.ftl").render(params));
        result.put("xml", engine.getTemplate("code-format/util/xml.ftl").render(params));
        //sql generate
        result.put("select", engine.getTemplate("code-format/sql/select.ftl").render(params));
        result.put("insert", engine.getTemplate("code-format/sql/insert.ftl").render(params));
        result.put("update", engine.getTemplate("code-format/sql/update.ftl").render(params));
        result.put("delete", engine.getTemplate("code-format/sql/delete.ftl").render(params));
        return result;
    }

    @Override
    public File getFileByParams(Map<String, Object> params) {
        // 获取项目路径
        String rootPath = Objects.requireNonNull(this.getClass().getClassLoader().getResource("")).getPath();
        // 创建临时文件夹tempFile
        File tempFileDir = FileUtil.mkdir(new File(rootPath + "/tempFile"));
        System.out.println(tempFileDir.getPath());
        TemplateEngine engine = TemplateEngineUtil.INSTANCE;
        // result
        ClassInfo classInfo = (ClassInfo) params.get("classInfo");
        // bo
        engine.getTemplate("code/bo/bo.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + "BO.java"));
        engine.getTemplate("code/bo/boImpl.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + "BOImpl.java"));
        // controller
        engine.getTemplate("code/controller/swagger-ui.ftl").render(params, new File(tempFileDir + "/swagger-ui.txt"));
        engine.getTemplate("code/controller/controller.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + "Controller.java"));
        // mybatis
        engine.getTemplate("code/dao/mapper.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + classInfo.getDaoSuffix() + ".java"));
        engine.getTemplate("code/dao/mybatis.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + "Mapper.xml"));
        // entity
        engine.getTemplate("code/entity/do.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + "DO.java"));
        engine.getTemplate("code/entity/dto.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + "DTO.java"));
        engine.getTemplate("code/entity/model.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + ".java"));
        // service
        engine.getTemplate("code/service/service.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + "Service.java"));
        engine.getTemplate("code/service/serviceImpl.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + "ServiceImpl.java"));
        // util
        engine.getTemplate("code/util/util.ftl").render(params, new File(tempFileDir + "/" + classInfo.getClassName() + "Util.txt"));
        return tempFileDir;
    }

    @Override
    public Map<String, String> getResultByParamsV2(Map<String, Object> params) {
        TemplateEngine engine = TemplateEngineUtil.INSTANCE;
        // result
        Map<String, String> result = new HashMap<>(32);
        result.put("tableName", params.get("tableName") + "");
        // bo
        result.put("bo", engine.getTemplate("code/bo/bo.ftl").render(params));
        result.put("boImpl", engine.getTemplate("code/bo/boImpl.ftl").render(params));
        // controller
        result.put("swagger-ui", engine.getTemplate("code/controller/swagger-ui.ftl").render(params));
        result.put("controller", engine.getTemplate("code/controller/controller.ftl").render(params));
        // mybatis
        result.put("mapper", engine.getTemplate("code/dao/mapper.ftl").render(params));
        result.put("mybatis", engine.getTemplate("code/dao/mybatis.ftl").render(params));
        // entity
        result.put("do", engine.getTemplate("code/entity/do.ftl").render(params));
        result.put("dto", engine.getTemplate("code/entity/dto.ftl").render(params));
        result.put("model", engine.getTemplate("code/entity/model.ftl").render(params));
        // service
        result.put("service", engine.getTemplate("code/service/service.ftl").render(params));
        result.put("serviceImpl", engine.getTemplate("code/service/serviceImpl.ftl").render(params));
        // util
        result.put("util", engine.getTemplate("code/util/util.ftl").render(params));
        return result;
    }
}
