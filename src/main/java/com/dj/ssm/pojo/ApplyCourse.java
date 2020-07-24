package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 申请课程表
 */
@Data
@TableName("apply_course")
public class ApplyCourse {

    /**
     *id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 课程id
     */
    private Integer courseId;

    @TableField(exist = false)
    private String applyCourseName;

    /**
     * 教师id user表level=1
     */
    private Integer userTeacherId;

    @TableField(exist = false)
    private String teacherName;

    /**
     * 管理员id user表level=0
     */
    private Integer userAdminId;

    @TableField(exist = false)
    private String adminName;

    /**
     * 1,同意 2拒绝,0待确定，申请状态
     */
    private Integer status;


}
