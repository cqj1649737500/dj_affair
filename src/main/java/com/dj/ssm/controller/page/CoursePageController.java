package com.dj.ssm.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 课程
 */
@Controller
@RequestMapping("/course/")
public class CoursePageController {

    /**
     * qzh
     * 去添加
     * @return
     */
    @RequestMapping("toAdd")
    public String toAdd(){
        return "/course/add";
    }

    @RequestMapping("toCourseShow")
    public String toCourseShow(){
        return "/course/course_showAll";
    }

    /**
     * YC
     * 展示自己的成绩
     * @return
     */
    @RequestMapping("toShowGrade")
    public String toShowMyselfGrade(){
        return "/course/toShowMyselfGrade";
    }

    /**
     * cqj
     * 展示自己的课程
     * @return
     */
    @RequestMapping("showStudentCourseBySelf")
    public String showStudentBySelf(){
        return "/course/toShowStudentCourse";
    }
}
