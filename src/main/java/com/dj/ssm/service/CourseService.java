package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Course;

import java.rmi.server.ExportException;
import java.util.List;

public interface CourseService extends IService<Course> {

    List<Course> findCourseAll () throws ExportException;
}
