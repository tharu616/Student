package com.Student.Registration.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Notice extends BaseEntity {
    private String title;
    private String content;
    private Date timestamp;
    private boolean read;

    public Notice(String title, String content, Date timestamp) {
        this.title = title;
        this.content = content;
        this.timestamp = timestamp;
        this.read = false;
    }

    // Getters and setters
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public Date getTimestamp() { return timestamp; }
    public void setTimestamp(Date timestamp) { this.timestamp = timestamp; }

    public boolean isRead() { return read; }
    public void setRead(boolean read) { this.read = read; }

    // Implementing BaseEntity methods
    @Override
    public boolean validate() {
        return title != null && !title.isEmpty() && content != null && timestamp != null;
    }

    @Override
    public String format() {
        return title + "|" + content + "|" + timestamp.getTime();
    }

    // Methods to support data visualization
    public String getFormattedDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("MMMM d, yyyy");
        return sdf.format(timestamp);
    }
}
