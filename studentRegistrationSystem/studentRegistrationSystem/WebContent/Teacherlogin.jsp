<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Teacher Login</title>
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

    input[type="text"], input[type="password"] {
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

    .error-message {
        color: red;
        text-align: center;
    }

    .login-as-student {
        text-align: center;
    }

    .login-as-student a {
        color: #333;
        text-decoration: none;
        font-weight: bold;
    }

    .login-as-student a:hover {
        text-decoration: underline;
    }
</style>
<body>
    <div class="container">
        <h1>Teacher Login</h1>
        <form action="teacher-login" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" required maxlength="50">
            
            <label for="password">Password:</label>
            <input type="password" name="password" required maxlength="20">
            
            <button type="submit">Login</button>
        </form>
        
        <p class="error-message">
            <% if(request.getAttribute("errorMessage") != null) {
                out.println(request.getAttribute("errorMessage"));
            } %>
        </p>
        
        <p class="login-as-student">
            <a href="student-login.jsp">Login as a Student</a>
        </p>
    </div>
</body>
</html>