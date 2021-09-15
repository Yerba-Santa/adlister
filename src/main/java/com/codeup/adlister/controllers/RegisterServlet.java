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
        //TODO add x to close window
        //TODO why breaking navbar?

        boolean usernameEmpty = username.isEmpty();
        if (usernameEmpty) {
            request.getSession().setAttribute("errorMessage", "Username cannot be empty");
            response.sendRedirect("/register");
            return;
        }

        boolean emailEmpty = email.isEmpty();
        if (emailEmpty) {
            request.getSession().setAttribute("errorMessage", "Email cannot be empty");
            response.sendRedirect("/register");
            return;
        }

        boolean passwordEmpty = password.isEmpty();
        if (passwordEmpty) {
            request.getSession().setAttribute("errorMessage", "Password cannot be empty");
            response.sendRedirect("/register");
            return;
        }
        boolean passwordsDontMatch = ! password.equals(passwordConfirmation);
        if (passwordsDontMatch) {
            request.getSession().setAttribute("errorMessage", "Passwords don't match");
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);

        //call check user function in MySQLUsersDao to see if username already exists -CG
        if(DaoFactory.getUsersDao().check(user)){
            request.getSession().setAttribute("errorMessage", "Username already exists");
            response.sendRedirect("/register");
            return;
        }

        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
