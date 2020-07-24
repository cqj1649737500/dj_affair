package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Course;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CourseService extends IService<Course> {

    List<Course> findStudentSelfGrade(Integer id) throws Exception;
}
