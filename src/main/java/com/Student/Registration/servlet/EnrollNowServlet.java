package com.Student.Registration.servlet;

import com.Student.Registration.dao.UserDao;
import com.Student.Registration.model.CourseRegistration;
import com.Student.Registration.model.User;
import com.Student.Registration.util.FileUtils;
import com.Student.Registration.util.RegistrationQueueManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class EnrollNowServlet extends HttpServlet {

    private static final String COURSE_REGISTRATION_FILE_PATH =
            "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\CourseRegistration.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Get course information
        String courseCode = request.getParameter("courseCode");
        String courseName = request.getParameter("courseName");
        String schoolName = request.getParameter("schoolName");
        String courseFee = request.getParameter("courseFee");

        if (courseCode == null || courseCode.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Course code is required");
            return;
        }

        // Get student email from session
        HttpSession session = request.getSession();
        String studentEmail = (String) session.getAttribute("userEmail");

        // If email is not in session, try to get it from the user object
        if (studentEmail == null || studentEmail.isEmpty()) {
            // Fallback - try to get from request
            studentEmail = request.getParameter("email");

            if (studentEmail == null || studentEmail.isEmpty()) {
                // Redirect to login if no email found
                response.sendRedirect("login.jsp?error=noemail");
                return;
            }
        }

        // Get student's full name from UserDao
        UserDao userDao = new UserDao();
        User user = userDao.getUserByEmail(studentEmail);
        String studentName = (user != null) ? user.getFullName() : "Unknown";

        // Store enrollment information in session
        session.setAttribute("enrolledCourseCode", courseCode);
        session.setAttribute("enrolledCourseName", courseName);
        session.setAttribute("enrolledSchool", schoolName);
        session.setAttribute("enrolledCourseFee", courseFee);

        session.setAttribute("courseCode", courseCode);
        session.setAttribute("courseName", courseName);
        session.setAttribute("courseFee", courseFee);


        // Create CourseRegistration object with all fields
        CourseRegistration registration = new CourseRegistration(
                studentEmail,
                studentName,
                courseCode,
                courseName,
                courseFee,
                schoolName
        );

        // Add to registration queue
        RegistrationQueueManager.addRegistration(registration);

        try {
            // Format and save to the CourseRegistration.txt file
            // Format: studentEmail,studentName,courseCode,courseName,courseFee,schoolName,timestamp
            List<String> lines = new ArrayList<>();
            lines.add(studentEmail + "," +
                    studentName + "," +
                    courseCode + "," +
                    courseName + "," +
                    courseFee + "," +
                    schoolName + "," +
                    registration.getTimestamp());

            // Save to file (append mode)
            FileUtils.writeLinesToFile(COURSE_REGISTRATION_FILE_PATH, lines, true);

            System.out.println("Student " + studentName + " (" + studentEmail + ") enrolled in course: " +
                    courseCode + " - " + courseName + " from " + schoolName + ", Fee: " + courseFee);

            // Redirect to success page
            response.sendRedirect("Payment.jsp");

        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Failed to save course registration: " + e.getMessage());
        }
    }
}