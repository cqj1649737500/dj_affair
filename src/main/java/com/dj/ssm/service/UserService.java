package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.StuTeacher;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserQuery;

import java.rmi.server.ExportException;
import java.util.List;

public interface UserService extends IService<User> {

    List<UserQuery> findByStudent (User user) throws ExportException;

}
