package com.suyi.service.impl;

import com.suyi.domain.User;
import com.suyi.mapper.UserMapper;
import com.suyi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Boolean findByUserName(String username) {
        User user = userMapper.findByUserName(username);
        if (user!=null){
            return false;
        }
        return true;
    }

    @Override
    public Boolean findByEmail(String email) {
        User user = userMapper.findByEmail(email);
        if (user!=null){
            return false;
        }
        return true;
    }

    @Override
    public Boolean insert(User user) {
        user.setCreatetime(new Date());
        int i = userMapper.insert(user);
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public Boolean findByUserNameAndPassword(String username, String password) {
        User byUserNameAndPassword = userMapper.findByUserNameAndPassword(username, password);
        if (byUserNameAndPassword != null){
            return true;
        }
        return false;
    }
}
