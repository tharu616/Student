package com.Student.Registration.dao;

import com.Student.Registration.util.FileUtils;
import java.io.IOException;
import java.util.List;

public abstract class BaseDao<T> {
    protected String filePath;

    public BaseDao(String filePath) {
        this.filePath = filePath;
    }

    protected List<String> readAllLines() throws IOException {
        return FileUtils.readLinesFromFile(filePath);
    }

    protected abstract T mapEntityFromLine(String line);
}
