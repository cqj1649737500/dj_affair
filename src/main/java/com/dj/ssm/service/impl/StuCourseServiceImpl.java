package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.StuCourseMapper;
import com.dj.ssm.pojo.StuCourse;
import com.dj.ssm.service.StuCourseService;
import org.springframework.stereotype.Service;

@Service
public class StuCourseServiceImpl extends ServiceImpl<StuCourseMapper, StuCourse> implements StuCourseService {
}
