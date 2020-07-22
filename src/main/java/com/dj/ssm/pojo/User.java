package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("user")
public class User {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String userName;

    private String userPwd;

    private Integer userAge;

    /**
     * 用户编码：标识不可重复
     */
    private String userNumber;

    /**
     * 等级：0：管理员，1教师 2学生
     */
    private Integer level;

}
