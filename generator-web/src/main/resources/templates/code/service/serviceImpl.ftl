package ${packageName}.service.impl;

import org.springframework.stereotype.Service;
import cn.hsa.hsaf.core.framework.HsafService;
import cn.hsa.hsaf.core.framework.web.WrapperResponse;
import com.github.pagehelper.PageHelper;
import cn.hsa.ais.common.bean.PageResultData;
import cn.hsa.cps.ext.utils.excel.CpsJsExcelUtil;
import ${packageName}.service.${classInfo.className}Service
import org.springframework.beans.factory.annotation.Autowired;
import lombok.extern.slf4j.Slf4j;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * ${classInfo.classComment}
 *
 * @author ${authorName}
 */
@Slf4j
@Service
public class ${classInfo.className}ServiceImpl extends HsafService implements ${classInfo.className}Service {

    @Autowired
	private ${classInfo.className}BO ${classInfo.className?uncap_first}BO;

	@Override
	public void insert(${classInfo.className}DTO ${classInfo.className?uncap_first}) {
		if (null == ${classInfo.className?uncap_first}) {
		    log.error("新增参数不能为空");
			return;
        }
		${classInfo.className?uncap_first}BO.insert(${classInfo.className?uncap_first});
	}


	@Override
	public void delete(${classInfo.className}DTO ${classInfo.className?uncap_first}) {
		if (null == ${classInfo.className?uncap_first}) {
		    log.error("删除参数不能为空");
			return;
        }
		${classInfo.className?uncap_first}BO.delete(${classInfo.className?uncap_first});
	}


	@Override
	public void update(${classInfo.className}DTO ${classInfo.className?uncap_first}) {
		if (null == ${classInfo.className?uncap_first}) {
		    log.error("修改参数不能为空");
			return;
        }
		${classInfo.className?uncap_first}BO.update(${classInfo.className?uncap_first});
	}


	@Override
	public ${classInfo.className}DTO query(String param) {
	    if(null == param || "".equals(param)){
            return new ${classInfo.className}DTO();
        }
		return ${classInfo.className?uncap_first}BO.query(param);
	}


	@Override
	public WrapperResponse<PageResultData<${classInfo.className}DTO>> pageQuery(${classInfo.className}VO query) {
        // 校验参数
        if (query.getPageSize() <= 0 || query.getPageNum() <= 0) {
            return WrapperResponse.fail("缺少分页参数", null);
        }
        // 分页查询
        PageHelper.startPage(query.getPageNum(), query.getPageSize());
		List<${classInfo.className}DTO> resultList = ${classInfo.className?uncap_first}BO.pageQuery(query);
		return WrapperResponse.success(PageResultData.trans(resultList));
	}

    @Override
    public void export(HttpServletResponse response, ${classInfo.className}VO ${classInfo.className?uncap_first}) throws IOException {
        List<${classInfo.className}DTO> resultList = ${classInfo.className?uncap_first}BO.pageQuery(${classInfo.className?uncap_first});
        CpsJsExcelUtil.exportExcel(resultList, response, "导出文件名", ${classInfo.className}DTO.class);
    }
}
