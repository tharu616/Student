
package com.Student.Registration.model;

import java.util.Map;
import com.fasterxml.jackson.annotation.JsonAnySetter;

public class School {
    private Map<String, Course> courses;

    public Map<String, Course> getCourses() {
        return courses;
    }

    public void setCourses(Map<String, Course> courses) {
        this.courses = courses;
    }

    // Add this to handle the JSON structure properly
    @JsonAnySetter
    public void setCourse(String name, Course course) {
        if (courses == null) {
            courses = new java.util.HashMap<>();
        }
        courses.put(name, course);
    }
}