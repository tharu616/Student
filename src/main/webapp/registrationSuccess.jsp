<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/6/2025
  Time: 1:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header bg-success text-white">
            <h2 class="text-center">Registration Successful!</h2>
        </div>
        <div class="card-body text-center">
            <div class="alert alert-success" role="alert">
                <h4>Congratulations!</h4>
                <p>You have successfully enrolled in the following course:</p>

                <div class="mt-4">
                    <h5>Course Details:</h5>
                    <p><strong>Course Code:</strong> ${sessionScope.enrolledCourseCode}</p>
                    <p><strong>Course Name:</strong> ${sessionScope.enrolledCourseName}</p>
                    <p><strong>School:</strong> ${sessionScope.enrolledSchool}</p>
                </div>
            </div>

            <div class="mt-4">
                <a href="Payment.jsp" class="btn btn-secondary">Continue</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
