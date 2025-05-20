package com.Student.Registration.servlet;

import com.Student.Registration.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


public class LoginServlet extends HttpServlet {

    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inputEmail = request.getParameter("email");
        String inputPassword = request.getParameter("password");

        UserDao userDao = new UserDao();
        boolean isValid = userDao.validateUser(inputEmail, inputPassword);

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", inputEmail);
            response.sendRedirect("UserDashboardServlet");  // Change this line
        } else {
            response.sendRedirect("Login.jsp?error=1");
        }

    }
}