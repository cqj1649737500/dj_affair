package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import jdk.internal.org.objectweb.asm.tree.IincInsnNode;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("vacation")
public class Vacation {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 请假开始时间
     */
    private LocalDateTime vacationTime;

    /**
     * 请假结束时间
     */
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


}
