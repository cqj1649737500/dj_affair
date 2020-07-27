package com.dj.ssm.pojo;

import lombok.Data;

@Data
public class StudentSelectCourse {

    private Integer id;

    private String adminNumber;

    private String teacherName;

    private String courseName;

    /**
     * 课时
     */
    private Integer coursePeriod;

    /**
     * 课程类型
     */
    private Integer courseType;

    /**
     * 课程id
     */
    private Integer courseId;

    /**
     * 课程类型展示用
     */
    private String courseTypeShow;


    /**
     * 课程编号
     */
    private String courseNumber;

    public String getCourseTypeShow() {
        if(null == courseType){
            return "";
        }
        if(courseType == 0){
            return "政治";
        }
        if(courseType == 1){
            return "社会";
        }
        if(courseType == 2){
            return "文科";
        }
        if(courseType == 3){
            return "理科";
        }
        return "错误";
    }

}
