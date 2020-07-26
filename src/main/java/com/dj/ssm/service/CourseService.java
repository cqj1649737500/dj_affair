package com.dj.ssm.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Course;
import org.springframework.dao.DataAccessException;

import java.util.List;

import java.rmi.server.ExportException;
import java.util.List;

public interface CourseService extends IService<Course> {

    IPage<Course> findCourseAll (IPage<Course> page, Integer id) throws ExportException;

    List<Course> findStudentSelfGrade(Integer id) throws Exception;
}
