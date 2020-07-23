package com.dj.ssm.controller;

import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.Vacation;
import com.dj.ssm.service.VacationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.ssm.config.SysConstant;
import com.dj.ssm.pojo.ExpQuery;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.Vacation;
import com.dj.ssm.service.VacationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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

    /**
     * qzh
     * @return
     */
    @RequestMapping("audit")
    public ResultModel audit(){
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
     * @return
     */
    @RequestMapping("updateStatus1")
    public ResultModel updateStatus1(Vacation vacation){
        try {
            if (vacation.getStauts() != 0){
                return  new ResultModel().error("已审批");
            }
            vacationService.updateById(vacation);
            return new ResultModel().success();
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

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

    @RequestMapping("vacate")
    public ResultModel<Object> vacate(Integer days, @SessionAttribute("user") User user, Vacation vacation){
        try {
            LocalDateTime endTime = vacation.getVacationTime().plusDays(days);
            vacation.setEndTime(endTime);
            vacation.setUserVacationId(user.getId());
            vacationService.addVacateExp(vacation);
            return new ResultModel().success();
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }

}
