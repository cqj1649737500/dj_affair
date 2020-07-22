package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 申请课程表
 */
@Data
@TableName("apply_course")
public class ApplyCourse {

    /**
     *
     */
    private Integer id;

    /**
     * 课程id
     */
    private Integer courseId;

    /**
     * 教师id user表level=1
     */
    private Integer userTeacherId;

    /**
     * 管理员id user表level=0
     */
    private Integer userAdminId;

    /**
     * 1,同意 2拒绝,0待确定，申请状态
     */
    private Integer status;


}
