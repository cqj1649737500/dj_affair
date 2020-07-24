package com.dj.ssm.controller;

import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.StuCourse;
import com.dj.ssm.pojo.StudentSelectCourse;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.ApplyCourseService;
import com.dj.ssm.service.StuCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 申请课程
 */
@RestController
@RequestMapping("/applyCourse/")
public class ApplyCourseController {

    @Autowired
    private ApplyCourseService applyCourseService;

    @Autowired
    private StuCourseService stuCourseService;

    @RequestMapping("AllCourseShow")
    public ResultModel AllCourseShow() {
        Map<String, Object> map = new HashMap<>();
        try {
            List<StudentSelectCourse> allPassCourse = applyCourseService.findAllPassCourse(1);
            map.put("list", allPassCourse);
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("错误");
        }

    }

    @RequestMapping("addStudentCourse")
    public ResultModel addStudentCourse(Integer[] ids, @SessionAttribute("user") User user) {
        try {
            List<StuCourse> stuCoursesList = new ArrayList<>();
            for (int i = 0; i < ids.length; i++) {
                StuCourse stuCourse = new StuCourse();
                stuCourse.setCourseId(ids[i]);
                stuCourse.setUserStudentId(user.getId());
                stuCoursesList.add(stuCourse);
            }
            boolean b = stuCourseService.saveBatch(stuCoursesList);
            if(b){
                return new ResultModel().success();
            }
            return new ResultModel().error("错误");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }

    }
}
