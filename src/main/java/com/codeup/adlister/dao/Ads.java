package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    void update(Ad ad);
    Ad findById(long id);
    List<Ad> getByUserId(Long id);
    void deleteCategory(Long category_ID);
    void delete(long id);
    Long findUserId(long id);
    List<Ad> search(String keyword);
    void addCategory(Long ad_ID, Long category_ID);
}
