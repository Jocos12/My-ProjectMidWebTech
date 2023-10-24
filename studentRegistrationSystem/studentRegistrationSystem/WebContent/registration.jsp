<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="controller.Course" %>
<%@ page import="model.CourseDAO" %>
<%@ page import="java.util.List" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    
    
    
     <style>
        /* Updated CSS styles */
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        form {
            background-color: #fff;
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #0074d9;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        select,
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        button {
            background-color: #0074d9;
            color: #fff;
            border: none;
            border-radius: 3px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>

<body>

<h1>Student Registration</h1>
    <form action="registration" method="post">
        <label for="studentId">Student ID:</label>
        <input type="text" id="studentId" name="studentId" required>

        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required>

        <label for="semester">Semester:</label>
        <input type="text" id="semester" name="semester" required>

        <label for="department">Department:</label>
        <select id="department" name="department">
            <option value="Software Engineering">Software Engineering</option>
            <option value="Networking">Networking</option>
            <option value="Information Management System">Information Management System</option>
            <option value="Theologie">Theologie</option>
        </select>

        
        
       






           <label for="course">Course:</label>
           <select id="course" name="course">
    <option value="">Select Course</option>
    <% CourseDAO courseDAO = new CourseDAO();
       List<Course> courses = courseDAO.getAllCourses();
       for (Course course : courses) {
    %>
    <option value="<%= course.getName() %>"><%= course.getName() %></option>
    <%
       }
    %>
</select>









        <label for="program">Program:</label>
        <select id="program" name="program">
            <option value="Day">Day</option>
            <option value="Evening">Evening</option>
        </select>

        <label for="faculty">Faculty:</label>
        <select id="faculty" name="faculty">
            <option value="Information Technology">Information Technology</option>
            <option value="Education">Education</option>
            <option value="Medicine">Medicine</option>
        </select>

     <label for="registrationDate">Registration Date:</label>
        <input type="date" id="registrationDate" name="registrationDate" required>


        <button type="submit">Register</button>
    </form>
</body>
</html>