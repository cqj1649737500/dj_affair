package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.dj.ssm.pojo.ExpQuery;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.Vacation;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface VacationMapper extends BaseMapper<Vacation> {

    IPage<ExpQuery>  findByExp (@Param("page") IPage<ExpQuery> page, @Param("user") User user) throws DataAccessException;

    void addVacateExp (Vacation vacation) throws DataAccessException;

    List<Vacation> findAll() throws DataAccessException;

    Vacation findByExpId (Integer id) throws DataAccessException;
}
