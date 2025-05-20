<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/17/2025
  Time: 12:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.Student.Registration.util.RegistrationQueueManager" %>
<%@ page import="com.Student.Registration.model.CourseRegistration" %>
<%@ page import="java.util.Queue" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pending Course Registrations</title>
</head>
<body>
<h2>Pending Course Registrations</h2>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>Email</th>
        <th>Course Code</th>
        <th>Timestamp</th>
    </tr>
    </thead>
    <tbody>
    <%
        Queue<CourseRegistration> registrations = RegistrationQueueManager.getAllRegistrations();
        if (!registrations.isEmpty()) {
            for (CourseRegistration reg : registrations) {
    %>
    <tr>
        <td><%= reg.getStudentEmail() %></td>
        <td><%= reg.getCourseCode() %></td>
        <td><%= new java.util.Date(reg.getTimestamp()) %></td>
    </tr>
    <% }} else { %>
    <tr><td colspan="3" class="text-center">No pending requests.</td></tr>
    <% } %>
    </tbody>
</table>
<form action="ProcessNextServlet" method="post">
    <button type="submit" class="btn btn-success">Process Next Request</button>
</form>
</body>
</html>