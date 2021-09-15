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

        //set attributes for page so register.jsp can register if not null
        request.getSession().setAttribute("username", username);
        request.getSession().setAttribute("email", email);


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


        //clear username & email attricbute? Because worked and no longer want to be filled in
        request.getSession().setAttribute("username", null);
        request.getSession().setAttribute("email", null);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
