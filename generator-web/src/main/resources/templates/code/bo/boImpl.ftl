package ${packageName}.bo.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import ${packageName}.bo.${classInfo.className}BO;
import ${packageName}.entity.${classInfo.className}DTO;
import ${packageName}.entity.${classInfo.className}VO;
import cn.hsa.hsaf.core.framework.HsafBO;
import lombok.extern.slf4j.Slf4j;
import com.google.common.collect.Lists;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * ${classInfo.classComment}
 *
 * @author ${authorName}
 */
@Slf4j
@Service
public class ${classInfo.className}BOImpl extends HsafBO implements ${classInfo.className}BO {

	@Autowired
	private ${classInfo.className}${classInfo.daoSuffix} ${classInfo.className?uncap_first}${classInfo.daoSuffix};

	@Override
	public void insert(${classInfo.className}DTO ${classInfo.className?uncap_first}) {
		if (null == ${classInfo.className?uncap_first}) {
		    log.error("新增参数不能为空");
			return;
        }
		${classInfo.className?uncap_first}DAO.insert(${classInfo.className?uncap_first});
	}


	@Override
	public void delete(${classInfo.className}DTO ${classInfo.className?uncap_first}) {
		if (null == ${classInfo.className?uncap_first}) {
		    log.error("删除参数不能为空");
			return;
        }
		${classInfo.className?uncap_first}DAO.delete(${classInfo.className?uncap_first});
	}


	@Override
	public void update(${classInfo.className}DTO ${classInfo.className?uncap_first}) {
		if (null == ${classInfo.className?uncap_first}) {
		    log.error("修改参数不能为空");
			return;
        }
		${classInfo.className?uncap_first}DAO.update(${classInfo.className?uncap_first});
	}


	@Override
	public ${classInfo.className}DTO query(String param) {
	    if(null == param || "".equals(param)){
            return new ${classInfo.className}DTO();
        }
		return ${classInfo.className?uncap_first}DAO.query(param);
	}


	@Override
	public List<${classInfo.className}DTO> pageQuery(${classInfo.className}VO ${classInfo.className?uncap_first}) {
        if (null == ${classInfo.className?uncap_first}) {
		    log.error("查询参数不能为空");
			return Lists.newArrayList();
        }
		return ${classInfo.className?uncap_first}DAO.pageQuery(${classInfo.className?uncap_first});
	}

}
