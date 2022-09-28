package ${packageName}.bo;

import ${packageName}.entity.${classInfo.className}DTO;
import ${packageName}.entity.${classInfo.className}VO;
import java.util.List;

/**
 *
 * ${classInfo.classComment}
 *
 * @author ${authorName}
 */
public interface ${classInfo.className}BO {

    /**
    * 新增
    *
    * @param ${classInfo.className?uncap_first} ${classInfo.className?uncap_first}
    */
    public void insert(${classInfo.className}DTO ${classInfo.className?uncap_first});

    /**
    * 删除
    *
    * @param ${classInfo.className?uncap_first} ${classInfo.className?uncap_first}
    */
    public void delete(${classInfo.className}DTO ${classInfo.className?uncap_first});

    /**
    * 更新
    *
    * @param ${classInfo.className?uncap_first} ${classInfo.className?uncap_first}
    */
    public void update(${classInfo.className}DTO ${classInfo.className?uncap_first});

    /**
    * 查询单条记录
    *
    * @param param 查询参数
    */
    public ${classInfo.className}DTO query(String param);

    /**
    * 分页查询
    *
    * @param ${classInfo.className?uncap_first}VO 分页查询参数
    */
    public List<${classInfo.className}DTO> pageQuery(${classInfo.className}VO ${classInfo.className?uncap_first}VO);

}
