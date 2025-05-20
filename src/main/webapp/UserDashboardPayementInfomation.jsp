<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/19/2025
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Information</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/UserDashboardPayementInfomation.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-auto sidebar">
            <div class="app-logo text-center py-4">
                <div class="logo-container">
                    <i class="fas fa-graduation-cap"></i>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a href="UserDashboard.jsp" class="nav-link">
                            <i class="fas fa-th-large me-3"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a href="UserDashboardPayementInfomation.jsp" class="nav-link">
                            <i class="fas fa-credit-card me-3"></i>
                            <span>Payment Info</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="Courses" class="nav-link">
                            <i class="fas fa-book me-3"></i>
                            <span>Courses</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="Notice" class="nav-link">
                            <i class="fas fa-bell me-3"></i>
                            <span>Notice</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="mt-auto p-3">
                <a href="Logout" class="btn btn-outline-light w-100" id="logout-btn">
                    <i class="fas fa-sign-out-alt me-2"></i>
                    <span>Logout</span>
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col main-content">
            <div class="row py-3 align-items-center">
                <div class="col">
                    <div class="search-container">
                        <input type="text" class="form-control search-input" placeholder="Search...">
                        <i class="fas fa-search search-icon"></i>
                    </div>
                </div>
                <div class="col-auto">
                    <div class="profile-container">
                        <div class="profile-info">
                            <div class="profile-name">John Doe</div>
                            <div class="profile-year">JD</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-section">
                <h2 class="section-title">Payment Information</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="payment-card">
                            <div class="payment-icon">
                                <i class="fas fa-money-bill-wave"></i>
                            </div>
                            <div class="payment-details">
                                <div class="payment-amount">Rs ${totalPayable}</div>
                                <p class="payment-label">Total Payable</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="payment-card">
                            <div class="payment-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="payment-details">
                                <div class="payment-amount">RS ${totalPaid}</div>
                                <p class="payment-label">Total Paid</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="payment-card">
                            <div class="payment-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="payment-details">
                                <div class="payment-amount">RS ${remaining}</div>
                                <p class="payment-label">Others</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-section">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3 class="card-title">Payment History</h3>
                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                Spring 2023
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item" href="#">Spring 2023</a></li>
                                <li><a class="dropdown-item" href="#">Fall 2022</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Transaction ID</th>
                                    <th>Description</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${payments}" var="payment">
                                    <tr>
                                        <td><fmt:formatDate value="${payment.date}" pattern="MMM d, yyyy" /></td>
                                        <td>${payment.transactionId}</td>
                                        <td>${payment.description}</td>
                                        <td>Rs ${payment.amount}</td>
                                        <td><span class="badge bg-success">${payment.status}</span></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-section">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Upcoming Payments</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Due Date</th>
                                    <th>Description</th>
                                    <th>Amount</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${upcomingPayments}" var="payment">
                                    <tr>
                                        <td><fmt:formatDate value="${payment.date}" pattern="MMM d, yyyy" /></td>
                                        <td>${payment.description}</td>
                                        <td>$${payment.amount}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm">Pay Now</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/UserDashboardPayementInfomation.js"></script>
</body>
</html>

