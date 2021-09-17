package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ForgotUsernameServlet", urlPatterns = "/forgotUsername")
public class ForgotUsernameServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //if user is logged in, redirect to profile

        String errorMessage = request.getParameter("errorMessage");
        request.setAttribute("errorMessage", errorMessage);

        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/forgotUsername.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        User user = DaoFactory.getUsersDao().findByEmail(email);

        if(user == null){
            response.sendRedirect("/forgotUsername?errorMessage=UsernameEmailConflict");
            return;
        }

        request.getSession().setAttribute("username", user.getUsername());
        response.sendRedirect("/forgotUsername");
    }
}
