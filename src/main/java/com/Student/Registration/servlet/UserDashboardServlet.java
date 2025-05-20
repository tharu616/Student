package com.Student.Registration.servlet;

import com.Student.Registration.dao.UserDao;
import com.Student.Registration.dao.CourseRegistrationDao;
import com.Student.Registration.dao.NoticeDao;
import com.Student.Registration.model.User;
import com.Student.Registration.model.CourseRegistration;
import com.Student.Registration.model.Notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/UserDashboardServlet")
public class UserDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get user email from session
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        // Load user data
        UserDao userDao = new UserDao();
        User user = userDao.getUserByEmail(userEmail);

        // Load course registrations
        CourseRegistrationDao courseDao = new CourseRegistrationDao();
        List<CourseRegistration> enrolledCourses = courseDao.getRegistrationsByEmail(userEmail);

        // Load notices
        NoticeDao noticeDao = new NoticeDao();
        List<Notice> notices = noticeDao.getRecentNotices(5);

        // Set attributes for JSP
        request.setAttribute("user", user);
        request.setAttribute("enrolledCourses", enrolledCourses);
        request.setAttribute("notices", notices);

        // Forward to dashboard JSP
        request.getRequestDispatcher("UserDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
