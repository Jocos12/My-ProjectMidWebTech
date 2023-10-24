<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="controller.Teacher" %>
<%@ page import="model.TeacherDAO" %>

<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Create Course</title>
    <style>
        /* Add your CSS styles here */
        .form-container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f7f7f7;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input, select, textarea {
            width: 80%;
            padding: 10px;
            margin-top: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button[type="submit"] {
            background-color: #3b3ae3;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
             margin-top: 25px; /* Add margin to create space */
             margin-left: 10px;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #3030bf;
        }

        .success-message {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin-top: 10px;
            text-align: center;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Create a New Course</h1>
        <form action="create-course" method="post">
            <label for="code">Course Code:</label>
            <input type="text" id="code" name="code" required>

            <label for="name">Course Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="teacher">Teacher:</label>
           <select id="teacher" name="teacher">
    <option value="">Select Teacher</option>
    <% TeacherDAO teacherDAO = new TeacherDAO();
       List<Teacher> teachers = teacherDAO.getAllTeachers();
       for (Teacher teacher : teachers) {
    %>
    <option value="<%= teacher.getName() %>"><%= teacher.getName() %></option>
    <%
       }
    %>
</select>


            <label for="credit">Credit:</label>
            <input type="number" id="credit" name="credit" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>

            <button type="submit">Create Course</button>
        </form>

        <!-- Display success message if available -->
        <c:if test="${not empty successMessage}">
            <div class="success-message">
                ${successMessage}
            </div>
        </c:if>
    </div>
</body>
</html>
