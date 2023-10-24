<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Academic Units</title>
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

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .table th {
            background-color: #f2f2f2;
        }

        .delete-button {
            background-color: red;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }

        .update-button {
            background-color: blue;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container animation">
        <h1 style="color: #333; text-shadow: 2px 2px 4px #ddd;">Academic Units</h1>

        <!-- Display success messages if available -->
        <c:if test="${not empty successMessageSave}">
            <p class="success-message">${successMessageSave}</p>
        </c:if>
        <c:if test="${not empty successMessageDelete}">
            <p class="success-message">${successMessageDelete}</p>
        </c:if>
        <c:if test="${not empty successMessageUpdate}">
            <p class="success-message">${successMessageUpdate}</p>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>

        <form action="save-academic-unit" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="code">Code:</label>
                <input type="text" name="code" id="code">
            </div>
            <div class="form-group">
                <label for="academicName">Academic Name:</label>
                <input type="text" name="academicName" id="academicName">
            </div>
            <div class="form-group">
                <label for="academicType">Academic Type:</label>
                <select name="academicType" id="academicType">
                    <option value="Undergraduate">Undergraduate</option>
                    <option value="Master">Master</option>
                </select>
            </div>
            <div class="form-group">
                <label for="unit">Unit:</label>
                <select name="unit" id="unit">
                    <option value="Parent Academic Code">Parent Academic Code</option>
                    <option value="Child Academic Code">Child Academic Code</option>
                </select>
            </div>
            <div class="form-group">
                <label for="program">Program:</label>
                <select name="program" id="program">
                    <option value="Day">Day</option>
                    <option value="Evening">Evening</option>
                </select>
            </div>
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Save Academic Unit">
        </form>

        <!-- Table displaying academic units with a separate Action column -->
        <table class="table">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Academic Name</th>
                    <th>Academic Type</th>
                    <th>Unit</th>
                    <th>Program</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your database driver
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registra", "root", ""); // Replace with your database URL, username, and password

                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM academicun");

                        while (rs.next()) {
                            String code = rs.getString("code");
                            String academicName = rs.getString("academicName");
                            String academicType = rs.getString("academicType");
                            String unit = rs.getString("unit");
                            String program = rs.getString("program");
                %>
                <tr>
                    <td><%= code %></td>
                    <td><%= academicName %></td>
                    <td><%= academicType %></td>
                    <td><%= unit %></td>
                    <td><%= program %></td>
                    <td>
                        <form action="deleteAcademic.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete this academic unit?')">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="codeToDelete" value="<%= code %>">
                            <button class="delete-button">Delete</button>
                        </form>
                        <form action="updateAcademic.jsp" method="get">
                            <input type="hidden" name="codeToUpdate" value="<%= code %>">
                            <button class="update-button">Update</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
