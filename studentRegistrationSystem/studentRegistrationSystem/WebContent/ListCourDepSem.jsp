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
    <title>Course List by Department and Semester</title>
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
    <h1>List of Courses per Department and Semester</h1>
    <%
        RegistrationDAO registrationDAO = new RegistrationDAO();
        List<StudentRegistration> registrations = registrationDAO.getAllRegistrations();

        // Create a map to store courses by department and semester
        Map<String, Map<String, List<String>>> coursesByDepartmentAndSemester = new HashMap<>();

        // Organize courses by department and semester
        for (StudentRegistration registration : registrations) {
            String department = registration.getDepartment();
            String semester = registration.getSemester();
            
            if (!coursesByDepartmentAndSemester.containsKey(department)) {
                coursesByDepartmentAndSemester.put(department, new HashMap<>());
            }
            
            if (!coursesByDepartmentAndSemester.get(department).containsKey(semester)) {
                coursesByDepartmentAndSemester.get(department).put(semester, new ArrayList<>());
            }
            
            coursesByDepartmentAndSemester.get(department).get(semester).add(registration.getCourse());
        }
    %>
    
    <%
        // Display courses by department and semester
        for (String department : coursesByDepartmentAndSemester.keySet()) {
            Map<String, List<String>> coursesBySemester = coursesByDepartmentAndSemester.get(department);
            %>
            <h2><%= department %> Courses</h2>
            <%
            for (String semester : coursesBySemester.keySet()) {
                List<String> courses = coursesBySemester.get(semester);
                %>
                <h3>Semester <%= semester %> Courses</h3>
                <table>
                    <tr>
                        <th>Course</th>
                    </tr>
                    <%
                    for (String course : courses) {
                        %>
                        <tr>
                            <td><%= course %></td>
                        </tr>
                        <%
                    }
                    %>
                </table>
                <%
            }
            %>
            <%
        }
    %>
     <div class="mtn">
        <a href="ListCourStudent.jsp" class="more-info-link"
            style="font-family: 'Gabriola', cursive; font-size: 24px; color: #4285f4;">E. List of Courses per Student</a>
    </div>
</body>
</html>
