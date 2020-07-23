package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Vacation;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface VacationService extends IService<Vacation> {

    List<Vacation> findAll() throws Exception;

    void updateStatus1(Integer id) throws Exception;

    void updateStatus2(Integer id) throws Exception;
}
