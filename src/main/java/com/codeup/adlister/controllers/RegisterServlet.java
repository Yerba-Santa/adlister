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

        //set attributes for page so register.jsp can register if not null - CG
        request.getSession().setAttribute("username", username);
        request.getSession().setAttribute("email", email);

        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            //call method to chcek error and set error message and set where redirect can go
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);

        //Verify email address, email is correct format, password is correct format, if user already exists -BR
        boolean verificationError = DaoFactory.getUsersDao().check(user) ||
                                    DaoFactory.getUsersDao().emailDuplicates(user) ||
                                    !DaoFactory.getUsersDao().emailInputIsValid(email) ||
                                    !DaoFactory.getUsersDao().passwordInputIsValid(password);

        if(verificationError){
            response.sendRedirect("/register");
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

        //clear username & email attribute? Because worked and no longer want to be filled in -CG
        request.getSession().setAttribute("username", null);
        request.getSession().setAttribute("email", null);

        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");

    }

}
