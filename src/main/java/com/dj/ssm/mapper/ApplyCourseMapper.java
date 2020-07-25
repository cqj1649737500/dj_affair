package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.ApplyCourse;
import com.dj.ssm.pojo.Course;
import com.dj.ssm.pojo.StudentSelectCourse;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ApplyCourseMapper extends BaseMapper<ApplyCourse> {

    List<StudentSelectCourse> findAllPassCourse(@Param("status") Integer status, @Param("userStudentId") Integer userStudentId) throws Exception;

    List<ApplyCourse> findAll() throws Exception;
}
