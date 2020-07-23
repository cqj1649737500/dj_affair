package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import jdk.internal.org.objectweb.asm.tree.IincInsnNode;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
@TableName("vacation")
public class Vacation {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 请假开始时间
     */
    @DateTimeFormat(pattern = "yyyy/MM/dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy/MM/dd hh:mm:ss", timezone = "GMT+8")
    private LocalDateTime vacationTime;

    /**
     * 请假结束时间
     */
    @DateTimeFormat(pattern = "yyyy/MM/dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy/MM/dd hh:mm:ss", timezone = "GMT+8")
    private LocalDateTime endTime;

    /**
     * 请假人--user表level=1
     */
    private Integer userVacationId;

    private String vacationName;

    /**
     * 审批人---user表level=0
     */
    private Integer userApproveId;

    private String approveName;

    /**
     * 状态 0:待审批，1通过，2拒绝
     */
    private Integer status;


}
