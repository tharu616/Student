package com.Student.Registration.servlet;

import com.Student.Registration.model.AllCourses;
import com.Student.Registration.util.JsonUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;


public class LoadCoursesServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();
        // Load and parse the JSON file during servlet initialization
        try {
            loadCourses();
        } catch (IOException e) {
            throw new ServletException("Failed to load courses during initialization", e);
        }
    }

    private void loadCourses() throws IOException {
        String filePath = "/WEB-INF/CoursesList.json";
        InputStream is = getServletContext().getResourceAsStream(filePath);
        if (is == null) {
            throw new FileNotFoundException("File not found: " + filePath);
        }

        AllCourses allCourses = JsonUtils.readAllCoursesFromJson(is);
        getServletContext().setAttribute("allCourses", allCourses);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get the courses from context or reload if needed
            AllCourses allCourses = (AllCourses) getServletContext().getAttribute("allCourses");
            if (allCourses == null) {
                loadCourses();
                allCourses = (AllCourses) getServletContext().getAttribute("allCourses");
            }

            request.setAttribute("allCourses", allCourses);
            // Redirect on success
            request.getRequestDispatcher("CourseSelection.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading courses: " + e.getMessage());
        }
    }
}
