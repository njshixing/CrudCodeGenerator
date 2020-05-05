package ${packageName}.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd HH:mm:ss')}
 */
@Mapper
public interface ${classInfo.className}${classInfo.daoSuffix} {

    /**
    * 新增
    **/
    int insert(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 刪除
    **/
    int delete(int id);

    /**
    * 更新
    **/
    int update(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 查询 根据主键 id 查询
    **/
    ${classInfo.className} load(int id);

    /**
    * 查询 分页查询
    **/
    List<${classInfo.className}> pageList(int offset,int pageSize);

    /**
    * 查询 分页查询 count
    **/
    int pageListCount(int offset,int pageSize);

}
