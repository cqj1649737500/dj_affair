package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * 用户
 */
@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public ResultModel<Object> login(User user){
        try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user_name", user.getUserName());
            queryWrapper.eq("user_pwd", user.getUserPwd());

            User selectOneUser = userService.getOne(queryWrapper);
            if(null != selectOneUser){
                return new ResultModel<Object>().success();
            }
            return new ResultModel<Object>().error("用户名密码错误");
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }

    @RequestMapping("addUser")
    public ResultModel<Object> addUser(User user){
        try {

            boolean save = userService.save(user);
            if(save){
                return new ResultModel<Object>().success();
            }
            return new ResultModel<Object>().error("添加错误");
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }

    @RequestMapping("findUserByUserNumber")
    public Boolean findUserByUserNumber(String userNumber){
        try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user_number", userNumber);
            User selectOneUser = userService.getOne(queryWrapper);
            if(null == selectOneUser){
                return true;
            }
            return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

}
