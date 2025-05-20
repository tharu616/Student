package com.Student.Registration.util;

import com.Student.Registration.dao.PersistentQueueDao;
import com.Student.Registration.model.CourseRegistration;
import java.util.LinkedList;
import java.util.Queue;

/**
 * Manager class for handling course registration queue operations
 * Enhanced with persistent storage to maintain queue state between application restarts
 */
public class RegistrationQueueManager {
    // In-memory queue for runtime operations
    private static Queue<CourseRegistration> queue = new LinkedList<>();
    // DAO for persistent storage
    private static final PersistentQueueDao queueDao = new PersistentQueueDao();
    // Flag to track if queue has been loaded from persistent storage
    private static boolean isLoaded = false;

    /**
     * Ensures queue is loaded from persistent storage
     */
    private static void ensureQueueLoaded() {
        if (!isLoaded) {
            queue = queueDao.loadQueue();
            isLoaded = true;
        }
    }

    /**
     * Add a new course registration request to the queue
     * @param registration The course registration to add
     */
    public static void addRegistration(CourseRegistration registration) {
        ensureQueueLoaded();
        queue.add(registration);
        queueDao.addRegistration(registration);
    }

    /**
     * Process/remove the next request in the queue (FIFO)
     * @return The next course registration in the queue, or null if empty
     */
    public static CourseRegistration processNextRegistration() {
        ensureQueueLoaded();
        CourseRegistration registration = queue.poll();
        if (registration != null) {
            queueDao.removeFirstRegistration();
        }
        return registration;
    }

    /**
     * Get all pending registrations
     * @return The queue of pending course registrations
     */
    public static Queue<CourseRegistration> getAllRegistrations() {
        ensureQueueLoaded();
        return new LinkedList<>(queue); // Return a copy to prevent external modification
    }

    /**
     * Get the current size of the registration queue
     * @return Number of pending registrations
     */
    public static int getQueueSize() {
        ensureQueueLoaded();
        return queue.size();
    }

    /**
     * Clear all pending registrations
     * @return True if operation was successful
     */
    public static boolean clearAllRegistrations() {
        ensureQueueLoaded();
        queue.clear();
        return queueDao.saveQueue(queue);
    }
}