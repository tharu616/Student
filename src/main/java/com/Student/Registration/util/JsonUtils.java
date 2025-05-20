package com.Student.Registration.util;

import com.Student.Registration.model.AllCourses;
import com.Student.Registration.model.Course;
import com.Student.Registration.model.School;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.DeserializationFeature;

import java.io.InputStream;
import java.io.IOException;
import java.util.Map;

public class JsonUtils {
    public static AllCourses readAllCoursesFromJson(InputStream is) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        // Parse JSON directly to Map structure first
        Map<String, Map<String, Map<String, String>>> rawData =
                objectMapper.readValue(is, Map.class);

        // Then convert to our structured objects
        AllCourses allCourses = new AllCourses();
        Map<String, School> schools = new java.util.HashMap<>();

        for (Map.Entry<String, Map<String, Map<String, String>>> schoolEntry : rawData.entrySet()) {
            String schoolName = schoolEntry.getKey();
            Map<String, Map<String, String>> coursesMap = schoolEntry.getValue();

            School school = new School();
            Map<String, Course> courses = new java.util.HashMap<>();

            for (Map.Entry<String, Map<String, String>> courseEntry : coursesMap.entrySet()) {
                String courseName = courseEntry.getKey();
                Map<String, String> courseDetails = courseEntry.getValue();

                Course course = new Course();
                course.setCourseCode(courseDetails.get("Course Code"));
                course.setDuration(courseDetails.get("Duration"));
                course.setFee(courseDetails.get("Fee"));

                courses.put(courseName, course);
            }

            school.setCourses(courses);
            schools.put(schoolName, school);
        }

        allCourses.setSchools(schools);
        System.out.println("Successfully parsed courses");
        return allCourses;
    }
}