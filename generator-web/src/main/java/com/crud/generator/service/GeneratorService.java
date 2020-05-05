package com.crud.generator.service;

import freemarker.template.TemplateException;

import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * GeneratorService
 */
public interface GeneratorService {

    Map<String, String> getResultByParams(Map<String, Object> params) throws IOException, TemplateException;

    Map<String, String> getResultByParamsV2(Map<String, Object> params) throws IOException, TemplateException;

    File getFileByParams(Map<String, Object> params) throws IOException, TemplateException;
}
