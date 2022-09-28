package ${packageName}.service;

import cn.hsa.hsaf.core.framework.web.WrapperResponse;
import cn.hsa.ais.common.bean.PageResultData;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.io.IOException;

/**
 * ${classInfo.classComment}
 *
 * @author ${authorName}
 */
public interface ${classInfo.className}Service {

    /**
    * 新增
    *
    * @param ${classInfo.className?uncap_first} ${classInfo.className?uncap_first}
    */
    void insert(${classInfo.className}DTO ${classInfo.className?uncap_first});

    /**
    * 删除
    *
    * @param ${classInfo.className?uncap_first} ${classInfo.className?uncap_first}
    */
    void delete(${classInfo.className}DTO ${classInfo.className?uncap_first});

    /**
    * 更新
    *
    * @param ${classInfo.className?uncap_first} ${classInfo.className?uncap_first}
    */
    void update(${classInfo.className}DTO ${classInfo.className?uncap_first});

    /**
    * 查询单条记录
    *
    * @param param 查询参数
    */
    ${classInfo.className}DTO query(String param);

    /**
    * 分页查询
    *
    * @param ${classInfo.className?uncap_first} 分页查询参数
    */
    WrapperResponse<PageResultData<${classInfo.className}DTO>> pageQuery(${classInfo.className}VO ${classInfo.className?uncap_first});

    /**
     * 导出
     *
     * @param response the response
     * @param ${classInfo.className?uncap_first} 查询参数
     * @throws IOException IO异常
     */
    void export(HttpServletResponse response, ${classInfo.className}VO ${classInfo.className?uncap_first}) throws IOException;
}
