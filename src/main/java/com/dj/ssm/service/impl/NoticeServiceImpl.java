package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.NoticeMapper;
import com.dj.ssm.pojo.Notice;
import com.dj.ssm.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * qzh
 * TODO
 * @author impl
 * @date 2020/7/23 17:48
 */
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements NoticeService {

    @Autowired
    public NoticeMapper noticeMapper;

}
