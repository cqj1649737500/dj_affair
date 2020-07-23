package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.pojo.Course;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 课程
 */
@RestController
@RequestMapping("/course/")
public class CourseController {

    @Autowired
    private CourseService courseService;

    /**
     * qzh
     * 添加课程
     * @param course
     * @return
     */
    @RequestMapping("add")
    public ResultModel add(Course course){
        try {
            QueryWrapper<Course> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("course_number", course.getCourseNumber());
            Course selectCourseNumber = courseService.getOne(queryWrapper);
            if(null != selectCourseNumber){
                QueryWrapper<Course> queryWrapper1 = new QueryWrapper<>();
                queryWrapper1.eq("course_number", course.getCourseNumber());
                boolean updateCourse = courseService.update(course, queryWrapper1);
                if(updateCourse){
                    return new ResultModel<Object>().success();
                }
                return new ResultModel<Object>().error("修改失败");
            }else {
                boolean save = courseService.save(course);
                if(save){
                    return new ResultModel<Object>().success();
                }
                return new ResultModel<Object>().error("添加失败");
            }


        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }


}
