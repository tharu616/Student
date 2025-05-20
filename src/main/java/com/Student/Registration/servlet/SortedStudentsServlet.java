package com.Student.Registration.servlet;

import com.Student.Registration.dao.UserDao;
import com.Student.Registration.model.User;
import com.Student.Registration.util.SortUtils;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/SortedStudentsServlet")
public class SortedStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            List<User> users = UserDao.readAllUsers();
            List<User> sorted = SortUtils.insertionSort(users);

            request.setAttribute("users", sorted);
            request.getRequestDispatcher("sortedStudents.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error sorting students");
        }
    }
}
