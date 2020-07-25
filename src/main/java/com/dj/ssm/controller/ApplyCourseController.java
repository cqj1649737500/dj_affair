package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.pojo.*;
import com.dj.ssm.service.ApplyCourseService;
import com.dj.ssm.service.StuCourseService;
import com.dj.ssm.service.StuTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import java.util.*;

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

    @Autowired
    private StuTeacherService stuTeacherService;

    @RequestMapping("AllCourseShow")
    public ResultModel AllCourseShow(@SessionAttribute("user") User user) {
        Map<String, Object> map = new HashMap<>();
        try {
            List<StudentSelectCourse> allPassCourse = applyCourseService.findAllPassCourse(1, user.getId());
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
            QueryWrapper<ApplyCourse> queryWrapper = new QueryWrapper<>();
            queryWrapper.in("id", ids);
            List<ApplyCourse> applyCourseList = applyCourseService.list(queryWrapper);

            List<StuCourse> stuCoursesList = new ArrayList<>();
            List<StuTeacher> stuTeacherList = new ArrayList<>();
            for (ApplyCourse applyCourse : applyCourseList) {
                StuCourse stuCourse = new StuCourse();
                stuCourse.setStatus(0);
                stuCourse.setCourseId(applyCourse.getCourseId());
                stuCourse.setUserStudentId(user.getId());
                stuCoursesList.add(stuCourse);

                StuTeacher stuTeacher = new StuTeacher();
                stuTeacher.setUserTeacherId(applyCourse.getUserTeacherId());
                stuTeacher.setUserStuId(user.getId());
                stuTeacherList.add(stuTeacher);

            }
            boolean b = stuCourseService.saveBatch(stuCoursesList);
            boolean b1 = stuTeacherService.saveBatch(stuTeacherList);
            if(b && b1){
            return new ResultModel().success();
            }
            return new ResultModel().error("错误");

//            List<StuCourse> stuCoursesList = new ArrayList<>();
//            for (int i = 0; i < ids.length; i++) {
//                StuCourse stuCourse = new StuCourse();
//                stuCourse.setCourseId(ids[i]);
//                stuCourse.setUserStudentId(user.getId());
//                stuCourse.setStatus(0);
//                stuCoursesList.add(stuCourse);
//
//            }
//            QueryWrapper<ApplyCourse> queryWrapper = new QueryWrapper<>();
//            queryWrapper.in("course_id", ids);
//            List<ApplyCourse> applyCourseList = applyCourseService.list(queryWrapper);
//            Set<Integer> teacherIdSet = new HashSet<>();
//            for (ApplyCourse applyCourse : applyCourseList) {
//                teacherIdSet.add(applyCourse.getUserTeacherId());
//            }
//            List<StuTeacher> stuTeacherList = new ArrayList<>();
//            for (Integer teacherId : teacherIdSet) {
//                StuTeacher stuTeacher = new StuTeacher();
//                stuTeacher.setUserStuId(user.getId());
//                stuTeacher.setUserTeacherId(teacherId);
//                stuTeacherList.add(stuTeacher);
//            }
//            boolean b = stuCourseService.saveBatch(stuCoursesList);
//            boolean b1 = stuTeacherService.saveBatch(stuTeacherList);
//            if(b && b1){
//                return new ResultModel().success();
//            }
//            return new ResultModel().error("错误");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }

    }

    /**
     * 授课
     * @param user
     * @param ids
     * @return
     */
    @RequestMapping("toSchooling")
    public ResultModel<Object> toSchooling(@SessionAttribute("user") User user, Integer[] ids) {
        try {
            QueryWrapper<ApplyCourse> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user_teacher_id", user.getId());
            queryWrapper.lt("status", 2);
            List<ApplyCourse> applyCourseList = applyCourseService.list(queryWrapper);
            if (applyCourseList.size() == 2){
                return new ResultModel<>().error("已经授课两门课程，不能继续授课");
            }
            if (applyCourseList.size() == 1 && ids.length !=1){
                return new ResultModel<>().error("还剩一门课程授课选择");
            }
            List<ApplyCourse> list = new ArrayList<>();
            for (Integer id : ids) {
                ApplyCourse applyCourse = new ApplyCourse();
                applyCourse.setCourseId(id);
                applyCourse.setUserTeacherId(user.getId());
                applyCourse.setStatus(0);
                list.add(applyCourse);
            }
            applyCourseService.saveBatch(list);
            return new ResultModel().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }

    /**
     * qzh
     * 展示授课表
     * @return
     */
    @RequestMapping("applyCourseShow")
    public ResultModel applyCourseShow() {
        Map<String, Object> map = new HashMap<>();
        try {
            List<ApplyCourse> list = applyCourseService.findAll();
            map.put("list", list);
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }

    }

    /**
     * qzh
     * 修改状态 审批通过
     *
     *
     * @return
     */
    @RequestMapping("updateStatus")
    public ResultModel updateStatus(ApplyCourse applyCourse, @SessionAttribute ("user") User user){
        try {
            ApplyCourse a = applyCourseService.getById(applyCourse.getId());
            if (a.getStatus() != 0){
                return  new ResultModel().error("已审批");
            }
            applyCourse.setUserAdminId(user.getId());
            applyCourseService.updateById(applyCourse);
            return new ResultModel().success();
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }
}
