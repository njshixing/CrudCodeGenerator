package com.crud.generator.entity;

import lombok.Data;

/**
 * field info
 */
@Data
public class FieldInfo {

    private String columnName;
    private String fieldName;
    private String fieldClass;
    private String fieldComment;

}
