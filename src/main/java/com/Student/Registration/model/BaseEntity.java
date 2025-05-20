package com.Student.Registration.model;

// Base class for all models
public abstract class BaseEntity {
    private int id;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    // Over-validation
    public abstract boolean validate();

    // Formatting to a file
    public abstract String format();
}
