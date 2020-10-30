package com.suyi.service;

import com.suyi.domain.User;

public interface UserService {
    Boolean findByUserName(String username);

    Boolean findByEmail(String email);

    Boolean insert(User user);

    Boolean findByUserNameAndPassword(String username, String password);
}
