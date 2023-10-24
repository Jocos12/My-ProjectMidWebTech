<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Invalid Login</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
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
            background-color: #ff3333; /* Red background color */
            color: #fff;
            padding: 10px;
        }

        .error-message {
            color: #ff3333;
            text-align: center;
            font-weight: bold;
            font-size: 18px;
            margin: 20px;
        }

        .back-to-login {
            text-align: center;
            margin-top: 20px;
        }

        .back-to-login a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #333; /* Dark background color */
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
            font-size: 16px;
            animation: slideIn 2s;
        }

        .back-to-login a:hover {
            background-color: #555; /* Darker background color on hover */
        }

        @keyframes slideIn {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Invalid Student Login</h1>
        <p class="error-message">${errorMessage}</p>
        <div class="back-to-login">
            <a href="student-login.jsp">Back to Login</a>
        </div>
    </div>
</body>
</html>