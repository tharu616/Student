package com.Student.Registration.dao;

import com.Student.Registration.model.User;
import com.Student.Registration.util.FileUtils;
import org.mindrot.jbcrypt.BCrypt;

import java.io.*;
import java.util.*;
import java.util.UUID;
import java.util.UUID;

public class UserDao {

    private static final String FILE_PATH = "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\users.txt";

    public void saveUser(User user) throws IOException {

        // Generate register number if not already set
        if (user.getRegisterNumber() == null || user.getRegisterNumber().isEmpty()) {
            user.setRegisterNumber(generateRegisterNumber());
        }

        String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());

        List<String> lines = new ArrayList<>();
        lines.add(user.getFullName() + "," + user.getNic() + "," + user.getEmail() + "," + hashedPassword + "," +  user.getDateOfBirth() + "," + user.getGender() + "," + user.getMobileNumber() + "," + user.getWhatsAppNumber() + "," + user.getPermanentAddress() + "," + user.getDistrictOrProvince() + "," + user.getPostalCode() + "," + user.getIndexNumber() + "," + user.getYearOfCompletion() + "," + user.getCertificates() + "," + user.getParentFullName() + "," + user.getParentContactNumber() + "," + user.getParentEmail() + "," + user.getRegisterNumber());

        FileUtils.writeLinesToFile(FILE_PATH, lines, true); // append mode
    }

    public boolean validateUser(String inputEmail, String inputPassword) {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length > 2) {
                    String storedEmail = parts[2]; // Email is at index 2
                    String storedHash = parts[3];   // Password is at index 3

                    if (inputEmail.equals(storedEmail)) {
                        return BCrypt.checkpw(inputPassword, storedHash);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

        public static List<User> readAllUsers () throws IOException {
            List<String> lines = FileUtils.readLinesFromFile(FILE_PATH);
            List<User> users = new ArrayList<>();
            for (String line : lines) {
                String[] parts = line.split(",");
                if (parts.length >= 17) {
                    User user = new User(
                            parts[0], // fullName
                            parts[1], // nic
                            parts[2], // email
                            parts[3], // password
                            parts[4], // dateOfBirth
                            parts[5], // gender
                            parts[6], // mobileNumber
                            parts[7], // whatsAppNumber
                            parts[8], // permanentAddress
                            parts[9], // districtOrProvince
                            parts[10], // postalCode
                            parts[11], // indexNumber
                            parts[12], // yearOfCompletion
                            Arrays.asList(parts[13].split("\\|")), // certificates
                            parts[14], // parentFullName
                            parts[15], // parentContactNumber
                            parts[16] // parentEmail
                    );
                    // Set register number if available
                    if (parts.length > 17) {
                        user.setRegisterNumber(parts[17]);
                    }
                    users.add(user);
                }
            }
            return users;
        }

    public User getUserByEmail(String email) {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 17) {
                    String storedEmail = parts[2]; // Email is at index 2

                    if (email.equals(storedEmail)) {
                        // Found the user, create and return User object
                        return new User(
                                parts[0], // fullName
                                parts[1], // nic
                                parts[2], // email
                                parts[3], // password (hashed)
                                parts[4], // dateOfBirth
                                parts[5], // gender
                                parts[6], // mobileNumber
                                parts[7], // whatsAppNumber
                                parts[8], // permanentAddress
                                parts[9], // districtOrProvince
                                parts[10], // postalCode
                                parts[11], // indexNumber
                                parts[12], // yearOfCompletion
                                Arrays.asList(parts[13].split("\\|")), // certificates
                                parts[14], // parentFullName
                                parts[15], // parentContactNumber
                                parts[16]  // parentEmail
                        );
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null; // User not found
    }

    private String generateRegisterNumber() {
        String prefix = "STU";
        int nextNumber = 1001;

        try {
            // Read the last line to get the latest register number
            String lastLine = readLastLine();

            if (lastLine != null && !lastLine.isEmpty()) {
                String[] parts = lastLine.split(",");
                // Check if the register number is available (last part)
                if (parts.length > 17) {
                    String lastRegNum = parts[17];
                    if (lastRegNum != null && lastRegNum.startsWith(prefix)) {
                        try {
                            // Extract number part and increment
                            int num = Integer.parseInt(lastRegNum.substring(prefix.length()));
                            nextNumber = num + 1;
                        } catch (NumberFormatException e) {
                            // Use default if format is incorrect
                        }
                    }
                }
            }
        } catch (Exception e) {
            // Use default in case of error
        }

        // Return the new register number
        return prefix + nextNumber;
    }

    private String readLastLine() {
        try {
            File file = new File(FILE_PATH);
            if (!file.exists() || file.length() == 0) {
                return null;
            }

            try (RandomAccessFile raf = new RandomAccessFile(file, "r")) {
                long fileLength = raf.length();

                // Start from the end of file
                raf.seek(fileLength - 1);

                // Go backwards until we find a newline or reach the beginning
                for (long i = fileLength - 1; i >= 0; i--) {
                    raf.seek(i);
                    char c = (char) raf.read();

                    // If newline found and not at the end of file
                    if (c == '\n' && i < fileLength - 1) {
                        raf.seek(i + 1);
                        break;
                    }

                    // If at the beginning of file
                    if (i == 0) {
                        raf.seek(0);
                    }
                }

                return raf.readLine();
            }
        } catch (IOException e) {
            return null;
        }
    }
}

