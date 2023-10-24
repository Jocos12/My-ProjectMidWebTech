<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controller.StudentRegistration" %>
<%@ page import="model.RegistrationDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
    <h1>List of Students per course and Semester</h1>
    <%
        RegistrationDAO registrationDAO = new RegistrationDAO();
        List<StudentRegistration> registrations = registrationDAO.getAllRegistrations();

        // Create an array to store students for each semester
        List<StudentRegistration>[] semesterStudents = new ArrayList[9];

        // Initialize the lists for each semester
        for (int i = 0; i < 9; i++) {
            semesterStudents[i] = new ArrayList<>();
        }

        // Organize students by semester
        for (StudentRegistration registration : registrations) {
            String semesterStr = registration.getSemester();
            try {
                int semester = Integer.parseInt(semesterStr);
                if (semester >= 1 && semester <= 9) {
                    semesterStudents[semester - 1].add(registration);
                }
            } catch (NumberFormatException e) {
                // Handle the case where the semester is not a valid integer.
            }
        }
    %>
    
    <%
        // Display student information for each semester
        for (int i = 0; i < 9; i++) {
            %>
            <h2>Semester <%= i + 1 %> Courses</h2>
            <table>
                <tr>
                    <th>Student ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Cours</th>
                    <th>Semestre</th>
                </tr>
                <%
                    List<StudentRegistration> students = semesterStudents[i];
                    for (StudentRegistration student : students) {
                %>
                <tr>
                    <td><%= student.getStudentId() %></td>
                    <td><%= student.getFirstName() %></td>
                    <td><%= student.getLastName() %></td>
                    <td><%= student.getCourse() %></td>
                    <td><%= student.getSemester() %></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
        }
    %>
    
    
      <div class="mtn">
        <a href="ListCourDepSem.jsp" class="more-info-link"
            style="font-family: 'Gabriola', cursive; font-size: 24px; color: #4285f4;">D. List of Courses per Department and Semester</a>
    </div>
</body>
</html>
