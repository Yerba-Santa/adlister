package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    User findById(long id);
    Boolean check(User user); //added by CG
    User findByEmail(String email);//BR
    Boolean validateEmail(User user); //BR
}
