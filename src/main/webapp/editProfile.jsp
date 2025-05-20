<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/18/2025
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Student.Registration.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - STUDYGATE</title>
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
    <h3 class="text-center mb-4">Edit Profile</h3>

    <!-- Profile Photo Section -->
    <div class="text-center mb-4">
        <div class="profile-photo-container mx-auto" style="width: 100px; height: 100px; border-radius: 50%; border: 2px solid #007bff; display: flex; align-items: center; justify-content: center; overflow: hidden;">
            <div class="text-center" style="font-size: 12px; color: #007bff;">
                Profile<br>Photo
            </div>
        </div>
        <button class="btn btn-sm btn-outline-primary mt-2">Change Photo</button>
    </div>

    <form action="EditProfileServlet" method="post">
        <!-- Personal Information -->
        <h4 class="section-title">Personal Information</h4>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" value="<%= user.getFullName() %>">
            </div>
            <div class="col-md-6 mb-3">
                <label for="nic">NIC Number</label>
                <input type="text" class="form-control" id="nic" name="nic" value="<%= user.getNic() %>" readonly>
            </div>
            <div class="col-md-6 mb-3">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" readonly>
            </div>
            <div class="col-md-6 mb-3">
                <label for="dateOfBirth">Date of Birth</label>
                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="<%= user.getDateOfBirth() %>">
            </div>
            <div class="col-md-6 mb-3">
                <label for="gender">Gender</label>
                <select class="form-control" id="gender" name="gender">
                    <option value="Male" <%= user.getGender().equals("Male") ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= user.getGender().equals("Female") ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= user.getGender().equals("Other") ? "selected" : "" %>>Other</option>
                </select>
            </div>
            <div class="col-md-6 mb-3">
                <label for="indexNumber">Reg. No</label>
                <input type="text" class="form-control" id="indexNumber" name="indexNumber" value="<%= user.getIndexNumber() %>">
            </div>
            <div class="col-md-6 mb-3">
                <label for="mobileNumber">Mobile Number</label>
                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="<%= user.getMobileNumber() %>">
            </div>
            <div class="col-md-6 mb-3">
                <label for="whatsAppNumber">WhatsApp Number</label>
                <input type="text" class="form-control" id="whatsAppNumber" name="whatsAppNumber" value="<%= user.getWhatsAppNumber() %>">
            </div>
        </div>

        <!-- Guardian Information -->
        <h4 class="section-title mt-4">Guardian Information</h4>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="parentFullName">Guardian Name</label>
                <input type="text" class="form-control" id="parentFullName" name="parentFullName" value="<%= user.getParentFullName() %>">
            </div>
            <div class="col-md-6 mb-3">
                <label for="parentContactNumber">Guardian Phone Number</label>
                <input type="text" class="form-control" id="parentContactNumber" name="parentContactNumber" value="<%= user.getParentContactNumber() %>">
            </div>
            <div class="col-md-6 mb-3">
                <label for="parentEmail">Guardian Email</label>
                <input type="email" class="form-control" id="parentEmail" name="parentEmail" value="<%= user.getParentEmail() %>">
            </div>
        </div>

        <!-- Buttons -->
        <div class="d-flex justify-content-between mt-4">
            <button type="submit" class="btn btn-primary">Save Changes</button>
            <a href="UserProfileServlet" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>