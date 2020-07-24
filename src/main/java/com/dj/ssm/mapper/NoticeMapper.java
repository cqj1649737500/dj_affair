package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.Notice;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface NoticeMapper extends BaseMapper<Notice> {

    List<Notice> findAll() throws DataAccessException;
}
