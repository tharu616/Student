package com.Student.Registration.servlet;

import com.Student.Registration.dao.UserDao;
import com.Student.Registration.model.CourseRegistration;
import com.Student.Registration.model.User;
import com.Student.Registration.util.FileUtils;
import com.Student.Registration.util.RegistrationQueueManager;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/StudentRegistrationServlet")
public class StudentRegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Get form data
            String fullName = getParam(request, "fullName");
            String nic = getParam(request, "nic");
            String email = getParam(request, "email");
            String password = getParam(request, "password");
            String dateOfBirth = getParam(request, "dateOfBirth");
            String gender = getParam(request, "gender");

            String mobileNumber = getParam(request, "mobileNumber");
            String whatsAppNumber = getParam(request, "whatsAppNumber");
            String permanentAddress = getParam(request, "permanentAddress");
            String districtOrProvince = getParam(request, "districtOrProvince");
            String postalCode = getParam(request, "postalCode");
            String indexNumber = getParam(request, "olIndex"); // Changed from indexNumber to olIndex
            String yearOfCompletion = getParam(request, "yearOfCompletion");

            String[] certificateValues = request.getParameterValues("Upload Certificates"); // Match input name
            List<String> certificates = (certificateValues != null) ? Arrays.asList(certificateValues) : List.of();

            String parentFullName = getParam(request, "parentFullName");
            String parentContactNumber = getParam(request, "parentContactNumber");
            String parentEmail = getParam(request, "parentEmail");

            long timestamp = System.currentTimeMillis();

            // Create User
            User user = new User(
                    fullName, nic, email, password, dateOfBirth, gender,
                    mobileNumber, whatsAppNumber, permanentAddress, districtOrProvince,
                    postalCode, indexNumber, yearOfCompletion, certificates,
                    parentFullName, parentContactNumber, parentEmail
            );


            String registerNumber = UUID.randomUUID().toString();
            user.setRegisterNumber(registerNumber);

            // Save user
            UserDao userDao = new UserDao();
            userDao.saveUser(user);

            // Store user email in session for later use
            request.getSession().setAttribute("userEmail", email);
            request.getSession().setAttribute("userName", fullName);

            // Redirect on success
            response.sendRedirect("LoadCoursesServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("singUp.jsp?error=1");
        }
    }

    private String getParam(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);
        return (value != null) ? value.trim() : "";
    }

    // Helper: Hash password using BCrypt
    private String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    // Helper: Safe Integer parsing
    private int parseInt(String value, int defaultValue) {
        if (value == null || value.isEmpty()) return defaultValue;
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}