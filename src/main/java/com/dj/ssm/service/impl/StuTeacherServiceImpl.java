package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.StuTeacherMapper;
import com.dj.ssm.pojo.StuTeacher;
import com.dj.ssm.service.StuTeacherService;
import org.springframework.stereotype.Service;

@Service
public class StuTeacherServiceImpl extends ServiceImpl<StuTeacherMapper, StuTeacher> implements StuTeacherService {
}
