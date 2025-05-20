package com.Student.Registration.servlet;

import com.Student.Registration.dao.UserDao;
import com.Student.Registration.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/SaveNameAndStatus")
public class SaveNameAndStatus extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String FILE_PATH = "C:\\Your\\File\\Path\\Payment.txt";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = null;
        JSONObject jsonResponse = new JSONObject();

        try {
            out = response.getWriter();

            // Get parameters
            String name = request.getParameter("name");
            String status = request.getParameter("status");
            String registrationNumber = request.getParameter("registrationNumber");

            // Validate parameters
            if (name == null || name.trim().isEmpty() || status == null || status.trim().isEmpty()) {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Missing required parameters");
                out.print(jsonResponse.toJSONString());
                return;
            }

            // Get registration number from session if not provided
            if (registrationNumber == null || registrationNumber.trim().isEmpty()) {
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("userEmail") != null) {
                    String userEmail = (String) session.getAttribute("userEmail");
                    UserDao userDao = new UserDao();
                    User user = userDao.getUserByEmail(userEmail);
                    if (user != null) {
                        registrationNumber = user.getRegisterNumber();
                    }
                }
            }

            // Final validation
            if (registrationNumber == null || registrationNumber.trim().isEmpty()) {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Registration number not found");
                out.print(jsonResponse.toJSONString());
                return;
            }

            // Ensure directory exists
            File file = new File(FILE_PATH);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }

            // Create formatted line with registration number
            String timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            String line = String.format("RegistrationNumber: %s, Name: %s, Success: %b, Date: %s",
                    registrationNumber,
                    name,
                    "success".equals(status),
                    timestamp);

            // Write to file
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
                writer.write(line);
                writer.newLine();
            }

            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Information saved successfully");

        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Error: " + e.getMessage());
        } finally {
            if (out != null) {
                out.print(jsonResponse.toJSONString());
                out.flush();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
