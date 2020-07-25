package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.ApplyCourse;
import com.dj.ssm.pojo.Course;
import com.dj.ssm.pojo.StudentSelectCourse;
import org.springframework.dao.DataAccessException;
import java.util.List;


public interface ApplyCourseService extends IService<ApplyCourse> {

    List<StudentSelectCourse> findAllPassCourse(Integer status, Integer userStudentId) throws Exception;

    List<ApplyCourse> findAll() throws Exception;

}
