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

        String errorMessage = request.getParameter("errorMessage");
        request.setAttribute("errorMessage", errorMessage);

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
            response.sendRedirect("/register?errorMessage=UsernameEmpty");
            return;
        }

        if(email.isEmpty()){
            response.sendRedirect("/register?errorMessage=EmailEmpty");
            return;
        }

        if(password.isEmpty()){
            response.sendRedirect("/register?errorMessage=PasswordEmpty");
            return;
        }

        if(!password.equals(passwordConfirmation)){
            response.sendRedirect("/register?errorMessage=MatchPassword");
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);

        //Verify email address, email is correct format, password is correct format, if user already exists -BR
        if(DaoFactory.getUsersDao().check(user)){
            response.sendRedirect("/register?errorMessage=UsernameDuplicate");
            return;
        }

        if(!DaoFactory.getUsersDao().emailInputIsValid(email)){
            response.sendRedirect("/register?errorMessage=EmailInvalid");
            return;
        }

        if(DaoFactory.getUsersDao().emailDuplicates(user)){
            response.sendRedirect("/register?errorMessage=EmailDuplicate");
            return;
        }

       /*
       Call passwordInputIsValid to check if password is in correct format:
       It contains at least 5 characters and at most 15 characters.
       It contains at least one digit.
       It contains at least one upper case alphabet.
       It contains at least one lower case alphabet.
       It contains at least one special character which includes !@#$%&*()-+=^.
       It doesn’t contain any white space.
        */

        //Call passwordInputIsValid to check if password is in correct format - BR

        if(!DaoFactory.getUsersDao().passwordInputIsValid(password)){
            response.sendRedirect("/register?errorMessage=PasswordInvalid");
            return;
        }

        //clear username & email attribute for sticky form -CG
        request.getSession().setAttribute("username", null);
        request.getSession().setAttribute("email", null);

        //finalize inputting user, redirect to login
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");

    }
}
