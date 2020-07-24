package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Notice;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface NoticeService extends IService<Notice> {

    List<Notice> findAll() throws Exception;
}
