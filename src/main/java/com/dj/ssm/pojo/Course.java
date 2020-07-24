package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 课程表
 */
@Data
@TableName("course")
public class Course {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 课程名
     */
    private String courseName;

    /**
     * 课时，本课程一共用多少天
     */
    private Integer coursePeriod;

    /**
     * 课时，本课程类型
     */
    private String courseType;

    /**
     * 课程编号
     */
    private String courseNumber;


}
