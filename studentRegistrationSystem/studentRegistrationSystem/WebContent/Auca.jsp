<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
    <title>Welcome to AUCA</title>
    <style>
        body {
            background-image: url('image/img6.jpg');
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            margin: 5px;
            padding: 10px;
        }

        .header {
            background-color: #3b3ae3;
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
            max-width: 100px;
            height: auto;
        }

        .title {
            font-size: 40px; /* Increase font size */
            font-weight: bold;
            text-align: center;
            margin: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Change font */
            animation: fadeIn 2s; /* Add fadeIn animation */
             margin: 180px ; /* Add margin to push down the text */
        }
        
           .title marquee {
            color: white; /* Change text color to white */
        }

        .links-container {
            text-align: center;
            margin-right: 20px;
        }

        .links-container a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #3b3ae3;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
            animation: slideIn 2s; /* Add slideIn animation */
        }

        .links-container a:hover {
            background-color: #555;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            from {
                transform: translateX(50px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        
        
        
     
        .buttons {
            text-align: center;
            margin-top: 20px; /* Reduced margin from 30px */
        }

        .buttons a {
            display: inline-block;
            margin: 10px;
            padding: 12px 24px; /* Increased padding for larger buttons */
            background-color: #3b3ae3;
            color: #fff;
            text-decoration: none;
            border-radius: 18px;
            font-size: 28px; /* Increased font size for buttons */
            font-family: 'Arial', sans-serif; /* Changed font for buttons */
            animation: slideIn 2s;
        }

        .buttons a:hover {
            background-color: #555;
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
            <img src="image/img7.png" alt="AUCA Logo">
            <p>Adventist University Of Central Africa</p>
        </div>
        <div class="links-container">
            <a href="registration.jsp">Registration</a>
            <a href="AllCou.jsp">Courses</a>
        </div>
    </div>

    <div class="title">
    <marquee behavior="alternate">
        Welcome To Adventist University 
        Of Central Africa
        </marquee>
    </div>
    
      <div class="buttons">
            <a href="registration.jsp">Register Now</a>
        </div>
        
      <div class="mtn">
        <a href="student-login.jsp" class="more-info-link"
            style="font-family: 'Gabriola', cursive; font-size: 24px; color: #ffffff;">Log Out</a>
    </div>
</body>

</html>