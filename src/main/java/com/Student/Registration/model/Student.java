package com.Student.Registration.model;

public class Student {
    private String id;
    private String name;
    private String email;


    public Student(String id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }

    // Getters
    public String getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
}
