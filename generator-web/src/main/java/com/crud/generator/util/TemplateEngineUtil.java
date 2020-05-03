package com.crud.generator.util;

import cn.hutool.extra.template.TemplateConfig;
import cn.hutool.extra.template.TemplateEngine;
import cn.hutool.extra.template.TemplateUtil;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;

/**
 * freemarker tool
 */
@Slf4j
public class TemplateEngineUtil {

    public static final TemplateEngine INSTANCE =
            TemplateUtil.createEngine(new TemplateConfig("templates", TemplateConfig.ResourceMode.CLASSPATH));

    private TemplateEngineUtil() {
    }
//    /**
//     * freemarker config
//     */
//    private static TemplateConfig freemarkerConfig = new TemplateConfig(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
//
//    static {
//        String templatePath = Objects.requireNonNull(Thread.currentThread().getContextClassLoader().getResource("")).getPath();
//        int wei = templatePath.lastIndexOf("WEB-INF/classes/");
//        if (wei > -1) {
//            templatePath = templatePath.substring(0, wei);
//        }
//
//        try {
//            freemarkerConfig.setDirectoryForTemplateLoading(new File(templatePath, "templates/xxl-code-generator"));
//            freemarkerConfig.setNumberFormat("#");
//            freemarkerConfig.setClassicCompatible(true);
//            freemarkerConfig.setDefaultEncoding("UTF-8");
//            freemarkerConfig.setLocale(Locale.CHINA);
//            freemarkerConfig.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
//        } catch (IOException e) {
//            log.error(e.getMessage(), e);
//        }
//    }
//
//    /**
//     * process Template Into String
//     *
//     * @param template
//     * @param model
//     * @return
//     * @throws IOException
//     * @throws TemplateException
//     */
//    public static String processTemplateIntoString(Template template, Object model)
//            throws IOException, TemplateException {
//
//        StringWriter result = new StringWriter();
//        template.process(model, result);
//        return result.toString();
//    }
//
//    /**
//     * process String
//     *
//     * @param templateName
//     * @param params
//     * @return
//     * @throws IOException
//     * @throws TemplateException
//     */
//    public static String processString(String templateName, Map<String, Object> params)
//            throws IOException, TemplateException {
//
//        Template template = freemarkerConfig.getTemplate(templateName);
//        String htmlText = processTemplateIntoString(template, params);
//        return htmlText;
//    }
}
