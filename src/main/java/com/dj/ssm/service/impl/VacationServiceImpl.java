package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.VacationMapper;
import com.dj.ssm.pojo.Vacation;
import com.dj.ssm.service.VacationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VacationServiceImpl extends ServiceImpl<VacationMapper, Vacation> implements VacationService {

    @Autowired
    private VacationMapper vacationMapper;

    @Override
    public List<Vacation> findAll() throws Exception {
        return vacationMapper.findAll();
    }

    @Override
    public void updateStatus1(Integer id) throws Exception {
        vacationMapper.updateStatus1(id);
    }

    @Override
    public void updateStatus2(Integer id) throws Exception {
        vacationMapper.updateStatus2(id);
    }

    @Override
    public List<Vacation> findVacationById() throws Exception {
        return vacationMapper.findVacationById();
    }
}
