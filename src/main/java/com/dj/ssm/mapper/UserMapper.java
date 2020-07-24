package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.StuTeacher;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserQuery;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {

    List<UserQuery> findByStudent (User user) throws DataAccessException;

}
