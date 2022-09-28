package ${packageName}.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

/**
 * ${classInfo.classComment}
 *
 * @author ${authorName}
 */
public interface ${classInfo.className}${classInfo.daoSuffix} {

    /**
    * 新增
    *
    * @param ${classInfo.className?uncap_first} ${classInfo.className?uncap_first}
    */
    void insert(@Param("dto") ${classInfo.className}DTO ${classInfo.className?uncap_first});

    /**
    * 删除
    *
    * @param ${classInfo.className?uncap_first} ${classInfo.className?uncap_first}
    */
    void delete(@Param("dto") ${classInfo.className}DTO ${classInfo.className?uncap_first});

    /**
    * 更新
    *
    * @param ${classInfo.className?uncap_first} ${classInfo.className?uncap_first}
    */
    void update(@Param("dto") ${classInfo.className}DTO ${classInfo.className?uncap_first});

    /**
    * 查询单条记录
    *
    * @param param 查询参数
    */
    ${classInfo.className}DTO query(@Param("param") String param);

    /**
    * 分页查询
    *
    * @param ${classInfo.className?uncap_first}VO 分页查询参数
    */
    List<${classInfo.className}DTO> pageQuery(@Param("vo") ${classInfo.className}VO ${classInfo.className?uncap_first}VO);
}
