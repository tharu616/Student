package com.Student.Registration.servlet;

import com.Student.Registration.model.User;
import com.Student.Registration.util.FileUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;


public class StudentDetailsSave {

    private static final String REG_FILE = "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\users.txt";

    public static void writeLinesToFile(String filePath, List<String> lines, boolean b) {
    }

    public void addRegistration(String fullName, String nic, String email, String password, String dateOfBirth, String gender, String mobileNumber, String whatsappNumber, String permanentAddress, String districtOrProvince, String postalCode, String indexNumber, String yearOfCompletion, List<String> certificates, String parentFullName, String parentContactNumber, String parentEmail, long timestamp) throws IOException{
        User registration = new User(fullName, nic, email, password, dateOfBirth, gender, mobileNumber, whatsappNumber, permanentAddress, districtOrProvince, postalCode, indexNumber, yearOfCompletion, certificates, parentFullName, parentContactNumber, parentEmail);
        registration.setFullName(fullName);
        registration.setNic(nic);
        registration.setEmail(email);
        registration.setPassword(password);
        registration.setDateOfBirth(dateOfBirth);
        registration.setGender(gender);
        registration.setMobileNumber(mobileNumber);
        registration.setWhatsAppNumber(whatsappNumber);
        registration.setPermanentAddress(permanentAddress);
        registration.setDistrictOrProvince(districtOrProvince);
        registration.setPostalCode(postalCode);
        registration.setIndexNumber(indexNumber);
        registration.setYearOfCompletion(yearOfCompletion);
        registration.setCertificates(certificates);
        registration.setParentFullName(parentFullName);
        registration.setParentContactNumber(parentContactNumber);
        registration.setParentEmail(parentEmail);



        List<String> lines = new ArrayList<>();
        lines.add(registration.toString() + registration.getNic() + registration.getEmail() + registration.getPassword() + registration.getDateOfBirth() + registration.getGender() + registration.getMobileNumber() + registration.getWhatsAppNumber() + registration.getPermanentAddress() + registration.getDistrictOrProvince() + registration.getPostalCode() + registration.getIndexNumber() + registration.getYearOfCompletion() + registration.getCertificates() + registration.getParentFullName() + registration.getParentContactNumber() + registration.getParentEmail());
        FileUtils.writeLinesToFile(REG_FILE, lines, true); // append
    }
}
