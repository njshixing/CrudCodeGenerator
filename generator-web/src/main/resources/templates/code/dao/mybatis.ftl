<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${packageName}.dao.${classInfo.className}${classInfo.daoSuffix}">

    <resultMap id="BaseResultMap" type="${packageName}.entity.${classInfo.className}DTO" >
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
                <result column="${fieldItem.columnName}" property="${fieldItem.fieldName}" />
            </#list>
        </#if>
    </resultMap>

    <sql id="Base_Column_List">
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
                ${fieldItem.columnName}<#if fieldItem_has_next>,</#if>
            </#list>
        </#if>
    </sql>

    <insert id="insert" parameterType="${packageName}.entity.${classInfo.className}DTO">
        INSERT INTO ${classInfo.tableName} <include refid="Base_Column_List" />
        VALUES (
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                <#list classInfo.fieldList as fieldItem >
                    ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>
                </#list>
            </#if>
        )
    </insert>

    <delete id="delete" >
        DELETE FROM ${classInfo.tableName}
        WHERE
            <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName != "id" && fieldItem.columnName != "crteTime" && fieldItem.columnName != "updtTime" >
                    ${r'<if test ='}${r'"'}null != "${fieldItem.fieldName} and '' != ${fieldItem.fieldName} ${r'">'}${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>${r"</if>"}
                </#if>
            </#list>
    </delete>

    <update id="update">
        UPDATE ${classInfo.tableName}
        WHERE
            <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName != "id" && fieldItem.columnName != "crteTime" && fieldItem.columnName != "updtTime" >
                    ${r'<if test ='}${r'"'}null != "${fieldItem.fieldName} and '' != ${fieldItem.fieldName} ${r'">'}${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>${r"</if>"}
                </#if>
            </#list>
    </update>

    <select id="query" resultMap="BaseResultMap">
        SELECT <include refid="Base_Column_List" />
        FROM ${classInfo.tableName}
        WHERE
            <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName != "id" && fieldItem.columnName != "crteTime" && fieldItem.columnName != "updtTime" >
                    ${r'<if test ='}${r'"'}null != "${fieldItem.fieldName} and '' != ${fieldItem.fieldName} ${r'">'}${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>${r"</if>"}
                </#if>
            </#list>
    </select>

    <select id="pageQuery" resultMap="BaseResultMap">
        SELECT <include refid="Base_Column_List" />
        FROM ${classInfo.tableName}
        WHERE
            <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName != "id" && fieldItem.columnName != "crteTime" && fieldItem.columnName != "updtTime" >
                    ${r'<if test ='}${r'"'}null != "${fieldItem.fieldName} and '' != ${fieldItem.fieldName} ${r'">'}${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>${r"</if>"}
                </#if>
            </#list>
    </select>
</mapper>