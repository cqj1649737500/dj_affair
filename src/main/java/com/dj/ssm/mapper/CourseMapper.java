package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.dj.ssm.pojo.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CourseMapper extends BaseMapper<Course> {

    IPage<Course> findCourseAll (@Param("page")IPage<Course> page, @Param("id") Integer id) throws DataAccessException;


    List<Course> findStudentSelfGrade(Integer id) throws DataAccessException;

}
