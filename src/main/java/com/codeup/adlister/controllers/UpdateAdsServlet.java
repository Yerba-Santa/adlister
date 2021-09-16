package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "controllers.UpdateAdsServlet", urlPatterns = "/ads/updateads")
public class UpdateAdsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/ads/updateads.jsp")
                .forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        Ad ad = new Ad(
                user.getId(),
                1,
                request.getParameter("title"),
                request.getParameter("description")
        );
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");
    }
}
