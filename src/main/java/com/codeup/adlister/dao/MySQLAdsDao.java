package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    public List<Ad> getByUserId(Long id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads where user_id = ?");
            stmt.setLong(1,id);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }

    }
    public void update(Ad ad) {
        String query = "update ads set title = ?, description = ? where id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2,ad.getDescription());
            stmt.setLong(3, ad.getId());
            stmt.executeUpdate();
//            ResultSet rs = stmt.getGeneratedKeys();
//            rs.next();
//            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad", e);
        }
    }
    public Ad findById(long id) {
        String query = "SELECT * FROM ads WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            return extractAd(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }


//
//    @Override
//    public List<Ad> getByUserId(Long id) {
//        try {
//            String Query = "SELECT * from ads where user_id = ?" ;
//            PreparedStatement stmt = connection.prepareStatement(Query);
//            stmt.setLong(1, id);
////            stmt.setString(2, ad.getTitle());
////            stmt.setString(3, ad.getDescription());
//            return createAdsFromResults(stmt.executeQuery());
////            ResultSet rs = stmt.getGeneratedKeys();
////            rs.next();
////            return rs.getLong(1);
//        } catch (SQLException e) {
//            throw new RuntimeException("Error creating a new ad.", e);
//        }
//    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

//    To do
//    Update method
//    create ad servlet
//    Inside servlet create a do get and do post form (Make sure do get provide the information of ad user is trying to edit)
//    Create an update Ad.jsp (create a form)

}
