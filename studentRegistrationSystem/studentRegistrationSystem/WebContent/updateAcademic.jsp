<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Academic Unit</title>
    <style>
        /* Add your CSS styles here */
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        .form-group {
            margin: 10px 0;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .animation {
            animation: fadeIn 2s;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .success-message {
            color: green;
            font-weight: bold;
        }

        .error-message {
            color: red;
            font-weight: bold;
        }

        /* Add your custom styles here */
        .update-form {
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="container animation">
        <h1 style="color: #333; text-shadow: 2px 2px 4px #ddd;">Update Academic Unit</h1>

        <!-- Display error message if available -->
        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>

        <form class="update-form" action="UpdateAcademicServlet" method="post">
            <input type="hidden" name="codeToUpdate" value="${param.codeToUpdate}">
            <div class="form-group">
                <label for="academicName">Academic Name:</label>
                <input type="text" name="academicName" value="${param.academicName}" required>
            </div>
            <div class="form-group">
                <label for="academicType">Academic Type:</label>
                <select name="academicType">
                    <option value="Undergraduate" ${param.academicType == 'Undergraduate' ? 'selected' : ''}>Undergraduate</option>
                    <option value="Master" ${param.academicType == 'Master' ? 'selected' : ''}>Master</option>
                </select>
            </div>
            <div class="form-group">
                <label for="unit">Unit:</label>
                <select name="unit">
                    <option value="Parent Academic Code" ${param.unit == 'Parent Academic Code' ? 'selected' : ''}>Parent Academic Code</option>
                    <option value="Child Academic Code" ${param.unit == 'Child Academic Code' ? 'selected' : ''}>Child Academic Code</option>
                </select>
            </div>
            <div class="form-group">
                <label for="program">Program:</label>
                <select name="program">
                    <option value="Day" ${param.program == 'Day' ? 'selected' : ''}>Day</option>
                    <option value="Evening" ${param.program == 'Evening' ? 'selected' : ''}>Evening</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" value="Update Academic Unit">
            </div>
        </form>
    </div>
</body>
</html>
