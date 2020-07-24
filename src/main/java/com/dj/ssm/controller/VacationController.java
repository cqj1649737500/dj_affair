package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.pojo.*;
import com.dj.ssm.service.NoticeService;
import com.dj.ssm.service.VacationService;
import org.springframework.beans.factory.annotation.Autowired;
import com.dj.ssm.pojo.ExpQuery;
import com.dj.ssm.pojo.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 请假
 */
@RestController
@RequestMapping("/vacation/")
public class VacationController {

    @Autowired
    private VacationService vacationService;

    @Autowired
    private NoticeService noticeService;
    /**
     * qzh
     *
     * 展示请假表
     * @return
     */
    @RequestMapping("audit")
    public ResultModel audit() {
        Map<String, Object> map = new HashMap<>();
        try {
            List<Vacation> list = vacationService.findAll();
            map.put("list", list);
            return new ResultModel().success(map);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * qzh
     * 修改状态 审批通过
     *
     *
     * @return
     */
    @RequestMapping("updateStatus1")
    public ResultModel updateStatus1(Vacation vacation){
        try {
            Vacation v = vacationService.findByExpId(vacation.getId());
            if (v.getStatus() != 0){
                return  new ResultModel().error("已审批");
            }
            boolean b = vacationService.updateById(vacation);
            if (b && vacation.getStatus() == 1){
                Notice notice = new Notice();
                notice.setVacationUserId(v.getUserVacationId());
                notice.setEndTime(v.getEndTime());
                noticeService.save(notice);
            }
            return new ResultModel().success();
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * 请假记录展示
     * zyt
     *
     * @param user
     * @param pageNo
     * @return
     */
    @RequestMapping("vacationShowExp")
    public ResultModel toVacationShowExp(@SessionAttribute("user") User user, Integer pageNo) {
        Map<String, Object> map = new HashMap<>();
        try {
//            IPage<ExpQuery> page = new Page<>(pageNo, SysConstant.PAGE_SIZE);
//            IPage<ExpQuery> pageInfo = vacationService.page(page);
            List<ExpQuery> exp = vacationService.findByExp(user);
//            map.put("pages", pageInfo.getPages());
            map.put("list", exp);
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * 请假
     * zyt
     *
     * @param days
     * @param user
     * @param vacation
     * @return
     */
    @RequestMapping("vacate")
    public ResultModel<Object> vacate(Integer days, @SessionAttribute("user") User user, Vacation vacation) {
        try {
            LocalDateTime endTime = vacation.getVacationTime().plusDays(days);
            vacation.setEndTime(endTime);
            vacation.setUserVacationId(user.getId());
            vacationService.addVacateExp(vacation);
            return new ResultModel().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }

}
