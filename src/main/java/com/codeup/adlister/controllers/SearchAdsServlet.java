package com.codeup.adlister.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.List;

@WebServlet(name = "controllers.SearchAdsServlet", urlPatterns = "/ads/search")
public class SearchAdsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        System.out.println(keyword);

        boolean inputHasErrors = keyword.isEmpty();

        if (inputHasErrors) {
            response.sendRedirect("/ads");//NEED A PAGE TO REDIRECT TO!
            return;
        }
        List<Ad> ads = DaoFactory.getAdsDao().search(keyword);
        request.setAttribute("ads", ads);
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }





}

//