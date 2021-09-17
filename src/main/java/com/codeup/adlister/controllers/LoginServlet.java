package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String redirect = request.getParameter("redirect");
       request.setAttribute("redirect", redirect);

       String errorMessage = request.getParameter("errorMessage");
       request.setAttribute("errorMessage", errorMessage);

        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String redirect = request.getParameter("redirect");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        if(username.isEmpty()){
            response.sendRedirect("/login?errorMessage=UsernameEmpty");
            return;
        }

        if(password.isEmpty()){
            response.sendRedirect("/login?errorMessage=PasswordEmpty");
            return;
        }

        if (user == null) {
            response.sendRedirect("/login?errorMessage=UserNull");
            return;
        }


        if(!Password.check(password, user.getPassword())){
            response.sendRedirect("/login?errorMessage=PasswordIncorrect");
            return;
        }

        //set user attribute to recognized as logged in
        request.getSession().setAttribute("user", user);
      
        //redirect user to previous page once logged in - CG
        if(redirect.equals("create")){
                response.sendRedirect("/ads/create");
            }
        else{
                response.sendRedirect("/profile");
            }
    }

    protected void setErrorMessageAndRedirect(String errorMessage, HttpServletResponse response, HttpServletRequest request) throws IOException {
        request.getSession().setAttribute("errorMessage", errorMessage);
        response.sendRedirect("/login");
    }
}
