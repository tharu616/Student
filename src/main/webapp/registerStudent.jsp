<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/6/2025
  Time: 12:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%-- registerStudent.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles1.css">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10 border p-4 rounded shadow">

            <div class="row">
                <!-- Left Column: Form -->
                <div class="col-md-6">
                    <h2 class="text-center mb-4">New Student Registration</h2>

                    <!-- Form starts here -->
                    <form action="registerStudent" method="post">

                        <!-- Full Name -->
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="name" required>
                        </div>

                        <!-- O/L Index Number -->
                        <div class="mb-3">
                            <label for="olIndex" class="form-label">O/L Index Number</label>
                            <input type="text" class="form-control" id="olIndex" name="id" required>
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
                            <input type="date" class="form-control" id="birthday" name="dob" required>
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

                        <!-- Terms and Conditions -->
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="terms" required>
                            <label class="form-check-label" for="terms">I confirm that the above information is correct.</label>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </form>
                    <!-- Form ends here -->

                </div>

                <!-- Right Column: Illustration -->
                <div class="col-md-6 d-flex align-items-center justify-content-center">
                    <img src="/images/istockphoto-1392001982-612x612.jpg" alt="Students Studying" class="img-fluid rounded">
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JS -->
<script src="js/registrationscript.js"></script>
</body>
</html>