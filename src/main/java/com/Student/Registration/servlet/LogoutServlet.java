package com.Student.Registration.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet to handle user logout
 * Invalidates session and redirects to login page
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current session (false means don't create if it doesn't exist)
        HttpSession session = request.getSession(false);

        // Invalidate session if it exists
        if (session != null) {
            session.invalidate();
        }

        // Redirect to login page
        response.sendRedirect("Login.jsp");
    }
}