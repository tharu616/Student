<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/18/2025
  Time: 10:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Queue" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Queue Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .queue-container {
            max-width: 900px;
            margin: 30px auto;
        }
        .queue-header {
            margin-bottom: 30px;
            text-align: center;
        }
        .queue-actions {
            margin: 20px 0;
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .message-box {
            margin: 20px 0;
            padding: 10px;
        }
        .table-wrapper {
            max-height: 400px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
<div class="container queue-container">
    <div class="queue-header">
        <h2>Course Registration Queue Management</h2>
        <p class="lead">Currently <span class="badge bg-primary">${queueSize}</span> registrations pending in queue</p>
    </div>

    <c:if test="${not empty message}">
        <div class="alert alert-info message-box" role="alert">
                ${message}
        </div>
    </c:if>

    <div class="queue-actions">
        <form action="QueueManagementServlet" method="post">
            <input type="hidden" name="action" value="process">
            <button type="submit" class="btn btn-success">Process Next Registration</button>
        </form>

        <form action="QueueManagementServlet" method="post">
            <input type="hidden" name="action" value="clear">
            <button type="submit" class="btn btn-danger"
                    onclick="return confirm('Are you sure you want to clear all registrations?');">
                Clear All Registrations
            </button>
        </form>
    </div>

    <div class="card">
        <div class="card-header bg-dark text-white">
            Pending Registrations (Ordered by submission time)
        </div>
        <div class="card-body table-wrapper">
            <c:choose>
                <c:when test="${queueSize > 0}">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Student Email</th>
                            <th>Course Code</th>
                            <th>Registration Time</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${registrations}" var="reg" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${reg[0]}</td>
                                <td>${reg[1]}</td>
                                <td>${reg[2]}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-secondary">
                        No pending registrations in the queue.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="mt-4 text-center">
        <a href="admin.jsp" class="btn btn-secondary">Back to Admin Panel</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>