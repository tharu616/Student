package com.Student.Registration.dao;


import com.Student.Registration.model.CourseRegistration;
import com.Student.Registration.util.FileUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 * Data Access Object for persistent storage of the registration queue
 * This enhances the system by ensuring the queue state survives application restarts
 */
public class PersistentQueueDao {
    private static final String QUEUE_FILE_PATH = "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\RegistrationQueue.txt";

    /**
     * Save the entire queue to the file system
     * @param queue The queue of course registrations
     * @return True if save operation was successful
     */
    public boolean saveQueue(Queue<CourseRegistration> queue) {
        try {
            List<String> lines = new ArrayList<>();
            for (CourseRegistration registration : queue) {
                // Format: email,courseCode,timestamp
                lines.add(registration.getStudentEmail() + "," +
                        registration.getCourseCode() + "," +
                        registration.getTimestamp());
            }

            // Write to file (overwrite mode)
            FileUtils.writeLinesToFile(QUEUE_FILE_PATH, lines, false);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Load the queue from the file system
     * @return Queue of course registrations
     */
    public Queue<CourseRegistration> loadQueue() {
        Queue<CourseRegistration> queue = new LinkedList<>();
        try {
            List<String> lines = FileUtils.readLinesFromFile(QUEUE_FILE_PATH);

            for (String line : lines) {
                String[] parts = line.split(",");
                if (parts.length >= 3) {
                    String email = parts[0];
                    String courseCode = parts[1];
                    long timestamp = Long.parseLong(parts[2]);

                    // Create registration with the original timestamp
                    CourseRegistration registration = new CourseRegistration(email, courseCode) {
                        @Override
                        public long getTimestamp() {
                            return timestamp;
                        }
                    };

                    queue.add(registration);
                }
            }
        } catch (IOException e) {
            // If file doesn't exist yet, return empty queue
            System.out.println("Queue file not found. Starting with empty queue.");
        }

        return queue;
    }

    /**
     * Add a single registration to the queue file
     * @param registration The course registration to add
     * @return True if the operation was successful
     */
    public boolean addRegistration(CourseRegistration registration) {
        try {
            List<String> lines = new ArrayList<>();
            lines.add(registration.getStudentEmail() + "," +
                    registration.getCourseCode() + "," +
                    registration.getTimestamp());

            // Append to the file
            FileUtils.writeLinesToFile(QUEUE_FILE_PATH, lines, true);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Remove the first registration from the queue file
     * @return True if the operation was successful
     */
    public boolean removeFirstRegistration() {
        try {
            Queue<CourseRegistration> queue = loadQueue();
            if (!queue.isEmpty()) {
                queue.poll(); // Remove the first item
                return saveQueue(queue); // Save the updated queue
            }
            return true; // Nothing to remove
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
