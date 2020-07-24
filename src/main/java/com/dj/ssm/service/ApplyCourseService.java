package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.ApplyCourse;
import com.dj.ssm.pojo.Course;
import com.dj.ssm.pojo.StudentSelectCourse;
import org.springframework.stereotype.Service;

import java.rmi.server.ExportException;
import java.util.List;

@Service
public interface ApplyCourseService extends IService<ApplyCourse> {

    List<StudentSelectCourse> findAllPassCourse(Integer status) throws Exception;

}
