package com.dj.ssm.pojo;

import lombok.Data;

@Data
public class GradeQuery {

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
