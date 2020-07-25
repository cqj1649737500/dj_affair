package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import javax.xml.crypto.Data;
import java.util.List;

public interface StuGradeMapper extends BaseMapper<StuGrade> {

    List<GradeQuery> findByCourse (User user) throws DataAccessException;

    List<StudentQuery> findStudent (@Param("userId") Integer userId, @Param("courseId") Integer courseId) throws DataAccessException;

}
