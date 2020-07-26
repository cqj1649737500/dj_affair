package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.dj.ssm.pojo.StuTeacher;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {

    IPage<UserQuery> findByStudent (@Param("page") IPage<UserQuery> page, @Param("user")User user) throws DataAccessException;

}
