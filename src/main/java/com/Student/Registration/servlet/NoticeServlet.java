package com.Student.Registration.servlet;

import com.Student.Registration.dao.NoticeDao;
import com.Student.Registration.dao.UserDao;
import com.Student.Registration.model.Notice;
import com.Student.Registration.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/NoticeServlet")
public class NoticeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user email from session
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            // Redirect to login page if user is not logged in
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            // Load user information
            UserDao userDao = new UserDao();
            User user = userDao.getUserByEmail(userEmail);

            // Get all notifications
            NoticeDao noticeDao = new NoticeDao();
            List<Notice> notices = noticeDao.getAllNotices();

            // Set properties for JSP
            request.setAttribute("user", user);
            request.setAttribute("notices", notices);

            // Forward to JSP
            request.getRequestDispatcher("notices.jsp").forward(request, response);
        } catch (Exception e) {
            // Error handling
            request.setAttribute("error", "Error loading announcements.: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
