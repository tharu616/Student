package com.Student.Registration.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Course {
    @JsonProperty("Course Code")
    private String courseCode;

    @JsonProperty("Duration")
    private String duration;

    @JsonProperty("Fee")
    private String fee;

    // Default constructor for Jackson
    public Course() {}

    // Getters & Setters
    public String getCourseCode() { return courseCode; }
    public void setCourseCode(String courseCode) { this.courseCode = courseCode; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public String getFee() { return fee; }
    public void setFee(String fee) { this.fee = fee; }
}
