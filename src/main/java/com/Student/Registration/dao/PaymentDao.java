package com.Student.Registration.dao;

import com.Student.Registration.model.Payment;
import com.Student.Registration.util.FileUtils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class PaymentDao {
    private static final String FILE_PATH = "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\Payment.txt";

    public boolean savePayment(Payment payment) throws IOException {
        List<String> lines = new ArrayList<>();

        // Format: studentEmail,studentName,courseCode,courseName,courseFee,paymentMethod,transactionId,timestamp
        lines.add(payment.getStudentEmail() + "," +
                payment.getStudentName() + "," +
                payment.getCourseCode() + "," +
                payment.getCourseName() + "," +
                payment.getCourseFee() + "," +
                payment.getPaymentMethod() + "," +
                payment.getTransactionId() + "," +
                payment.getTimestamp());

        // Save to file (append mode)
        return FileUtils.writeLinesToFile(FILE_PATH, lines, true);
    }

    public List<Payment> getPaymentsByEmail(String userEmail) throws IOException {
        return FileUtils.readLinesFromFile(FILE_PATH).stream()
                .map(line -> line.split(","))
                .filter(parts -> parts.length >= 8 && parts[0].equalsIgnoreCase(userEmail))
                .map(parts -> new Payment(
                        parts[0], // studentEmail
                        parts[1], // studentName
                        parts[2], // courseCode
                        parts[3], // courseName
                        parts[4], // courseFee
                        parts[5], // paymentMethod
                        parts[6], // transactionId
                        Long.parseLong(parts[7]) // timestamp
                ))
                .collect(Collectors.toList());
    }

    public Payment getPaymentByTransactionId(String transactionId) throws IOException {
        return FileUtils.readLinesFromFile(FILE_PATH).stream()
                .map(line -> line.split(","))
                .filter(parts -> parts.length >= 8 && parts[6].equals(transactionId))
                .map(parts -> new Payment(
                        parts[0], // studentEmail
                        parts[1], // studentName
                        parts[2], // courseCode
                        parts[3], // courseName
                        parts[4], // courseFee
                        parts[5], // paymentMethod
                        parts[6], // transactionId
                        Long.parseLong(parts[7]) // timestamp
                ))
                .findFirst()
                .orElse(null);
    }
}
