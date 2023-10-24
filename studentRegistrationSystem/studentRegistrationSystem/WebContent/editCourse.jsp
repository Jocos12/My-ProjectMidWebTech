<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ page import="controller.Teacher" %>
<%@ page import="model.TeacherDAO" %>

<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Edit Course</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #0056b3;
        }

        /* Add animation to the submit button */
        input[type="submit"] {
            transition: background-color 0.3s ease-in-out;
        }

        /* Add animation to form elements */
        input[type="text"],
        textarea {
            transition: border-color 0.3s ease-in-out;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #007BFF;
        }
    </style>
</head>
<body>
    <h1>Edit Course</h1>
    
    <form action="updateCourseServlet" method="post">
        <input type="hidden" name="courseId" value="<%= request.getParameter("courseId") %>">
        <label for="code">Code:</label>
        <input type="text" name="code" value="<%= request.getParameter("code") %>">
        <br>
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= request.getParameter("name") %>">
        <br>
        <label for="teacher">Teacher:</label>
        <input type="text" name="teacher" value="<%= request.getParameter("teacher") %>">
        <br>
        <label for="credit">Credit:</label>
        <input type="text" name="credit" value="<%= request.getParameter("credit") %>">
        <br>
        <label for="description">Description:</label>
        <textarea name="description"><%= request.getParameter("description") %></textarea>
        <br>
        <input type="submit" value="Save">
    </form>

    <script>
        function editCourse(courseId) {
            // Redirect the user to the edit course page
            window.location.href = '/editCourse.jsp?courseId=' + courseId;
        }
    </script>
</body>
</html>