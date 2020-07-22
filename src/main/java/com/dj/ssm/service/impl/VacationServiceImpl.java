package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.VacationMapper;
import com.dj.ssm.pojo.Vacation;
import com.dj.ssm.service.VacationService;
import org.springframework.stereotype.Service;

@Service
public class VacationServiceImpl extends ServiceImpl<VacationMapper, Vacation> implements VacationService {
}
