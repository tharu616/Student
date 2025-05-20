<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/18/2025
  Time: 11:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Student.Registration.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile - STUDYGATE</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f1f1;
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            margin: 30px auto;
            max-width: 900px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background-color: white;
        }
        .profile-photo {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #007bff;
        }
        .form-control {
            background-color: #f9f9f9;
            border: none;
            border-bottom: 1px solid #ccc;
            border-radius: 0;
            margin-bottom: 0.5rem;
        }
        .section-title {
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
            margin-bottom: 20px;
            font-weight: 500;
            color: #333;
        }
        .btn-primary {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .header-bar {
            background-color: #0d6efd;
            padding: 10px 20px;
            color: white;
        }
        .header-bar h5 {
            margin: 0;
            font-weight: 500;
        }
        label {
            font-weight: 500;
            color: #555;
            margin-bottom: 0.2rem;
        }
    </style>
</head>
<body>
<%
    // Get the user object from request attributes
    User user = (User) request.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!-- Header -->
<div class="header-bar">
    <h5>STUDYGATE</h5>
</div>

<!-- Main Profile Card -->
<div class="card p-4">
    <h3 class="text-center mb-4">Student Profile</h3>

    <!-- Profile Photo Section -->
    <div class="text-center mb-4">
        <div class="profile-photo-container mx-auto" style="width: 100px; height: 100px; border-radius: 50%; border: 2px solid #007bff; display: flex; align-items: center; justify-content: center; overflow: hidden;">
            <div class="text-center" style="font-size: 12px; color: #007bff;">
                Profile<br>Photo
            </div>
        </div>
        <button class="btn btn-sm btn-outline-primary mt-2">Change Photo</button>
    </div>

    <!-- Personal Information -->
    <h4 class="section-title">Personal Information</h4>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label>Full Name</label>
            <input type="text" class="form-control" value="<%= user.getFullName() %>" readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>NIC Number</label>
            <input type="text" class="form-control" value="<%= user.getNic() %>" readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>Email Address</label>
            <input type="email" class="form-control" value="<%= user.getEmail() %>" readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>Date of Birth</label>
            <input type="text" class="form-control" value="<%= user.getDateOfBirth() %>" readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>Gender</label>
            <input type="text" class="form-control" value="<%= user.getGender() %>" readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>Reg. No</label>
            <input type="text" class="form-control" value="<%= user.getIndexNumber() %>" readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>Mobile Number</label>
            <input type="text" class="form-control" value="<%= user.getMobileNumber() %>" readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>WhatsApp Number</label>
            <input type="text" class="form-control" value="<%= user.getWhatsAppNumber() %>" readonly>
        </div>
    </div>

    <!-- Guardian Information -->
    <h4 class="section-title mt-4">Guardian Information</h4>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label>Guardian Name</label>
            <input type="text" class="form-control" value="<%= user.getParentFullName() %>" readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>Guardian Phone Number</label>
            <input type="text" class="form-control" value="<%= user.getParentContactNumber() %>" readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>Guardian Email</label>
            <input type="email" class="form-control" value="<%= user.getParentEmail() %>" readonly>
        </div>
    </div>

    <!-- Buttons -->
    <div class="d-flex justify-content-between mt-4">
        <button class="btn btn-primary" onclick="location.href='EditProfileServlet'">Edit Profile</button>
        <button class="btn btn-danger" onclick="location.href='LogoutServlet'">Logout</button>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
