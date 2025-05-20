<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/20/2025
  Time: 12:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - Notices</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/userDashboardNotice.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 col-lg-2 p-0 sidebar">
            <div class="logo-container text-center py-4">
                <div class="logo">CC</div>
            </div>
            <div class="sidebar-menu">
                <a href="UserDashboardServlet" class="menu-item">
                    <i class="fas fa-th-large"></i> Dashboard
                </a>
                <a href="#" class="menu-item">
                    <i class="fas fa-credit-card"></i> Payment Info
                </a>
                <a href="#" class="menu-item">
                    <i class="fas fa-book"></i> Courses
                </a>
                <a href="NoticeServlet" class="menu-item active">
                    <i class="fas fa-bell"></i> Notice
                </a>
                <a href="LogoutServlet" class="menu-item logout">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 p-0 main-content">
            <!-- Top Navigation -->
            <div class="top-nav d-flex justify-content-between align-items-center px-4 py-3">
                <div class="search-container">
                    <input type="text" placeholder="Search" class="search-input">
                    <div class="current-date"><!-- JavaScript මගින් යාවත්කාලීන කෙරෙයි --></div>
                </div>
                <div class="user-profile d-flex align-items-center">
                    <div class="profile-img">${user.fullName.charAt(0)}</div>
                    <div class="profile-info">
                        <div class="profile-name">${user.fullName} <span class="notification-badge"></span></div>
                    </div>
                </div>
            </div>

            <!-- Welcome Banner -->
            <div class="welcome-banner p-4 d-flex justify-content-between align-items-center">
                <div>
                    <h1 class="welcome-heading">Welcome back, ${user.fullName.split(" ")[0]}!</h1>
                    <p class="welcome-text">Always stay updated in your student portal</p>
                </div>
                <div class="banner-image">
                    <img src="images/student-illustration.png" alt="Student reading" class="img-fluid">
                </div>
            </div>

            <!-- User Notice Section -->
            <div class="content-section px-4 py-3">
                <div class="section-header d-flex justify-content-between align-items-center mb-4">
                    <h2 class="section-title">Notices</h2>
                    <a href="#" class="see-all-link">See all</a>
                </div>

                <div class="notice-container">
                    <c:forEach items="${notices}" var="notice" varStatus="status">
                        <div class="notice-card mb-4 ${status.index % 2 == 0 ? 'notice-unread' : ''}">
                            <div class="notice-header">
                                <h3 class="notice-title">${notice.title}</h3>
                                <span class="notice-date">
                                        <fmt:formatDate value="${notice.timestamp}" pattern="MMM d, yyyy" />
                                    </span>
                            </div>
                            <div class="notice-body">
                                <p>${notice.content}</p>
                            </div>
                            <div class="notice-footer">
                                <a href="#" class="notice-link">Read more</a>
                                <button class="notice-mark-read" data-id="${status.index + 1}">
                                    <i class="far fa-check-circle"></i> Mark as read
                                </button>
                            </div>
                        </div>
                    </c:forEach>

                    <!-- No announcements -->
                    <c:if test="${empty notices}">
                        <div class="alert alert-info">
                            No notifications at this time.
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="js/userDashboardNotice.js"></script>
</body>
</html>
