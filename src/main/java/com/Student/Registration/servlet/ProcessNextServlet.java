package com.Student.Registration.servlet;

import com.Student.Registration.util.RegistrationQueueManager;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ProcessNextServlet")
public class ProcessNextServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        RegistrationQueueManager.processNextRegistration();
        response.sendRedirect("ViewPendingRequests.jsp");
    }
}
