<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controller.StudentRegistration" %>
<%@ page import="model.RegistrationDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration Display</title>
    <style>
        /* CSS Styles */
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            color: #0074d9;
            animation: titleAnimation 2s ease-in-out infinite;
        }

        @keyframes titleAnimation {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
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
            transition: background-color 0.3s;
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
    <h1>List of Students per Department and Semester</h1>
    <%
        RegistrationDAO registrationDAO = new RegistrationDAO();
        List<StudentRegistration> registrations = registrationDAO.getAllRegistrations();

        // Create a map to store students for each unique combination of semester and department
        Map<String, List<StudentRegistration>> semesterDepartmentMap = new HashMap<>();

        // Organize students by semester and department
        for (StudentRegistration registration : registrations) {
            String semesterDepartmentKey = registration.getSemester() + "-" + registration.getDepartment();
            List<StudentRegistration> students = semesterDepartmentMap.get(semesterDepartmentKey);
            if (students == null) {
                students = new ArrayList<>();
                semesterDepartmentMap.put(semesterDepartmentKey, students);
            }
            students.add(registration);
        }
    %>
    
    <%
        // Display student information for each unique combination of semester and department
        for (String key : semesterDepartmentMap.keySet()) {
            String[] parts = key.split("-");
            String semester = parts[0];
            String department = parts[1];
            List<StudentRegistration> students = semesterDepartmentMap.get(key);
        %>
        <h2>Semester <%= semester %>, Department: <%= department %></h2>
        <table>
            <tr>
                <th>Student ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Semester</th>
                <th>Department</th>
            </tr>
            <%
                for (StudentRegistration student : students) {
            %>
            <tr>
                <td><%= student.getStudentId() %></td>
                <td><%= student.getFirstName() %></td>
                <td><%= student.getLastName() %></td>
                <td><%= student.getSemester() %></td>
                <td><%= student.getDepartment() %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
        }
    %>
    
    
    
      <div class="mtn">
        <a href="ListStudCourSem.jsp" class="more-info-link"
            style="font-family: 'Gabriola', cursive; font-size: 24px; color: #4285f4;">C. List of Students per course and Semester</a>
    </div>
    
</body>
</html>
