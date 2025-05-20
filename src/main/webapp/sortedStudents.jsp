<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/17/2025
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Student.Registration.model.User" %>

<h2>Students Sorted by Registration Time</h2>
<table border="1">
    <tr><th>Email</th><th>Registered At</th></tr>
    <%
        List<User> users = (List<User>) request.getAttribute("users");
        if (users != null) {
            for (User u : users) {
    %>
    <tr>
        <td><%= u.getEmail() %></td>
        <td><%= new java.util.Date(u.getTimestamp()) %></td>
    </tr>
    <% }} %>
</table>