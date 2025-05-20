<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/18/2025
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Student.Registration.model.User" %>
<%@ page import="com.Student.Registration.model.CourseRegistration" %>
<%@ page import="com.Student.Registration.model.Notice" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/UserDashboard.css" rel="stylesheet">
</head>
<body class="full-screen-body">
<%
    // Get attributes from request
    User user = (User) request.getAttribute("user");
    List<CourseRegistration> enrolledCourses = (List<CourseRegistration>) request.getAttribute("enrolledCourses");
    List<Notice> notices = (List<Notice>) request.getAttribute("notices");

    // Default to empty collections if null
    if (enrolledCourses == null) enrolledCourses = java.util.Collections.emptyList();
    if (notices == null) notices = java.util.Collections.emptyList();

    // User might be null if there was an error
    String userName = (user != null) ? user.getFullName() : "Student";
    String userInitials = "";

    if (user != null && user.getFullName() != null && !user.getFullName().isEmpty()) {
        String[] nameParts = user.getFullName().split(" ");
        if (nameParts.length > 0) {
            userInitials += nameParts[0].charAt(0);
        }
        if (nameParts.length > 1) {
            userInitials += nameParts[nameParts.length - 1].charAt(0);
        }
    } else {
        userInitials = "ST"; // Default initials
    }
%>
<div class="dashboard-container">
    <div class="row g-0">
        <!-- Sidebar -->
        <div class="col-auto sidebar">
            <div class="app-logo text-center py-4">
                <div class="logo-container">
                    <i class="fas fa-graduation-cap"></i>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul class="nav flex-column">
                    <li class="nav-item active">
                        <a href="UserDashboard.jsp" class="nav-link">
                            <i class="fas fa-th-large me-3"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="PaymentServlet" class="nav-link">
                            <i class="fas fa-credit-card me-3"></i>
                            <span>Payment Info</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="Courses" class="nav-link">
                            <i class="fas fa-book me-3"></i>
                            <span>Courses</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="NoticeServlet" class="nav-link">
                            <i class="fas fa-bell me-3"></i>
                            <span>Notice</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="mt-auto p-3">
                <a href="Logout" class="btn btn-outline-light w-100" id="logout-btn">
                    <i class="fas fa-sign-out-alt me-2"></i>
                    <span>Logout</span>
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-lg-10 main-content">
            <!-- Header -->
            <div class="header">
                <div class="search-bar">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <div class="profile-section">
                    <div class="profile-pic">
                        <span><%= userInitials %></span>
                    </div>
                    <div>
                        <strong><%= userName %></strong>
                    </div>
                </div>
            </div>

            <!-- Welcome Banner -->
            <div class="welcome-banner">
                <div class="decoration decoration-1"></div>
                <div class="decoration decoration-2"></div>
                <div class="decoration decoration-3"></div>
                <h2>Welcome back, <%= user != null ? user.getFullName().split(" ")[0] : "Student" %>!</h2>
                <p>Always stay updated in your student portal</p>
                <img src="./d-happy-student-man-headphone-isolated-white-transparent-background-png-image-visually-stunning-high-quality-374363908-removebg-preview.png" alt="Student Illustration" class="illustration">
            </div>

            <!-- Courses Section -->
            <div class="card-section">
                <div class="d-flex justify-content-between align-items-center">
                    <h3>Enrolled Courses</h3>
                    <a href="#" class="see-all">See all</a>
                </div>
                <div class="row g-4">
                    <%
                        // Display enrolled courses or a message if none
                        if (enrolledCourses.isEmpty()) {
                    %>
                    <div class="col-md-12">
                        <div class="alert alert-info">
                            You are not enrolled in any courses yet.
                        </div>
                    </div>
                    <%
                    } else {
                        // Display up to 2 courses, alternating between purple and blue
                        int count = 0;
                        for (CourseRegistration course : enrolledCourses) {
                            if (count >= 2) break; // Show max 2 courses
                            boolean isPurple = (count % 2 == 0);
                    %>
                    <div class="col-md-6">
                        <div class="course-card <%= isPurple ? "purple" : "" %>">
                            <div class="course-info">
                                <div class="icon <%= isPurple ? "purple-icon" : "" %>">
                                    <i class="<%= isPurple ? "fas fa-code" : "fas fa-database" %>"></i>
                                </div>
                                <div>
                                    <h4><%= course.getCourseName() %></h4>
                                    <p class="course-details">
                                        <span class="course-code"><%= course.getCourseCode() %></span>
                                        <span class="course-school"><%= course.getSchoolName() %></span>
                                    </p>
                                </div>
                            </div>
                            <button class="btn">View</button>
                        </div>
                    </div>
                    <%
                                count++;
                            }
                        }
                    %>
                </div>
            </div>

            <!-- Notices Section -->
            <div class="card-section">
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3>Daily notice</h3>
                            <a href="#" class="see-all">See all</a>
                        </div>
                        <%
                            // Display notices or a message if none
                            if (notices.isEmpty()) {
                        %>
                        <div class="notice-card">
                            <h5>No notices available</h5>
                            <p>There are no new notices at this time.</p>
                        </div>
                        <%
                        } else {
                            // Display notices
                            for (Notice notice : notices) {
                        %>
                        <div class="notice-card">
                            <h5><%= notice.getTitle() %></h5>
                            <p><%= notice.getContent() %></p>
                            <a href="#" class="see-more">See more</a>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>

                    <!-- User Information Card -->
                    <div class="col-md-6">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3>My Information</h3>
                            <a href="#" class="see-all">Edit</a>
                        </div>
                        <div class="user-info-card">
                            <div class="user-info-item">
                                <span class="info-label">Full Name:</span>
                                <span class="info-value"><%= user != null ? user.getFullName() : "Not available" %></span>
                            </div>
                            <div class="user-info-item">
                                <span class="info-label">Email:</span>
                                <span class="info-value"><%= user != null ? user.getEmail() : "Not available" %></span>
                            </div>
                            <div class="user-info-item">
                                <span class="info-label">Mobile:</span>
                                <span class="info-value"><%= user != null ? user.getMobileNumber() : "Not available" %></span>
                            </div>
                            <div class="user-info-item">
                                <span class="info-label">Date of Birth:</span>
                                <span class="info-value"><%= user != null ? user.getDateOfBirth() : "Not available" %></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap and other JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Custom JS -->
<script src="js/UserDashboard.js"></script>
</body>
</html>