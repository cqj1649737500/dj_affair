package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
@TableName("notice")
public class Notice {
/**
 * qzh
 * TODO
 * @author
 * @date 2020/7/23 17:38
 */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 请假人id
     */
    private Integer vacationUserId;

    /**
     * 结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss", timezone = "GMT+8")
    private LocalDateTime endTime;
}
