package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.Course;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CourseMapper extends BaseMapper<Course> {

    List<Course> findStudentSelfGrade(Integer id) throws DataAccessException;

}
