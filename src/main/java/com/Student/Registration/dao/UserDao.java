package com.Student.Registration.dao;

import com.Student.Registration.model.User;
import com.Student.Registration.servlet.StudentDetailsSave;
import com.Student.Registration.util.FileUtils;

import java.io.*;
import java.util.*;

public class UserDao {

    private static final String FILE_PATH = "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\users.txt";


        public void saveUser(User user) throws IOException {
            List<String> lines = new ArrayList<>();
            lines.add(user.getFullName() + "," + user.getNic() + "," + user.getEmail() + "," + user.getPassword() + "," +  user.getDateOfBirth() + "," + user.getGender() + "," + user.getMobileNumber() + "," + user.getWhatsAppNumber() + "," + user.getPermanentAddress() + "," + user.getDistrictOrProvince() + "," + user.getPostalCode() + "," + user.getIndexNumber() + "," + user.getYearOfCompletion() + "," + user.getCertificates() + "," + user.getParentFullName() + "," + user.getParentContactNumber() + "," + user.getParentEmail());
            FileUtils.writeLinesToFile(FILE_PATH, lines, true); // append mode
        }

    public boolean validateUser(String inputEmail, String inputPassword) {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 4) {
                    String storedEmail = parts[2].trim();
                    String storedPassword = parts[3].trim();

                    if (storedEmail.equals(inputEmail) && storedPassword.equals(inputPassword)) {
                        return true;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

}

