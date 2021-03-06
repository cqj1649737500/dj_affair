package com.dj.ssm.controller.page;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 请假
 */
@Controller
@RequestMapping("/vacation/")
public class VacationPageController {

    /**
     * 请假审批
     * qzh
     */
    @RequestMapping("toAudit")
    public String toAudit(){
        return "/vacation/show";
    }



    @RequestMapping("toVacationShowExp")
    public String toVacationShowExp(){
        return "/vacation/exp_show";
    }

    @RequestMapping("toVacate")
    public String toVacate(){
        return "/vacation/vacate";
    }
}
