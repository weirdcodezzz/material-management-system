package com.luo.materialmanagement.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author luo Fuqiang
 * @date 2020/12/4 20:08
 */
@Configuration
@EnableWebMvc
@EnableSwagger2
@ComponentScan(basePackages = "com.luo.materialmanagement")
public class SwaggerConfig {

    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                //显示所有类
                .apis(RequestHandlerSelectors.any())
                //只显示添加@Api注解的类
                //.apis(RequestHandlerSelectors.withClassAnnotation(Api.class))
                .build()
                .apiInfo(apiInfo());
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                //粗标题
                .title("开放接口API")
                //描述
                .description("HTTP对外开放接口")
                //api version
                .version("1.0.0")
                .termsOfServiceUrl("http://xxx.xxx.com")
                //链接名称
                .license("LICENSE")
                //链接地址
                .licenseUrl("http://xxx.xxx.com")
                .build();
    }
}
