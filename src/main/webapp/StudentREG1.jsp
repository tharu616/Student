<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/11/2025
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Study Gate Student Registration Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/StudentREG1.css">
</head>
<body>
<!-- Header Section -->
<header class="bg-light mt-3 mb-5">
    <div class="row align-items-center">
        <div class="col-md-3">
            <img src="images/Study gate1.png" alt="StudyGate Logo" class="img-fluid logo">
        </div>
        <div class="col-md-9 text-end">
            <nav class="navbar navbar-expand-lg navbar-light">
                <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav1">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="StudentREG1.jsp">Welcome</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">Student Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Course Registration</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Document Verification</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Batch Details & Fee Plan</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Submit</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>

<!-- Main Content Section -->
<div class="container">
    <div class="row justify-content-center">
        <h1 class="text-center mb-5">Welcome to the <span class="text-danger">StudyGate Student Registration Portal.</span></h1>
        <div class="bg-image">

        </div>
    </div>

    <div class="row">
        <!-- Existing Student Card -->
        <div class="col-md-6 mb-4">
            <div class="card h-100 bg-warning text-white">
                <div class="card-body d-flex flex-column justify-content-between">
                    <h2 class="card-title text-center">Existing Student</h2>
                    <a href="Login.jsp" class="btn btn-outline-light w-50 mx-auto">Login</a>
                </div>
            </div>
        </div>

        <!-- New Student Card -->
        <div class="col-md-6 mb-4">
            <div class="card h-100 bg-primary text-white">
                <div class="card-body d-flex flex-column justify-content-between">
                    <h2 class="card-title text-center">New Student</h2>
                    <a href="RegistrationForm.jsp" class="btn btn-outline-light w-50 mx-auto">Register</a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
