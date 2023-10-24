<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Student Login</title>
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
        padding: 120px;
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

    .login-links {
        text-align: center;
    }

    .login-links a {
        color: #333;
        text-decoration: none;
        font-weight: bold;
        margin: 10px;
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
        <h1>Student Login</h1>
        <form action="student-login-process" method="post">
            <label for="studentId">Student ID:</label>
            <input type="text" name="studentId" required maxlength="8">
            
            <label for="password">Password:</label>
            <input type="password" name="password" required maxlength="16">
            
            <button type="submit">Login</button>
        </form>
        
        <p class="error-message">
            <c:if test="${not empty requestScope.errorMessage}">
                <c:out value="${requestScope.errorMessage}" />
            </c:if>
        </p>
        
        <p class="login-links">
          
            
            <a href="Teacherlogin.jsp" class="teacher-link">Login as a Teacher</a> 
    <a href="student.jsp" class="student-link">Sign Up </a>
        </p>
    </div>
</body>
</html>