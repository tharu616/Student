<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/6/2025
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset=  "UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Student Login</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/Login.css">
</head>
<body>

<!-- Background -->
<div class="background"></div>

<!-- Login Card -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12 border p-4 rounded shadow">
            <div class="row">
                <!-- Place this above the form -->
                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger">Invalid email or password.</div>
                <% } %>

                <!-- Left Column: Login Form -->
                <div class="col-md-6 d-flex flex-column justify-content-center">
                    <h2 class="text-center mb-4">Login</h2>
                    <form action="LoginServlet" method="POST">

                        <!-- email Field -->
                        <!-- Email Field -->
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                <input type="email" id="email" name="email" class="form-control" placeholder="Enter Your Email*" required>
                            </div>
                        </div>

                        <!-- Password Field -->
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Enter Your Password*" required>
                            </div>
                        </div>

                        <!-- Remember Me & Forgot Password -->
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="rememberMe">
                                <label class="form-check-label" for="rememberMe">Remember Me</label>
                            </div>
                            <a href="#" class="text-primary text-decoration-none">Forgot Password?</a>
                        </div>

                        <!-- Login Button -->
                        <button type="submit" class="btn btn-primary w-100 mb-3">Login</button>


                    </form>
                </div>

                <!-- Right Column: Illustration -->
                <div class="col-md-6 d-flex align-items-center justify-content-center">
                    <img src="images/istockphoto-1392001982-612x612.jpg" alt="Students Studying" class="img-fluid rounded">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Validation Script -->
<script src="js/Login.js"></script>

</body>
</html>