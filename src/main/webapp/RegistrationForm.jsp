<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/11/2025
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/RegistrationForm.css">
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
                            <a class="nav-link active" aria-current="page" href="RegistrationForm.jsp">Student Details</a>
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

<div class="container mt-5">
    <div class="row">
        <!-- Single Container with Border -->
        <div class="col-md-12 border p-4 rounded shadow">
            <div class="row">
                <!-- Left Column: Registration Form -->
                <div class="col-md-6">
                    <h2 class="text-center mb-4">New Student Registration</h2>
                    <form action="StudentRegistrationServlet" method="post">

                        <!-- Full Name -->
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" required>
                        </div>

                        <!-- NIC Number -->
                        <div class="mb-3">
                            <label for="nicNumber" class="form-label">NIC Number</label>
                            <input type="text" class="form-control" id="nicNumber" name="nic" required>
                        </div>

                        <!-- Email -->
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>

                        <!-- Password -->
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>

                        <!-- Date of Birth -->
                        <div class="mb-3">
                            <label for="birthday" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="birthday" name="dateOfBirth" required>
                        </div>

                        <!-- Gender -->
                        <div class="mb-3">
                            <label class="form-label">Gender</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="Male" required>
                                <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="Female" required>
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                        </div>

                        <!-- Mobile number -->
                        <div class="mb-3">
                            <label for="mobileNumber" class="form-label">Mobile Number</label>
                            <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" required>
                        </div>

                        <!-- WhatsApp Number -->
                        <div class="mb-3">
                            <label for="whatsAppNumber" class="form-label">WhatsApp Number</label>
                            <input type="tel" class="form-control" id="whatsAppNumber" name="whatsAppNumber" required>
                        </div>

                        <!-- Permanent Address -->
                        <div class="mb-3">
                            <label for="permanentAddress" class="form-label">Permanent Address</label>
                            <textarea id="permanentAddress" name="permanentAddress" rows="2" class="form-control" required></textarea>
                        </div>

                        <!-- District / Province -->
                        <div class="mb-3">
                            <label for="districtOrProvince" class="form-label">District / Province</label>
                            <input type="text" class="form-control" id="districtOrProvince" name="districtOrProvince" required>
                        </div>

                        <!-- Postal code -->
                        <div class="mb-3">
                            <label for="postalCode" class="form-label">Postal Code</label>
                            <input type="text" class="form-control" id="postalCode" name="postalCode" required>
                        </div>

                        <!-- index number-->
                        <div class="mb-3">
                            <label for="indexNumber" class="form-label">Index Number</label>
                            <input type="text" class="form-control" id="indexNumber" name="indexNumber" required>
                        </div>

                        <!-- Year of Completion -->
                        <div class="mb-3">
                            <label for="yearOfCompletion" class="form-label">Year of Completion</label>
                            <input type="text" class="form-control" id="yearOfCompletion" name="yearOfCompletion" required>
                        </div>

                        <!-- Parent Full Name -->
                        <div class="mb-3">
                            <label for="parentName" class="form-label">Parent Full Name</label>
                            <input type="text" class="form-control" id="parentName" name="parentFullName" required>
                        </div>

                        <!-- Parent Contact Number -->
                        <div class="mb-3">
                            <label for="parentContactNumber" class="form-label">Parent Contact Number</label>
                            <input type="text" class="form-control" id="parentContactNumber" name="parentContactNumber" required>
                        </div>

                        <!-- Parent Email -->
                        <div class="mb-3">
                            <label for="parentEmail" class="form-label">Parent Email</label>
                            <input type="email" class="form-control" id="parentEmail" name="parentEmail" required>
                        </div>

                        <!-- Upload Certificates -->
                        <div class="mb-3">
                            <label for="certificates" class="form-label">Upload Certificates</label>
                            <input type="file" class="form-control" id="certificates" name="certificates" multiple accept="image/*, .pdf" required>
                        </div>

                        <!-- Terms and Conditions -->
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="terms" required>
                            <label class="form-check-label" for="terms">I confirm that the above information is correct.</label>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary w-100">continue</button>
                    </form>
                </div>

                <!-- Right Column: Illustration -->
                <div class="col-md-6 d-flex align-items-center justify-content-center">
                    <img src="images/istockphoto-1392001982-612x612.jpg" alt="Students Studying" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="js/RegistrationForm.js"></script>
</body>
</html>
