package com.Student.Registration.servlet;

import com.Student.Registration.dao.UserDao;
import com.Student.Registration.model.User;
import com.Student.Registration.util.FileUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Servlet to handle profile editing
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

    private static final String FILE_PATH = "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\users.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("userEmail") == null) {
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

                // Forward to edit profile page
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "User profile not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading user profile: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        // Get email from session (this is the key we'll use to find the user record)
        String userEmail = (String) session.getAttribute("userEmail");

        // Get form data
        String fullName = request.getParameter("fullName");
        String nic = request.getParameter("nic");
        String email = request.getParameter("email"); // This will be read-only in the form, but we get it anyway
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String mobileNumber = request.getParameter("mobileNumber");
        String whatsAppNumber = request.getParameter("whatsAppNumber");
        String indexNumber = request.getParameter("indexNumber");
        String parentFullName = request.getParameter("parentFullName");
        String parentContactNumber = request.getParameter("parentContactNumber");
        String parentEmail = request.getParameter("parentEmail");

        try {
            // First get the existing user data from file
            UserDao userDao = new UserDao();
            User currentUser = userDao.getUserByEmail(userEmail);

            if (currentUser == null) {
                request.setAttribute("errorMessage", "User not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Read all lines from the file
            List<String> lines = Files.readAllLines(Paths.get(FILE_PATH));
            List<String> updatedLines = new ArrayList<>();

            for (String line : lines) {
                String[] parts = line.split(",");
                if (parts.length >= 17 && parts[2].equals(userEmail)) {
                    // This is the line we need to update
                    // Create updated line with new values (keeping password and certificates as they were)
                    String updatedLine = fullName + "," + nic + "," + userEmail + "," +
                            currentUser.getPassword() + "," + dateOfBirth + "," +
                            gender + "," + mobileNumber + "," + whatsAppNumber + "," +
                            currentUser.getPermanentAddress() + "," +
                            currentUser.getDistrictOrProvince() + "," +
                            currentUser.getPostalCode() + "," + indexNumber + "," +
                            currentUser.getYearOfCompletion() + "," +
                            String.join("|", currentUser.getCertificates()) + "," +
                            parentFullName + "," + parentContactNumber + "," + parentEmail;

                    updatedLines.add(updatedLine);
                } else {
                    // Keep this line as is
                    updatedLines.add(line);
                }
            }

            // Write the updated lines back to the file
            Files.write(Paths.get(FILE_PATH), updatedLines);

            // Redirect back to the profile page to see the changes
            response.sendRedirect("UserProfileServlet");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating profile: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}