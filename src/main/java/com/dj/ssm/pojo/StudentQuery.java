package com.dj.ssm.pojo;

import lombok.Data;

@Data
public class StudentQuery {

    private Integer id;

    private Integer userStudentId;

    /**
     * 学习状态 0 是正在学，1是已学完
     */
    private Integer status;

    /**
     * 学生id user表level=2
     */
    private Integer userStuId;

    /**
     * 教师id user表level=1
     */
    private Integer userTeacherId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户编码
     */
    private String userNumber;

    private Integer userId;

    /**
     * 课程id
     */
    private Integer courseId;

    /**
     * 分数 1:优秀，2良好，3：及格，4：不及格
     */
    private Integer grade;

    private Integer gradeId;
}
