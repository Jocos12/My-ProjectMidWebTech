<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration List</title>
    <style>
    
    
    
        .header {
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 10px;
            display: flex;
            justify-content: space-between;
        }

        .logo {
            display: flex;
            align-items: center;
            margin-left: 20px;
            gap: 10px; /* Add some space between image and text */
        }

        .logo img {
           
            height: 100px;
        }
        /* Add your CSS styles here */
        body {
            background-color: #f0f0f0; /* Background color for the entire page */
               font-family: Arial, sans-serif;
            margin: 0px;
            padding: 0px;
        }
        h1 {
            background-color: #4285f4; /* Header background color */
            color: white; /* Header text color */
            padding: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add shadow to the table */
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e0e0e0; /* Hover effect for rows */
            transition: background-color 0.3s;
        }
        
        
        
        
        
        .links-container {
            text-align: center;
            margin-right: 20px;
        }

        .links-container a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #0000;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
            animation: slideIn 2s; /* Add slideIn animation */
        }

        .links-container a:hover {
            background-color:  #3b3ae3;
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

  <div class="header">
        <div class="logo">
            <img src="image/LogoT.png" alt="AUCA Logo">
            
        </div>
        <div class="links-container">
            <a href="registration.jsp"> Student Registration</a>
            <a href="course-list.jsp">Courses</a>
            <a href="academic-units.jsp">Add Acadedemic</a>
            <a href="course.jsp">Add Courses</a>
            <a href="registration.jsp">Registration</a>
            <a href="course-list.jsp">Courses</a>
        </div>
    </div>

    <h1>Student Registration List</h1>
    <table>
        <tr>
            <th>Student ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Semester</th>
            <th>Department</th>
            <th>Course</th>
            <th>Program</th>
            <th>Faculty</th>
            <th>Registration Date</th>
            <!-- Remove the <th>Action</th> here -->
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your database driver

                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registra", "root", ""); // Replace with your database URL, username, and password

                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM student_registration");

                while (rs.next()) {
                    int studentId = rs.getInt("student_id");
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String semester = rs.getString("semester");
                    String department = rs.getString("department");
                    String course = rs.getString("course");
                    String program = rs.getString("program");
                    String faculty = rs.getString("faculty");
                    String registrationDate = rs.getString("registration_date");
        %>
        <tr>
            <td><%= studentId %></td>
            <td><%= firstName %></td>
            <td><%= lastName %></td>
            <td><%= semester %></td>
            <td><%= department %></td>
            <td><%= course %></td>
            <td><%= program %></td>
            <td><%= faculty %></td>
            <td><%= registrationDate %></td>
            <!-- Remove the <td> tags for Action buttons here -->
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
      <div class="mtn">
        <a href="ListStudSem.jsp" class="more-info-link"
            style="font-family: 'Gabriola', cursive; font-size: 24px; color: #4285f4;">A. List of Students per Semester</a>
    </div>
</body>
</html>
