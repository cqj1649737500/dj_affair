package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.*;

import java.rmi.server.ExportException;
import java.util.List;

public interface StuGradeService extends IService<StuGrade> {

    List<GradeQuery> findByCourse (User user) throws ExportException;

    List<StudentQuery> findStudent (Integer userId, Integer courseId) throws ExportException;

}
