package ${packageName}.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import ${packageName}.service.${classInfo.className}Service

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd HH:mm:ss')}
 */
@RestController
@RequestMapping(value = "/${classInfo.className}")
public class ${classInfo.className}Controller {

    @Resource
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

    /**
    * 新增
    **/
    @RequestMapping("/insert")
    public ReturnT<String> insert(${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Service.insert(${classInfo.className?uncap_first});
    }

    /**
    * 刪除
    **/
    @RequestMapping("/delete")
    public ReturnT<String> delete(int id){
        return ${classInfo.className?uncap_first}Service.delete(id);
    }

    /**
    * 更新
    **/
    @RequestMapping("/update")
    public ReturnT<String> update(${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first});
    }

    /**
    * 查询 根据主键 id 查询
    **/
    @RequestMapping("/load")
    public ReturnT<String> load(int id){
        return ${classInfo.className?uncap_first}Service.load(id);
    }

    /**
    * 查询 分页查询
    **/
    @RequestMapping("/pageList")
    public Map<String, Object> pageList(@RequestParam(required = false, defaultValue = "0") int offset,
                                        @RequestParam(required = false, defaultValue = "10") int pageSize) {
        return ${classInfo.className?uncap_first}Service.pageList(offset, pageSize);
    }
}
