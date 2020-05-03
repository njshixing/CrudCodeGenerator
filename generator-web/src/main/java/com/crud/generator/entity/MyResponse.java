package com.crud.generator.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * common return
 */
@Data
public class MyResponse<T> implements Serializable {
    public static final long serialVersionUID = 42L;

    public static final int SUCCESS_CODE = 200;
    public static final int FAIL_CODE = 500;
    public static final MyResponse<String> SUCCESS = new MyResponse<>(null);
    public static final MyResponse<String> FAIL = new MyResponse<>(FAIL_CODE, null);

    private int code;
    private String msg;
    private T data;

    public MyResponse(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public MyResponse(T data) {
        this.code = SUCCESS_CODE;
        this.data = data;
    }

}
