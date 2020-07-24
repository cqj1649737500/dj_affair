package com.dj.ssm.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
/**
 * TODO
 * @author page
 * @date 2020/7/23 17:47
 */
@Controller
@RequestMapping("/notice/")
public class NoticePageController {

    @RequestMapping("toNoticeShow")
    public String toNoticeShow(){
        return "/notice/show";
    }
}
