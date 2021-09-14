package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

//displays ad info - CG
@WebServlet(name = "controllers.ShowAdsServlet", urlPatterns = "/ads/show")
public class ShowAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //gets ad that matches passed id - CG
        long id = Long.parseLong(request.getParameter("id"));
        Ad ad = DaoFactory.getAdsDao().findById(id);
        request.setAttribute("ad", ad);

        //gets user that matches passed ad id - CG
        long user_id = DaoFactory.getAdsDao().findUserId(id);
        User user = DaoFactory.getUsersDao().findById(user_id);
        request.setAttribute("user", user);

        request.getRequestDispatcher("/WEB-INF/ads/show.jsp").forward(request, response);
    }

}
