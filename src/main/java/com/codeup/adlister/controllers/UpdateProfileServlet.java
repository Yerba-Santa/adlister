package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateProfileServlet", value = "/user/update")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        String errorMessage = request.getParameter("errorMessage");
        request.setAttribute("errorMessage", errorMessage);

        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("email", user.getEmail());
        request.setAttribute("username", user.getUsername());

        request.getRequestDispatcher("/WEB-INF/users/update.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        if(username.isEmpty()){ //checks if username empty
            response.sendRedirect("/user/update?errorMessage=UsernameEmpty");
            return;
        }

        if(email.isEmpty()){ //checks if email is empty
            response.sendRedirect("/user/update?errorMessage=EmailEmpty");
            return;
        }

        User userTester = new User(username, email); //make userTester to check validity
        User user = (User) request.getSession().getAttribute("user"); //get current user

        boolean checkUsername = user.getUsername().equals(userTester.getUsername());
        System.out.println(checkUsername);

        if(DaoFactory.getUsersDao().check(userTester) && !checkUsername) { //check if username already exists
            response.sendRedirect("/user/update?errorMessage=UsernameDuplicate");
            return;
        }

        if(!DaoFactory.getUsersDao().emailInputIsValid(email)){ // email is correct format
            response.sendRedirect("/user/update?errorMessage=EmailInvalid");
            return;
        }

        if(DaoFactory.getUsersDao().emailDuplicates(userTester)){//Verify unique email
            response.sendRedirect("/user/update?errorMessage=EmailDuplicate");
            return;
        }

        user.setUsername(username);
        user.setEmail(email);
        DaoFactory.getUsersDao().update(user);
        response.sendRedirect("/profile");
    }
}

