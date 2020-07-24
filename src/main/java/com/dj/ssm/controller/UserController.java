package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.ssm.config.SysConstant;
import com.dj.ssm.pojo.*;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户
 */
@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public ResultModel<Object> login(User user, HttpSession session){
        try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user_name", user.getUserName());
            queryWrapper.eq("user_pwd", user.getUserPwd());

            User selectOneUser = userService.getOne(queryWrapper);
            session.setAttribute("user", selectOneUser);
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

    /**
     * 教师信息展示
     * @param user
     * @return
     */
    @RequestMapping("teacherShow")
    public ResultModel teacherShow(@SessionAttribute("user") User user) {
        Map<String, Object> map = new HashMap<>();
        try {
            List<User> list = new ArrayList<>();
            User u = userService.getById(user.getId());
            list.add(u);
            map.put("list", list);
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * 学生信息展示
     * @param user
     * @return
     */
    @RequestMapping("studentShow")
    public ResultModel studentShow(@SessionAttribute("user") User user) {
        Map<String, Object> map = new HashMap<>();
        try {
            List<User> list = new ArrayList<>();
            User u = userService.getById(user.getId());
            list.add(u);
            map.put("list", list);
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * 修改教师信息
     * @param user
     * @return
     */
    @RequestMapping("updateTeacher")
    public ResultModel updateTeacher(User user) {
        try {
            userService.updateById(user);
            return new ResultModel<Object>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    @RequestMapping("studentShowAll")
    public ResultModel studentShowAll(@SessionAttribute("user") User user, Integer pageNo) {
        Map<String, Object> map = new HashMap<>();
        try {
            List<UserQuery> list = userService.findByStudent(user);
            map.put("list", list);
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * 修改学生信息
     * @param user
     * @return
     */
    @RequestMapping("updateStudent")
    public ResultModel updateStudent(User user) {
        try {
            userService.updateById(user);
            return new ResultModel<Object>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * 展示所有老师
     * @param user root查看的老师
     * @return
     */
    @RequestMapping("RootTeacherShow")
    public ResultModel RootTeacherShow(@SessionAttribute("user") User user) {
        Map<String, Object> map = new HashMap<>();
        try {
            if (user.getLevel() == 0) {
                QueryWrapper<User> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("level", 1);
                List<User> list = userService.list(queryWrapper);
                map.put("list", list);
                return new ResultModel<Object>().success(map);
            }
            return new ResultModel().error("服务器异常");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }
}
