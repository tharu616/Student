package com.Student.Registration.dao;

import com.Student.Registration.model.Student;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class FileHandler {

    private static final String STUDENT_FILE = "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\ students.txt";

    public static void saveStudent(Student student) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(STUDENT_FILE, true))) {
            writer.write(student.getId() + "," + student.getName() + "," + student.getEmail());
            writer.newLine();
        }
    }
}
