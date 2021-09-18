package com.codeup.adlister.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.CategoriesServlet", urlPatterns = "/ads/category")
public class CategoriesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String category = request.getParameter("category"); //gets category
        request.setAttribute("category", category); //sets category

        List<Ad> ads = DaoFactory.getAdsDao().getAdsFromCategory(category); //gets all ads with category

        request.setAttribute("ads", ads); //sets ad attribute
        request.getRequestDispatcher("/WEB-INF/ads/category.jsp").forward(request, response);
    }


}