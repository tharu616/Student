<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/17/2025
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Student.Registration.model.AllCourses"%>
<%@ page import="com.Student.Registration.model.School"%>
<%@ page import="com.Student.Registration.model.Course"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Course Selection</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/CoursesList.css">
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <!-- Sidebar for school selection -->
    <div class="col-md-3 col-lg-2 sidebar">
      <div class="school-selector">
        <h4 class="sidebar-heading">Schools</h4>
        <ul class="nav flex-column school-list" id="schoolTabs" role="tablist">
          <%
            AllCourses allCourses = (AllCourses) request.getAttribute("allCourses");
            if (allCourses != null && allCourses.getSchools() != null) {
              int idx = 0;
              for (Map.Entry<String, School> schoolEntry : allCourses.getSchools().entrySet()) {
                String schoolName = schoolEntry.getKey();
                String activeClass = (idx == 0) ? "active" : "";
                String schoolId = schoolName.replaceAll("\\s+", "");
          %>
          <li class="nav-item">
            <a class="nav-link <%= activeClass %>"
               id="<%= schoolId %>-tab"
               data-bs-toggle="tab"
               href="#<%= schoolId %>"
               role="tab"
               aria-controls="<%= schoolId %>"
               aria-selected="<%= idx == 0 ? "true" : "false" %>">
              <%= schoolName %>
            </a>
          </li>
          <%
                idx++;
              }
            }
          %>
        </ul>
      </div>
    </div>
    <!-- Main content area for courses -->
    <div class="col-md-9 col-lg-10 ms-sm-auto px-md-4 main-content">
      <div class="tab-content" id="schoolTabContent">
        <%
          if (allCourses != null && allCourses.getSchools() != null) {
            int idx = 0;
            for (Map.Entry<String, School> schoolEntry : allCourses.getSchools().entrySet()) {
              String schoolName = schoolEntry.getKey();
              School school = schoolEntry.getValue();
              String activeClass = (idx == 0) ? "show active" : "";
              String schoolId = schoolName.replaceAll("\\s+", "");
        %>
        <div class="tab-pane fade <%= activeClass %>"
             id="<%= schoolId %>"
             role="tabpanel"
             aria-labelledby="<%= schoolId %>-tab">

          <div class="school-header">
            <div class="school-banner" style="border-color: var(--<%= schoolId %>-color);">
              <h2><%= schoolName %></h2>
              <p>Explore our comprehensive range of <%= schoolName.toLowerCase().replace("school of ", "") %> courses designed to equip you with practical skills and knowledge for today's dynamic environment. Choose your path to success.</p>
            </div>
          </div>

          <div class="courses-container">
            <%
              if (school != null && school.getCourses() != null) {
                for (Map.Entry<String, Course> courseEntry : school.getCourses().entrySet()) {
                  String courseName = courseEntry.getKey();
                  Course course = courseEntry.getValue();
                  String iconClass = getIconForCourse(courseName, schoolName);
            %>
            <div class="course-card">
              <div class="course-icon">
                <i class="<%= iconClass %>"></i>
              </div>
              <div class="course-info">
                <h5><%= courseName %></h5>
                <div class="course-details">
                  <span><i class="far fa-clock"></i> <%= course.getDuration() %></span>
                  <span><i class="fas fa-tag"></i> <%= course.getFee() %></span>
                </div>
              </div>
              <div class="enroll-btn">
                <form action="EnrollNowServlet" method="post">
                  <input type="hidden" name="courseCode" value="<%= course.getCourseCode() %>">
                  <input type="hidden" name="courseName" value="<%= courseName %>">
                  <input type="hidden" name="schoolName" value="<%= schoolName %>">
                  <button type="submit" class="btn btn-success">Enroll Now</button>
                </form>
              </div>
            </div>
            <%
                }
              }
            %>
          </div>
        </div>
        <%
              idx++;
            }
          }
        %>
      </div>
    </div>
  </div>
</div>
<!-- Bootstrap JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JavaScript -->
<script src="js/courseList.js"></script>
<%!
  private String getIconForCourse(String courseName, String schoolName) {
// Logic to determine appropriate icon based on course name and school
    if (courseName.contains("Marketing")) {
      return "fas fa-bullhorn";
    } else if (courseName.contains("Management")) {
      return "fas fa-briefcase";
    } else if (courseName.contains("Finance") || courseName.contains("Accounting") || courseName.contains("Banking")) {
      return "fas fa-calculator";
    } else if (courseName.contains("Analytics") || courseName.contains("Data")) {
      return "fas fa-chart-line";
    } else if (courseName.contains("Law")) {
      return "fas fa-balance-scale";
    } else if (courseName.contains("Programming") || courseName.contains("Computing") || courseName.contains("Web")) {
      return "fas fa-laptop-code";
    } else if (courseName.contains("Security") || courseName.contains("Network")) {
      return "fas fa-shield-alt";
    } else if (courseName.contains("Machine Learning") || courseName.contains("AI")) {
      return "fas fa-robot";
    } else if (courseName.contains("Cloud")) {
      return "fas fa-cloud";
    } else if (courseName.contains("IoT")) {
      return "fas fa-microchip";
    } else if (courseName.contains("English") || courseName.contains("Speaking") || courseName.contains("Literature")) {
      return "fas fa-book";
    } else if (courseName.contains("Biology") || courseName.contains("Science") || courseName.contains("Lab")) {
      return "fas fa-flask";
    } else if (courseName.contains("Health") || courseName.contains("Nutrition")) {
      return "fas fa-heartbeat";
    } else if (courseName.contains("Art") || courseName.contains("Drawing")) {
      return "fas fa-palette";
    } else if (courseName.contains("Film") || courseName.contains("Cinema")) {
      return "fas fa-film";
    } else if (courseName.contains("Acting") || courseName.contains("Theatre") || courseName.contains("Voice")) {
      return "fas fa-theater-masks";
    } else if (courseName.contains("Certificate")) {
      return "fas fa-certificate";
    } else {
// Default icons based on school
      if (schoolName.contains("Business")) {
        return "fas fa-briefcase";
      } else if (schoolName.contains("Computing")) {
        return "fas fa-laptop";
      } else if (schoolName.contains("English")) {
        return "fas fa-language";
      } else if (schoolName.contains("Life Science")) {
        return "fas fa-dna";
      } else if (schoolName.contains("Art")) {
        return "fas fa-paint-brush";
      } else {
        return "fas fa-graduation-cap"; // Default fallback
      }
    }
  }
%>
</body>
</html>