
package com.Student.Registration.model;

import java.util.Map;
import com.fasterxml.jackson.annotation.JsonProperty;

public class AllCourses {
    private Map<String, School> schools;

    public Map<String, School> getSchools() {
        return schools;
    }

    public void setSchools(Map<String, School> schools) {
        this.schools = schools;
    }
}