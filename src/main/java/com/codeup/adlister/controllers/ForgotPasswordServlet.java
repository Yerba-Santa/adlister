package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;

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

        String errorMessage = request.getParameter("errorMessage");
        request.setAttribute("errorMessage", errorMessage);

        String confirmReset = request.getParameter("confirmReset");
        request.setAttribute("confirmReset", confirmReset);

        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/forgotPassword.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");
        String confirmReset = request.getParameter("confirmReset");

        User user = DaoFactory.getUsersDao().findByUsername(username);

        //check if username and email match & if username does not exist- a lil security not a lot lol
        //make method, checking shallow refernce (look up), check if
        //TODO why not working
        if(user != DaoFactory.getUsersDao().findByEmail(email) && user != null){
            response.sendRedirect("/forgotPassword?errorMessage=EmailUsernameConflict");
            return;
        }

        if(newPassword.isEmpty()){ //check if pw is empty
            response.sendRedirect("/forgotPassword?errorMessage=PasswordEmpty");
        }

        //if password form isn't visible, redirect to be visible
        if(confirmReset == null){
            response.sendRedirect("/forgotPassword?confirmReset=true");
        }

        if(!(newPassword.equals(confirmNewPassword))){ //check if new pw matches confirmPassword
            response.sendRedirect("/forgotPassword#?errorMessage=MatchPassword");
            return;
        }

        if(!DaoFactory.getUsersDao().passwordInputIsValid(newPassword)){ //check if new pw match criteria
            response.sendRedirect("/forgotPassword?errorMessage=PasswordInvalid");
            return;
        }

        String hash = BCrypt.hashpw(newPassword, BCrypt.gensalt()); //hashes password
        user.setPassword(hash); //sets new hashed password

        request.getSession().setAttribute("passwordSuccess", true);
        response.sendRedirect("/forgotPassword");
    }
}
