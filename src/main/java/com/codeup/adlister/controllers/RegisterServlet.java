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

        //set attributes for page so register.jsp can display if not null - CG
        request.getSession().setAttribute("username", username);
        request.getSession().setAttribute("email", email);

        // validate input is not null and set error message
        if(username.isEmpty()){
            setErrorMessageAndRedirect("Username can't be empty", response, request);
            return;
        }

        if(email.isEmpty()){
            setErrorMessageAndRedirect("Email can't be empty", response, request);
            return;
        }

        if(password.isEmpty()){
            setErrorMessageAndRedirect("Password can't be empty", response, request);
            return;
        }

        if(!password.equals(passwordConfirmation)){
            setErrorMessageAndRedirect("Passwords don't match", response, request);
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);

        //Verify email address, email is correct format, password is correct format, if user already exists -BR
        if(DaoFactory.getUsersDao().check(user)){
            setErrorMessageAndRedirect("Username already exists, pick a different one", response, request);
            return;
        }

        if(DaoFactory.getUsersDao().emailDuplicates(user)){
            setErrorMessageAndRedirect("An account with this username already exists", response, request);
            //TODO little link to login instead?
            return;
        }

        if(!DaoFactory.getUsersDao().emailInputIsValid(email)){
            setErrorMessageAndRedirect("Please enter a valid email", response, request);
            return;
        }

        if(!DaoFactory.getUsersDao().passwordInputIsValid(password)){
            setErrorMessageAndRedirect("Password must be between 5 and 15 characters, " +
                    "contain at least one digit, one lower case character, one special character" +
                    " and one upper case character" +
                    "and not contain white space", response, request);
            //TODO add more specific password error message
            return;
        }

        //clear username & email attribute for sticky form -CG
        // reset errorMessage to null so is not shown
        request.getSession().setAttribute("username", null);
        request.getSession().setAttribute("email", null);
        request.getSession().setAttribute("errorMessage", null);

        //finalize inputting user, redirect to login
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");

    }

    protected void setErrorMessageAndRedirect(String errorMessage, HttpServletResponse response, HttpServletRequest request) throws IOException {
        request.getSession().setAttribute("errorMessage", errorMessage);
        response.sendRedirect("/register");
    }
}
