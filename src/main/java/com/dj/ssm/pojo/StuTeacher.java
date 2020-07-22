package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 老师学生关系表
 * 一个老师可以有多个学生
 * 一个学生可以有多个老师
 */
@Data
@TableName("stu_teacher")
public class StuTeacher {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 学生id user表level=2
     */
    private Integer userStuId;

    /**
     * 教师id user表level=1
     */
    private Integer userTeacherId;


}
