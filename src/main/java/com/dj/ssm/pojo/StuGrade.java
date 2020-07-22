package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 成绩表
 */
@Data
@TableName("stu_grade")
public class StuGrade {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id---学生id--user表level=2
     */
    private Integer userId;

    /**
     * 课程id
     */
    private Integer courseId;

    /**
     * 分数 1:优秀，2良好，3：及格，4：不及格
     */
    private Integer grade;


}
