<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Student Signup</title>
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
        padding: 100px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        border-radius: 15px;
    }

    h1 {
        text-align: center;
        background-color: #333;
        color: #fff;
        padding: 10px;
    }

    form {
        width: 100%;
        padding: 20px;
    }

    label, input {
        display: block;
        margin-bottom: 10px;
    }

    input[type="text"], input[type="password"], input[type="date"] {
        width: 80%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    button {
        background-color: #333;
        color: #fff;
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
    }
    
    
    /* Add this CSS code to your <style> block */
.teacher-link {
    float: right;
    margin-right: 10px;
    color: blue; /* Change link color to blue */
    text-decoration: none;
}

.student-link {
    float: left;
    margin-left: 10px;
    color: red; /* Change link color to red */
    text-decoration: none;
}

.teacher-link:hover {
    text-decoration: underline; /* Underline link on hover */
}

.student-link:hover {
    text-decoration: underline; /* Underline link on hover */
}
    
</style>
<body>
    <div class="container">
        <h1>Student Signup</h1>
        <form action="register-student" method="post">
            <label for="studentId">Student ID:</label>
            <input type="text" name="studentId" required maxlength="10">
            
            <label for="fName">First Name:</label>
            <input type="text" name="fName" required maxlength="50">
            
            <label for="lName">Last Name:</label>
            <input type="text" name="lName" required maxlength="50">
            
            <label for="password">Password:</label>
            <input type="password" name="password" required maxlength="20">
            
            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" name="dateOfBirth" required>
            
            <button type="submit">Sign Up</button>
        </form>
        
        <p class="success-message">
            <% if(request.getAttribute("successMessage") != null) {
                out.println(request.getAttribute("successMessage"));
            } %>
        </p>
        
       <p class="back-to-login">
    <a href="teachers.jsp" class="teacher-link">Sign Up as a Teacher</a> 
    <a href="student-login.jsp" class="student-link">Back to Student Login</a>
</p>
    </div>
</body>
</html>