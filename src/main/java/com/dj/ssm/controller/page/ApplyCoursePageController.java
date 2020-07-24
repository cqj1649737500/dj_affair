package com.dj.ssm.controller.page;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.pojo.StuCourse;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.StuCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

/**
 * 申请课程
 */
@Controller
@RequestMapping("/applyCourse/")
public class ApplyCoursePageController {


    @Autowired
    private StuCourseService stuCourseService;

    @RequestMapping("toAllCourseShow")
    public String toAllCourseShow(@SessionAttribute("user") User user, Model model){
        QueryWrapper<StuCourse> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_student_id", user.getId());
        queryWrapper.eq("status", 0);
        List<StuCourse> list = stuCourseService.list(queryWrapper);
        model.addAttribute("number", list.size());

        return "/course/allCourseAndTeacherShow";
    }

    /**
     * qzh
     * 展示
     */
    @RequestMapping("toApplyCourseShow")
    public String toApplyCourseShow(){
        return "/apply_course/apply_course_show";
    }
}
