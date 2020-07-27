package com.dj.ssm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//@Configuration
public class WebConfiguration implements WebMvcConfigurer {

    @Autowired
    private MyInterceptor myInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //注入拦截器
        InterceptorRegistration interceptorRegistration = registry.addInterceptor(myInterceptor);
        //拦截的请求
        interceptorRegistration.addPathPatterns("/**");
        //放过的请求
        interceptorRegistration.excludePathPatterns("/user/login");
        interceptorRegistration.excludePathPatterns("/user/toLogin");
        interceptorRegistration.excludePathPatterns("/user/toRegister");
        interceptorRegistration.excludePathPatterns("/user/addUser");
        interceptorRegistration.excludePathPatterns("/user/findUserByUserNumber");

    }


}
