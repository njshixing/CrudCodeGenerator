package com.crud.generator.config;

import javax.servlet.http.HttpServletRequest;

import com.crud.generator.entity.MyResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalDefaultExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public MyResponse defaultExceptionHandler(HttpServletRequest req, Exception e) {
        e.printStackTrace();
        return new MyResponse<>(MyResponse.FAIL_CODE, e.getMessage());
    }

}
