package com.Student.Registration.servlet;

import com.Student.Registration.dao.UserDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected boolean doPost(HttpServletRequest request, HttpServletResponse response, String storedPass) throws IOException {
        String inputEmail = request.getParameter("email");
        String inputPassword = request.getParameter("password");

        UserDao userDao = new UserDao();
        boolean isValid = userDao.validateUser(inputEmail, inputPassword);

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", inputEmail);
            response.sendRedirect("loginSuccess.jsp");
        } else {
            response.sendRedirect("Login.jsp?error=1");
        }

        if (BCrypt.checkpw(inputPassword, storedPass)) {
            return true;
        } else {
            return false;
        }
    }
}