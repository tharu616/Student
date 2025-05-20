package com.Student.Registration.servlet;

import com.Student.Registration.model.CourseRegistration;
import com.Student.Registration.util.RegistrationQueueManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.Queue;

/**
 * Servlet for handling administrative operations on the registration queue
 */
@WebServlet("/QueueManagementServlet")
public class QueueManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get all registrations in the queue
        Queue<CourseRegistration> registrations = RegistrationQueueManager.getAllRegistrations();

        // Format the timestamps to readable dates for display
        Queue<String[]> formattedRegistrations = new LinkedList<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        for (CourseRegistration reg : registrations) {
            String[] regInfo = new String[3];
            regInfo[0] = reg.getStudentEmail();
            regInfo[1] = reg.getCourseCode();
            regInfo[2] = dateFormat.format(new Date(reg.getTimestamp()));
            formattedRegistrations.add(regInfo);
        }

        // Set attributes for the JSP
        request.setAttribute("queueSize", registrations.size());
        request.setAttribute("registrations", formattedRegistrations);

        // Forward to the queue management JSP
        request.getRequestDispatcher("queueManagement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle different actions
        String action = request.getParameter("action");

        if ("process".equals(action)) {
            // Process the next registration
            CourseRegistration processed = RegistrationQueueManager.processNextRegistration();
            if (processed != null) {
                request.setAttribute("message", "Successfully processed registration for: "
                        + processed.getStudentEmail() + " (Course: " + processed.getCourseCode() + ")");
            } else {
                request.setAttribute("message", "No registrations in queue to process.");
            }
        }
        else if ("clear".equals(action)) {
            // Clear all registrations
            boolean cleared = RegistrationQueueManager.clearAllRegistrations();
            if (cleared) {
                request.setAttribute("message", "Successfully cleared all pending registrations.");
            } else {
                request.setAttribute("message", "Failed to clear registrations.");
            }
        }

        // Redirect back to the GET method to refresh the page
        doGet(request, response);
    }
}