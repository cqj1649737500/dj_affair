package com.dj.ssm.controller.page;

import com.dj.ssm.pojo.User;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户
 */
@Controller
@RequestMapping("/user/")
public class UserPageController {

    @Autowired
    private UserService userService;

    @RequestMapping("toLogin")
    public String toLogin(){
        return "/user/login";
    }

    @RequestMapping("toRegister")
    public String toRegister(){
        return "/user/register";
    }

    @RequestMapping("toShow")
    public String toShow(){
        return "/user/teacher_show";
    }

    @RequestMapping("toStudentShow")
    public String toStudentShow(){
        return "/user/student_show";
    }

    @RequestMapping("toUpdateTea/{id}")
    public String toUpdateTea(@PathVariable Integer id, Model model) {
        User user = userService.getById(id);
        model.addAttribute("user", user);
        return "/user/update_teacher";
    }

    @RequestMapping("toStudentShowAll")
    public String toStudentShowAll(){
        return "/user/student_showAll";
    }

    @RequestMapping("toUpdateStudent/{id}")
    public String toUpdateStudent(@PathVariable Integer id, Model model) {
        User user = userService.getById(id);
        model.addAttribute("user", user);
        return "/user/update_student";
    }

    /**
     * qzh
     * 展示老师
     * @return
     */
    @RequestMapping("toTeacherShow")
    public String toTeacherShow(){
        return "/user/root_teacher_show";
    }

    /**
     * qzh
     * 修改老师
     * @return
     */
    @RequestMapping("toUpdateTeacher/{id}")
    public String toUpdateTeacher(@PathVariable Integer id, Model model){
        User user = userService.getById(id);
        model.addAttribute("user", user);
        return "/user/root_update_teacher";
    }

}
