<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Invalid Login</title>
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
        background-color: #ff5733; /* Reddish background color */
        color: #fff;
        padding: 10px;
    }

    .error-message {
        color: red;
        text-align: center;
    }

    .try-again {
        text-align: center;
        margin-top: 20px;
    }

    .try-again a {
        background-color: #333; /* Dark background color */
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        text-decoration: none;
        cursor: pointer;
    }

    .try-again a:hover {
        background-color: #555; /* Slightly darker color on hover */
    }
</style>
<body>
    <div class="container">
        <h1>Invalid Login</h1>
        <p class="error-message">
            <% if(request.getAttribute("errorMessage") != null) {
                out.println(request.getAttribute("errorMessage"));
            } %>
        </p>
        <div class="try-again">
            <a href="Teacherlogin.jsp">Try Login Again</a>
        </div>
    </div>
</body>
</html>