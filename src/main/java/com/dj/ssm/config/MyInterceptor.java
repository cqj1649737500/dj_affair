package com.dj.ssm.config;

import com.dj.ssm.pojo.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class MyInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("拦截器");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(null == user){
            response.sendRedirect(request.getContextPath() + "/user/toLogin");
        }
        return true;


    }
}
