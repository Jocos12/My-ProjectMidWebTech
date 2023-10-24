<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="controller.StudentRegistration" %>
<%@ page import="model.RegistrationDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List by Course</title>
    <style>
        /* CSS Styles */
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #0074d9;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
        
        
                       .mtn {
    width: 85%;
    font-size: 23px;
    font-family: 'Times New Roman', Times, serif;
    background-color: none;
    margin: 0 auto;
    /* Center the container */
    text-align: left;
    /* Align text to the left */
    padding: 20px;
    /* Add some padding for spacing */
}

.mtn p {
    margin-left: 3.5%;
}
    </style>
</head>
<body>
    <h1>List of Courses per Student</h1>
    <%
        RegistrationDAO registrationDAO = new RegistrationDAO();
        List<StudentRegistration> registrations = registrationDAO.getAllRegistrations();

        // Create a map to group students by course
        Map<String, List<StudentRegistration>> studentsByCourse = new HashMap<>();

        // Organize students by course
        for (StudentRegistration registration : registrations) {
            String course = registration.getCourse();
            if (!studentsByCourse.containsKey(course)) {
                studentsByCourse.put(course, new ArrayList<>());
            }
            studentsByCourse.get(course).add(registration);
        }
    %>

    <%
        for (String course : studentsByCourse.keySet()) {
            List<StudentRegistration> students = studentsByCourse.get(course);
    %>
    <h2>Course: <%= course %></h2>
    <table>
        <tr>
            <th>Student ID</th>
            <th>First Name</th>
            <th>Last Name</th>
        </tr>
        <%
            for (StudentRegistration student : students) {
        %>
        <tr>
            <td><%= student.getStudentId() %></td>
            <td><%= student.getFirstName() %></td>
            <td><%= student.getLastName() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        }
    %>
    
     <div class="mtn">
        <a href="index.jsp" class="more-info-link"
            style="font-family: 'Gabriola', cursive; font-size: 24px; color: #4285f4;">Back to Home Page</a>
    </div>
</body>
</html>
