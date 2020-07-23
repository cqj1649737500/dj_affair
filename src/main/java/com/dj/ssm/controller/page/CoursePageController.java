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
}
