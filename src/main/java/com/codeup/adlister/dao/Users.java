package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    void update(User user);
    User findById(long id);
    Boolean check(User user); //added by CG
    User findByEmail(String email);//BR
    Boolean emailDuplicates(User user); //BR
    Boolean emailInputIsValid(String email);//BR
    Boolean passwordInputIsValid(String password);
    void updatePassword(String password, long id);
}
