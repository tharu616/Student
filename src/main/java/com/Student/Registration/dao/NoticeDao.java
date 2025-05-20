package com.Student.Registration.dao;

import com.Student.Registration.model.Notice;
import com.Student.Registration.util.EntityOperation;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class NoticeDao extends BaseDao<Notice> implements EntityOperation<Notice> {
    private static final String DEFAULT_FILE_PATH = "C:\\Users\\USER\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\StudentRegistrationSystem\\StudentCourseRegistration\\src\\main\\resources\\data\\Notice.txt";
    private static AtomicInteger idCounter = new AtomicInteger(0);

    public NoticeDao() {
        super(DEFAULT_FILE_PATH);
    }

    public NoticeDao(String customPath) {
        super(customPath);
    }

    public List<Notice> getRecentNotices(int count) throws IOException {
        return readAllLines().stream()
                .map(this::mapEntityFromLine)
                .filter(notice -> notice != null)
                .sorted((a, b) -> b.getTimestamp().compareTo(a.getTimestamp()))
                .limit(count)
                .collect(Collectors.toList());
    }

    public List<Notice> getAllNotices() throws IOException {
        return readAllLines().stream()
                .map(this::mapEntityFromLine)
                .filter(notice -> notice != null)
                .sorted((a, b) -> b.getTimestamp().compareTo(a.getTimestamp()))
                .collect(Collectors.toList());
    }

    @Override
    protected Notice mapEntityFromLine(String line) {
        String[] parts = line.split("\\|");
        if (parts.length >= 3) {
            Notice notice = new Notice(
                    parts[0],
                    parts[1],
                    new Date(Long.parseLong(parts[2]))
            );
            notice.setId(idCounter.incrementAndGet());
            return notice;
        }
        return null;
    }

    // EntityOperation interface හි ක්‍රියාත්මක කිරීම්
    @Override
    public Notice create(Notice entity) {
        // Announcement creation - execution
        return entity;
    }

    @Override
    public Notice read(int id) {
        // Reading one notification - execution
        return null;
    }

    @Override
    public Notice update(Notice entity) {
        // Announcement update - implementation
        return entity;
    }

    @Override
    public boolean delete(int id) {
        // Delete notifications - implementation
        return false;
    }
}
