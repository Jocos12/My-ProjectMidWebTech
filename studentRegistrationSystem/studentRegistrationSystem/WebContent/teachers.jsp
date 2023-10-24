<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Teacher Signup</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 500px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        border-radius: 5px;
    }

    h1 {
        text-align: center;
        background-color: #33ccff; /* Light blue background color */
        color: #fff;
        padding: 10px;
    }

    form {
        width: 100%;
        padding: 20px;
    }

    label, input, select {
        display: block;
        margin-bottom: 10px;
    }

    input[type="text"], input[type="password"], select {
        width: 70%;
        padding: 8px;
        border: 1px solid #33ccff;
        border-radius: 13px;
    }

    button {
        background-color: #333;
        color: #33ccff;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    button:hover {
        background-color: #555;
    }

    .success-message {
        color: green;
        text-align: center;
    }

    .back-to-login {
        text-align: center;
       color: red;
    }

    /* Add more CSS rules as needed for your desired styling */

    select {
        width: 70%;
        padding: 8px;
        border: 1px solid #33ccff;
        border-radius: 13px;
    }
</style>
<body>
    <div class="container">
        <h1>Teacher Signup</h1>
        <form action="register-teacher" method="post">
            <label for="code">Code:</label>
            <input type="text" name="code" required maxlength="10">
            
            <label for="name">Name:</label>
            <input type="text" name="name" required maxlength="50">
            
            <label for="password">Password:</label>
            <input type="password" name="password" required maxlength="20">
            
            <label for="qualification">Qualification:</label>
            <select name="qualification" required>
                <option value="Master">Master</option>
                <option value="PHD">PHD</option>
                <option value="Professor">Professor</option>
            </select>
            
            <label for="role">Role:</label>
            <select name="role" required>
                <option value="Tutor">Tutor</option>
                <option value="Assistant Tutor">Assistant Tutor</option>
            </select>
            
            <button type="submit">Sign Up</button>
        </form>
        
        <p class="success-message">
            <% if(request.getAttribute("successMessage") != null) {
                out.println(request.getAttribute("successMessage"));
            } %>
        </p>
        
        <p class="back-to-login">
            <a href="Teacherlogin.jsp">Back to Login</a>
        </p>
    </div>
</body>
</html>