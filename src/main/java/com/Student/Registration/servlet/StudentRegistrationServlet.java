package com.Student.Registration.servlet;

import com.Student.Registration.dao.FileHandler;
import com.Student.Registration.model.Student;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

    @WebServlet("/registerStudent")
public class StudentRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set character encoding to handle special characters
        request.setCharacterEncoding("UTF-8");

        // Get form parameters
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // Create Student object
        Student student = new Student(id, name, email);

        try {
            // Save student to file using FileHandler
            FileHandler.saveStudent(student);

            // Redirect to success page or view registrations
            response.sendRedirect("registrationSuccess.jsp");

        } catch (Exception e) {
            // Log error and show error message
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error registering student: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }
}