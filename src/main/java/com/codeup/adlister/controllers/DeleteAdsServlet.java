package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteAdsServlet", value = "/ads/delete")
public class DeleteAdsServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("ad_id"));
        DaoFactory.getAdsDao().deleteCategory(id);
        DaoFactory.getAdsDao().delete(id);
        response.sendRedirect("/profile");

    }
}
