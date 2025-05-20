package com.Student.Registration.util;

import com.Student.Registration.model.User;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import java.util.stream.Collectors;

public class FileUtils {

    /**
     * Reads all lines from a file
     * @param filePath path to the file
     * @return List of strings, each representing a line from the file
     */
    public static List<String> readLinesFromFile(String filePath) throws IOException {
        List<String> lines = new ArrayList<>();
        File file = new File(filePath);

        // Create the file if it doesn't exist
        if (!file.exists()) {
            file.getParentFile().mkdirs(); // Create parent directories if they don't exist
            file.createNewFile();
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                lines.add(line);
            }
        }

        return lines;
    }

    /**
     * Writes lines to a file
     * @param filePath path to the file
     * @param lines list of strings to write
     * @param append if true, append to existing file, otherwise overwrite
     */
    public static boolean writeLinesToFile(String filePath, List<String> lines, boolean append) throws IOException {
        File file = new File(filePath);

        // Create parent directories if they don't exist
        if (!file.exists()) {
            file.getParentFile().mkdirs();
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, append))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}