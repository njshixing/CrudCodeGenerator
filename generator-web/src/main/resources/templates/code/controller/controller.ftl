package ${packageName}.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import ${packageName}.service.${classInfo.className}Service
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * ${classInfo.classComment}
 *
 * @author ${authorName}
 */
@Slf4j
@RestController
@RequestMapping(value = "/web/${classInfo.className}")
public class ${classInfo.className}Controller {

    @Autowired
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

    @PostMapping("/insert")
    public WrapperResponse<String> insert(${classInfo.className}DTO ${classInfo.className?uncap_first}){
        ${classInfo.className?uncap_first}Service.insert(${classInfo.className?uncap_first});
        return WrapperResponse.success("success");
    }

    @PostMapping("/delete")
    public WrapperResponse<String> delete(${classInfo.className}DTO ${classInfo.className?uncap_first}){
        ${classInfo.className?uncap_first}Service.delete(id);
        return WrapperResponse.success("success");
    }

    @PostMapping("/update")
    public WrapperResponse<String> update(${classInfo.className}DTO ${classInfo.className?uncap_first}){
        ${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first});
        return WrapperResponse.success("success");
    }

    @GetMapping("/query")
    public WrapperResponse<${classInfo.className}DTO> query(@RequestParam String param){
        return ${classInfo.className?uncap_first}Service.load(param);
    }

    @PostMapping("/pageList")
    public WrapperResponse<PageResultData<${classInfo.className}DTO>> pageList(@RequestBody ${classInfo.className}VO ${classInfo.className?uncap_first}) {
        return ${classInfo.className?uncap_first}Service.pageQuery(${classInfo.className?uncap_first});
    }

    @PostMapping("/export")
    public void export(@RequestBody ${classInfo.className}VO ${classInfo.className?uncap_first}, HttpServletResponse response) throws IOException {
        ${classInfo.className?uncap_first}Service.export(response,${classInfo.className?uncap_first});
    }
}
