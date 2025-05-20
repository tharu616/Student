package com.Student.Registration.model;

public class CourseRegistration {
    private String studentEmail;
    private String studentName;  // Added student name
    private String courseCode;
    private String courseName;   // Added course name
    private String courseFee;    // Added course fee
    private String schoolName;   // Added school name
    private long timestamp;

    // Updated constructor with new fields
    public CourseRegistration(String studentEmail, String studentName, String courseCode,
                              String courseName, String courseFee, String schoolName) {
        this.studentEmail = studentEmail;
        this.studentName = studentName;
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.courseFee = courseFee;
        this.schoolName = schoolName;
        this.timestamp = System.currentTimeMillis();
    }

    // Simplified constructor for backward compatibility
    public CourseRegistration(String studentEmail, String courseCode) {
        this.studentEmail = studentEmail;
        this.courseCode = courseCode;
        this.timestamp = System.currentTimeMillis();
    }

    // Getters
    public String getStudentEmail() { return studentEmail; }
    public String getStudentName() { return studentName; }
    public String getCourseCode() { return courseCode; }
    public String getCourseName() { return courseName; }
    public String getCourseFee() { return courseFee; }
    public String getSchoolName() { return schoolName; }
    public long getTimestamp() { return timestamp; }

}