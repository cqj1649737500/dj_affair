package com.dj.ssm.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户
 */
@Controller
@RequestMapping("/user/")
public class UserPageController {

    @RequestMapping("toLogin")
    public String toLogin(){
        return "/user/login";
    }

    @RequestMapping("toRegister")
    public String toRegister(){
        return "/user/register";
    }
}
