package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.ApplyCourseMapper;
import com.dj.ssm.pojo.ApplyCourse;
import com.dj.ssm.pojo.Course;
import com.dj.ssm.pojo.StudentSelectCourse;
import com.dj.ssm.service.ApplyCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.rmi.server.ExportException;
import java.util.List;

@Service
public class ApplyCourseServiceImpl extends ServiceImpl<ApplyCourseMapper, ApplyCourse> implements ApplyCourseService {


    @Override
    public List<StudentSelectCourse> findAllPassCourse(Integer status) throws Exception {
        return getBaseMapper().findAllPassCourse(status);
    }

}
