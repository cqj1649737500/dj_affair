package com.dj.ssm.controller;

import com.dj.ssm.pojo.*;
import com.dj.ssm.service.StuGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.rmi.server.ExportException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/grade/")
/**
 * 成绩
 */
public class StuGradeController {

    @Autowired
    private StuGradeService stuGradeService;

    /**
     * 学生分数信息
     * @param userId
     * @param courseId
     * @return
     */
    @RequestMapping("studentMack")
    public ResultModel studentMack(Integer userId, Integer courseId) {
        try {
            List<StudentQuery> studentList = stuGradeService.findStudent(userId, courseId);
            return new ResultModel().success(studentList);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * 进行评分
     * @param stuGrade
     * @return
     */
    @RequestMapping("updateMack")
    public ResultModel updateMack(StuGrade stuGrade) {
        try {
            stuGradeService.updateById(stuGrade);
            return new ResultModel().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

}
