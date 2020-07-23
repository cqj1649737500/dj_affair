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


}
