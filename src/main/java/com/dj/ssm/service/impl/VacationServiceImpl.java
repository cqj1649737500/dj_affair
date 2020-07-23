package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.VacationMapper;
import com.dj.ssm.pojo.ExpQuery;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.Vacation;
import com.dj.ssm.service.VacationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.rmi.server.ExportException;
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
    public List<ExpQuery> findByExp(User user) throws ExportException {
        return vacationMapper.findByExp(user);
    }

    @Override
    public void addVacateExp(Vacation vacation) throws ExportException {
        vacationMapper.addVacateExp(vacation);
    }

    @Override
    public Vacation findByExpId(Integer id) throws ExportException {
        return vacationMapper.findByExpId(id);
    }

    @Override
    public List<Vacation> findVacationById() throws Exception {
        return vacationMapper.findVacationById();
    }
}
