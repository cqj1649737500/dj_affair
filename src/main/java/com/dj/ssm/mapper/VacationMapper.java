package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.Vacation;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface VacationMapper extends BaseMapper<Vacation> {

    List<Vacation> findAll() throws DataAccessException;

    void updateStatus1(Integer id) throws DataAccessException;

    void updateStatus2(Integer id) throws DataAccessException;
}
