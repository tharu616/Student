package com.Student.Registration.util;

import java.io.*;
import java.nio.file.*;
import java.util.*;

    public class FileUtils {

        public static List<String> readLinesFromFile(String path) throws IOException {
            if (!Files.exists(Paths.get(path))) {
                Files.createFile(Paths.get(path));
            }
            return Files.readAllLines(Paths.get(path));
        }

        public static void writeLinesToFile(String path, List<String> lines, boolean append) throws IOException {
            if (!Files.exists(Paths.get(path))) {
                Files.createFile(Paths.get(path));
            }

            if (append) {
                Files.write(Paths.get(path), lines, StandardOpenOption.APPEND);
            } else {
                Files.write(Paths.get(path), lines);
            }
        }
    }

