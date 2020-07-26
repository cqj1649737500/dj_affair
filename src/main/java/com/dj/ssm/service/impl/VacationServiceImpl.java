package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
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


    @Override
    public List<Vacation> findAll() throws Exception {
        return getBaseMapper().findAll();
    }

    @Override
    public IPage<ExpQuery> findByExp (IPage<ExpQuery> page, User user) throws ExportException {
        return getBaseMapper().findByExp(page, user);
    }

    @Override
    public void addVacateExp(Vacation vacation) throws ExportException {
        getBaseMapper().addVacateExp(vacation);
    }

    @Override
    public Vacation findByExpId(Integer id) throws ExportException {
        return getBaseMapper().findByExpId(id);
    }


}
