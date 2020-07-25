package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("stu_course")
public class StuCourse {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer courseId;

    private Integer userStudentId;

    /**
     * 学习状态 0 是正在学，1是已学完
     */
    private Integer status;

    private String userName;

    private String grade;

}
