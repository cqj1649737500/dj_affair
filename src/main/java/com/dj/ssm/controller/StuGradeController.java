package com.dj.ssm.controller;

import com.dj.ssm.service.StuGradeService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/course/")
/**
 * 成绩
 */
public class StuGradeController {

    private StuGradeService stuGradeService;
}
