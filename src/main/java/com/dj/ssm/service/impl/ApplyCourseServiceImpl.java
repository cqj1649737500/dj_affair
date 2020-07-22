package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.ApplyCourseMapper;
import com.dj.ssm.pojo.ApplyCourse;
import com.dj.ssm.service.ApplyCourseService;
import org.springframework.stereotype.Service;

@Service
public class ApplyCourseServiceImpl extends ServiceImpl<ApplyCourseMapper, ApplyCourse> implements ApplyCourseService {
}
