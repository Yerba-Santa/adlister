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
        long ad_id = Long.parseLong(request.getParameter("ad_id"));
        Ad ad = DaoFactory.getAdsDao().findById(ad_id);

        request.setAttribute("ad_id", request.getParameter("ad_id"));
        request.setAttribute("title", ad.getTitle());
        request.setAttribute("description", ad.getDescription());
        request.getRequestDispatcher("/WEB-INF/ads/updateads.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String updateTitle = request.getParameter("updateTitle");
        String updateDescription = request.getParameter("updateDescription");
        long updateID = Long.parseLong(request.getParameter("ad_id"));
        Ad ad = new Ad(updateID, user.getId(),updateTitle, updateDescription);
        DaoFactory.getAdsDao().update(ad);
        response.sendRedirect("/ads/show?id=" + updateID);
    }
}
