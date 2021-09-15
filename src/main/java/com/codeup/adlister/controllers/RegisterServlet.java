package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        //TODO: Hashpassword? - CG


        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }


        // create and save a new user
        User user = new User(username, email, password);

        //call check user function in MySQLUsersDao -CG
        if(DaoFactory.getUsersDao().check(user)){
            response.sendRedirect("/register");
            return;
        }

        //Call validateEmail - BR
        if (DaoFactory.getUsersDao().validateEmail(user)){
            response.sendRedirect("/register");
            return;
        }

        //Call emailIsValid - BR
        if (DaoFactory.getUsersDao().emailIsValid(email)){
            response.sendRedirect("/register");
            return;
        }


        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");





    }

}
