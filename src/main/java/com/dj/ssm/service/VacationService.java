package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.ExpQuery;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.Vacation;

import java.util.List;

import java.rmi.server.ExportException;

public interface VacationService extends IService<Vacation> {

    List<Vacation> findAll() throws Exception;

    List<ExpQuery> findByExp (User user) throws ExportException;

    void addVacateExp (Vacation vacation) throws ExportException;

    Vacation findByExpId (Integer id) throws ExportException;
}
