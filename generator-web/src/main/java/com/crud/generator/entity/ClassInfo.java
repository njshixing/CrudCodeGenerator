package com.crud.generator.entity;

import lombok.Data;

import java.util.List;

/**
 * class info
 */
@Data
public class ClassInfo {

    private String tableName;
    private String className;
    private String daoSuffix;
    private String classComment;
    private List<FieldInfo> fieldList;

}