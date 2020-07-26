package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.CourseMapper;
import com.dj.ssm.pojo.Course;
import com.dj.ssm.service.CourseService;
import org.springframework.stereotype.Service;

import java.rmi.server.ExportException;
import java.util.List;

@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements CourseService {

    @Override
    public IPage<Course> findCourseAll (IPage<Course> page, Integer id) throws ExportException {
        return getBaseMapper().findCourseAll(page, id);
    }


    @Override
    public List<Course> findStudentSelfGrade(Integer id) throws Exception {
        return getBaseMapper().findStudentSelfGrade(id);
    }
}
