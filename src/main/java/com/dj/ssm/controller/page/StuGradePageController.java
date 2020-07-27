package com.dj.ssm.controller.page;

import com.dj.ssm.pojo.*;
import com.dj.ssm.service.StuGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.rmi.server.ExportException;
import java.util.List;

@Controller
@RequestMapping("/grade/")
public class StuGradePageController {

    @Autowired
    private StuGradeService stuGradeService;

    @RequestMapping("toMark")
    public String toMark(@SessionAttribute("user")User user, Model model) throws ExportException {
        List<GradeQuery> list = stuGradeService.findByCourse(user);
        model.addAttribute("list", list);
        model.addAttribute("size", list.size());
        return "/grade/mark";
    }

    @RequestMapping("toStudentMack")
    public String toStudentMack(@SessionAttribute("user") User user, Model model, Integer id) throws ExportException {
        model.addAttribute("userId", user.getId());
        model.addAttribute("courseId", id);
        return "/grade/student_mark";
    }

    @RequestMapping("findById")
    public String findById(Model model, Integer id, Integer courseId) throws ExportException {
        model.addAttribute("gradeId", id);
        model.addAttribute("courseId", courseId);
        return "/grade/mark_student";
    }
}
