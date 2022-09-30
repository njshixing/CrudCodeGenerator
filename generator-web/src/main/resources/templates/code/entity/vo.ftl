package ${packageName}.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import lombok.Data;
import java.util.Date;
import java.util.List;

/**
 * ${classInfo.classComment}
 * @author ${authorName}
 */
@Data
@ApiModel("${classInfo.classComment}")
public class ${classInfo.className}VO implements Serializable{
    private static final long serialVersionUID = 1L;

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
<#list classInfo.fieldList as fieldItem >
    @ApiModelProperty("${fieldItem.fieldComment}")
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};
</#list>
</#if>

}
