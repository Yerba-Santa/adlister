package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ForgotPasswordServlet", urlPatterns = "/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //if user is logged in, redirect to profile
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/forgotPassword.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String newPassword = request.getParameter("password");
        String confirmNewPassword = request.getParameter("confirmPassword");

        User user = DaoFactory.getUsersDao().findByEmail(email);

        //checks if user exists
        //TODO: Error Message Username does not exist/registered
        if(user == null){
            response.sendRedirect("/forgotPassword");
            return;
        }

        //check if username and email match - a lil security not a lot lol
        //TODO: Error Message if email doesn't match username
        if(user != DaoFactory.getUsersDao().findByEmail(username)){
            response.sendRedirect("/forgotPassword");
            return;
        }

        //TODO: Error Message if password is null
        //TODO: Error message & if statement for password not matching criteria
        //TODO: error message is passwords don't match
        if(newPassword == null){ //check if new password is null or not
            response.sendRedirect("/forgotPassword");
            return;
        }
        else if(!(newPassword.equals(confirmNewPassword))){ //check if new password matches confirmPassword
            response.sendRedirect("/forgotPassword");
            return;
        }
        else{
            //TODO reset password information
        }

        request.getSession().setAttribute("username", user.getUsername());
        response.sendRedirect("/forgotPassword");
    }
}
