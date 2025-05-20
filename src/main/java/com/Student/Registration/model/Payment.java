package com.Student.Registration.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Payment {
    private String studentEmail;
    private String studentName;
    private String courseCode;
    private String courseName;
    private String courseFee;
    private String paymentMethod;
    private String transactionId;
    private long timestamp;

    public Payment(String studentEmail, String studentName, String courseCode,
                   String courseName, String courseFee, String paymentMethod) {
        this.studentEmail = studentEmail;
        this.studentName = studentName;
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.courseFee = courseFee;
        this.paymentMethod = paymentMethod;
        this.timestamp = System.currentTimeMillis();
        this.transactionId = generateTransactionId();
    }

    // Additional constructor for recreating Payment objects from file data
    public Payment(String studentEmail, String studentName, String courseCode,
                   String courseName, String courseFee, String paymentMethod,
                   String transactionId, long timestamp) {
        this.studentEmail = studentEmail;
        this.studentName = studentName;
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.courseFee = courseFee;
        this.paymentMethod = paymentMethod;
        this.transactionId = transactionId;
        this.timestamp = timestamp;
    }

    // Generate a unique transaction ID
    private String generateTransactionId() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        return "TXN" + dateFormat.format(new Date()) + String.format("%04d", (int)(Math.random() * 10000));
    }

    // Getters
    public String getStudentEmail() { return studentEmail; }
    public String getStudentName() { return studentName; }
    public String getCourseCode() { return courseCode; }
    public String getCourseName() { return courseName; }
    public String getCourseFee() { return courseFee; }
    public String getPaymentMethod() { return paymentMethod; }
    public String getTransactionId() { return transactionId; }
    public long getTimestamp() { return timestamp; }
}
