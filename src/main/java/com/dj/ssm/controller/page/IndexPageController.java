package com.dj.ssm.controller.page;

import com.dj.ssm.pojo.Notice;
import com.dj.ssm.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/index/")
public class IndexPageController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("toIndex")
	public String toIndex() {
		return "/index/index";
	}

	@RequestMapping("toLeft")
	public String toLeft() {
		return "/index/left";
	}

	@RequestMapping("toRight")
	public String toRight() {
		return "/index/right";
	}

	@RequestMapping("toTop")
	public String toTop(Model model) throws Exception {
		List<Notice> list = noticeService.findAll();
		List<Notice> noticeList = new ArrayList<>();
		for (Notice notice : list) {
			if(LocalDateTime.now().isBefore(notice.getEndTime())){
				noticeList.add(notice);
			}
		}
		model.addAttribute("list", noticeList);
		model.addAttribute("size", noticeList.size());
		return "/index/top";
	}

}
