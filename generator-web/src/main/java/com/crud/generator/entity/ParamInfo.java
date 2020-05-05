package com.crud.generator.entity;

import lombok.Data;

/**
 * 入参
 */
@Data
public class ParamInfo {
    private String tableSql;
    private String authorName;
    private String packageName;
    private String returnUtil;
    private String nameCaseType;
    private String tinyintTransType;
    private String dataType;
    private String className;
    private String daoSuffix;
    private boolean swagger;

    @Data
    public static class NAME_CASE_TYPE {
        public static String CAMEL_CASE = "CamelCase";
        public static String UNDER_SCORE_CASE = "UnderScoreCase";
        public static String UPPER_UNDER_SCORE_CASE = "UpperUnderScoreCase";
    }
}
