package com.luo.materialmanagement.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 重新定义swagger忽略属性的注解
 *
 * @author luo fuqiang
 */
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface IgnoreSwaggerParameter {
}
