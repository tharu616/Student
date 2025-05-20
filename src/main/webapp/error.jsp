<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/18/2025
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - STUDYGATE</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f1f1;
            font-family: 'Segoe UI', sans-serif;
        }
        .error-container {
            margin: 100px auto;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background-color: white;
            padding: 40px;
            text-align: center;
        }
        .error-icon {
            color: #dc3545;
            font-size: 50px;
            margin-bottom: 20px;
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
    </style>
</head>
<body>
<!-- Header -->
<div class="header-bar">
    <h5>STUDYGATE</h5>
</div>

<div class="error-container">
    <div class="error-icon">
        <i class="bi bi-exclamation-triangle-fill"></i>⚠️
    </div>
    <h2 class="mb-4">Error Occurred</h2>
    <p class="mb-4">
        <%= request.getAttribute("errorMessage") != null ?
                request.getAttribute("errorMessage") : "An unexpected error occurred. Please try again later." %>
    </p>
    <div class="mt-4">
        <a href="Login.jsp" class="btn btn-primary">Return to Login</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
