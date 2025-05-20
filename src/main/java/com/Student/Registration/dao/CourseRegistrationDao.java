package com.Student.Registration.dao;

import com.Student.Registration.model.Payment;
import com.Student.Registration.model.CourseRegistration;
import com.Student.Registration.util.FileUtils;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class CourseRegistrationDao {
    private static final String FILE_PATH = "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\CourseRegistration.txt";

    public List<CourseRegistration> getRegistrationsByEmail(String userEmail) throws IOException {
        return FileUtils.readLinesFromFile(FILE_PATH).stream()
                .map(line -> line.split(","))
                .filter(parts -> parts.length >= 6 && parts[0].equalsIgnoreCase(userEmail))
                .map(parts -> new CourseRegistration(
                        parts[0], parts[1], parts[2],
                        parts[3], parts[4], parts[5]))
                .collect(Collectors.toList());
    }
}
