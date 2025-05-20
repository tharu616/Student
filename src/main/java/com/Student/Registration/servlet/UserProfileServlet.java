package com.Student.Registration.servlet;


import com.Student.Registration.dao.UserDao;
import com.Student.Registration.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet to handle user profile display
 * Retrieves user data based on email in session and forwards to profile page
 */
@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("userEmail") == null) {
            // Redirect to login page if not logged in
            response.sendRedirect("Login.jsp");
            return;
        }

        // Get the email of the logged-in user
        String userEmail = (String) session.getAttribute("userEmail");

        try {
            // Get user data from DAO
            UserDao userDao = new UserDao();
            User user = userDao.getUserByEmail(userEmail);

            if (user != null) {
                // Set user data as request attribute
                request.setAttribute("user", user);

                // Forward to profile page
                request.getRequestDispatcher("userProfile.jsp").forward(request, response);
            } else {
                // User not found in database
                request.setAttribute("errorMessage", "User profile not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading user profile: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}