package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.pojo.Course;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.StuCourse;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.CourseService;
import com.dj.ssm.service.StuCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 课程
 */
@RestController
@RequestMapping("/course/")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private StuCourseService stuCourseService;

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

    @RequestMapping("studentCourseShow")
    public ResultModel studentCourseShow(@SessionAttribute("user") User user) {
        Map<String, Object> map = new HashMap<>();
        try {
            List<Course> studentSelfGrade = courseService.findStudentSelfGrade(user.getId());
            map.put("studentSelfGrade", studentSelfGrade);
            return new ResultModel<>().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }
        /**
         * 课程展示
         * zyt
         * @param pageNo
         * @return
         */
        @RequestMapping("courseShowAll")
        public ResultModel courseShowAll(Integer pageNo, @SessionAttribute("user") User user) {
            Map<String, Object> map = new HashMap<>();
            try {
                List<Course> list = courseService.findCourseAll(user.getId());
                map.put("list", list);
                return new ResultModel().success(map);
            } catch (Exception e) {
                e.printStackTrace();
                return new ResultModel().error("服务器异常");
            }
        }

    /**
     * 已选课程展示
     * cqj
     * @param user
     * @return
     */
    @RequestMapping("courseStudentSelfShow")
    public ResultModel courseStudentSelfShow(@SessionAttribute("user") User user){
        Map<String, Object> map = new HashMap<>();
        try {
            QueryWrapper<StuCourse> queryWrapper1 = new  QueryWrapper<StuCourse>();
            queryWrapper1.eq("user_student_id", user.getId());
            List<StuCourse> list1 = stuCourseService.list(queryWrapper1);
            List<Integer> ids = new ArrayList<>();
            for (StuCourse stuCourse : list1) {
                ids.add(stuCourse.getCourseId());
            }
            QueryWrapper<Course> queryWrapper = new  QueryWrapper<Course>();
            queryWrapper.in("id", ids);
            List<Course> list2 = courseService.list(queryWrapper);
            map.put("list", list2);
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }


    }
}
