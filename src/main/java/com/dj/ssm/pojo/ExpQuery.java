package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
@Data
public class ExpQuery {

    private Integer id;

    /**
     * 请假开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime vacationTime;

    /**
     * 请假结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime endTime;

    /**
     * 请假人--user表level=1
     */
    private Integer userVacationId;

    /**
     * 审批人---user表level=0
     */
    private Integer userApproveId;

    /**
     * 状态 0:待审批，1通过，2拒绝
     */
    private Integer status;

    /**
     * 请假人
     */
    private String userName;

    /**
     * 审批人
     */
    private String approveUserName;
}
