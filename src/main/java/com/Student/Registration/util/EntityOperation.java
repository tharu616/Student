package com.Student.Registration.util;

// Interface for CRUD operations
public interface EntityOperation<T> {
    T create(T entity);
    T read(int id);
    T update(T entity);
    boolean delete(int id);
}
