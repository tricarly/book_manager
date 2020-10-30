package com.suyi.mapper;

import com.suyi.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User findByUserName(String username);

    User findByEmail(String email);

    User findByUserNameAndPassword(@Param("username") String username,@Param("password") String password);
}