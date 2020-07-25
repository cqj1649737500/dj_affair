package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.StuGradeMapper;
import com.dj.ssm.pojo.*;
import com.dj.ssm.service.StuGradeService;
import org.springframework.stereotype.Service;

import java.rmi.server.ExportException;
import java.util.List;

@Service
public class StuGradeServiceImpl extends ServiceImpl<StuGradeMapper, StuGrade> implements StuGradeService {

    @Override
    public List<GradeQuery> findByCourse(User user) throws ExportException {
        return getBaseMapper().findByCourse(user);
    }

    @Override
    public List<StudentQuery> findStudent(Integer userId,Integer courseId) throws ExportException {
        return getBaseMapper().findStudent(userId, courseId);
    }

}
