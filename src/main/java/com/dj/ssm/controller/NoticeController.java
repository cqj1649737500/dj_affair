package com.dj.ssm.controller;

import com.dj.ssm.pojo.Notice;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.Vacation;
import com.dj.ssm.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * TODO
 * @author 公告表
 * @date 2020/7/23 17:45
 */
@RestController
@RequestMapping("/notice/")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;


    /**
     * qzh
     * 展示公告
     * @return
     */
    @RequestMapping("noticeShow")
    public ResultModel noticeShow(){
        Map<String, Object> map = new HashMap<>();
        try {
            List<Notice> noticeList = noticeService.findAll();
            map.put("list", noticeList);
            return new ResultModel().success(map);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * qzh
     * 删除公告
     */
    @RequestMapping("delNotice")
    public ResultModel delNotice(Integer id){
        try {
            noticeService.removeById(id);
            return new ResultModel().success();
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }
}
