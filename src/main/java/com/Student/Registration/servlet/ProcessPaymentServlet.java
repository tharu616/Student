package com.Student.Registration.servlet;

import com.Student.Registration.dao.PaymentDao;
import com.Student.Registration.model.Payment;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.json.JSONObject;

@WebServlet(name = "ProcessPaymentServlet", value = "/ProcessPayment")
public class ProcessPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        try {
            // Extract form data
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String paymentMethod = request.getParameter("paymentMethod");

            // Get course details from session
            HttpSession session = request.getSession();
            String courseCode = (String) session.getAttribute("enrolledCourseCode");
            String courseName = (String) session.getAttribute("enrolledCourseName");
            String courseFee = (String) session.getAttribute("enrolledCourseFee");

            // Validate required fields
            if (firstName == null || lastName == null || email == null ||
                    courseCode == null || courseName == null || courseFee == null) {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Missing required information");
                out.print(jsonResponse.toString());
                return;
            }

            // Validate payment details
            if (!validatePayment(paymentMethod, request)) {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Invalid payment details");
                out.print(jsonResponse.toString());
                return;
            }

            // Create student full name
            String fullName = firstName + " " + lastName;

            // Create payment object
            Payment payment = new Payment(
                    email,
                    fullName,
                    courseCode,
                    courseName,
                    courseFee,
                    paymentMethod
            );

            // Save payment to file
            PaymentDao paymentDao = new PaymentDao();
            boolean saveResult = paymentDao.savePayment(payment);

            if (saveResult) {
                // Log successful transaction
                logTransaction(payment, true);

                // Update session with payment info
                session.setAttribute("lastTransactionId", payment.getTransactionId());

                jsonResponse.put("status", "success");
                jsonResponse.put("transactionId", payment.getTransactionId());
                jsonResponse.put("message", "Payment processed successfully");
            } else {
                // Log failed transaction
                logTransaction(payment, false);

                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Failed to save payment details");
            }

        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.put("status", "error");
            jsonResponse.put("message", e.getMessage());
        }

        out.print(jsonResponse.toString());
    }

    private boolean validatePayment(String paymentMethod, HttpServletRequest request) {
        // Basic validation logic - in a real system, you'd integrate with a payment processor
        if ("credit-card".equals(paymentMethod)) {
            String cardNumber = request.getParameter("cardNumber");
            String cardName = request.getParameter("cardName");
            String cardExpiry = request.getParameter("cardExpiry");
            String cardCvv = request.getParameter("cardCvv");

            // Check that all card details are provided
            return cardNumber != null && !cardNumber.trim().isEmpty() &&
                    cardName != null && !cardName.trim().isEmpty() &&
                    cardExpiry != null && !cardExpiry.trim().isEmpty() &&
                    cardCvv != null && !cardCvv.trim().isEmpty();
        } else if ("bank-transfer".equals(paymentMethod)) {
            // For bank transfer, we trust the user has made the transfer
            return true;
        }
        return false;
    }

    private void logTransaction(Payment payment, boolean success) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timestamp = dateFormat.format(new Date());

        System.out.println("[" + timestamp + "] Transaction: " + payment.getTransactionId() +
                ", Student: " + payment.getStudentName() +
                ", Course: " + payment.getCourseName() +
                ", Amount: " + payment.getCourseFee() +
                ", Status: " + (success ? "SUCCESS" : "FAILED"));
    }
}
