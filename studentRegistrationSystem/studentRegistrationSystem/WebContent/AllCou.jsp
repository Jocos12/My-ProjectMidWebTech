<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Table</title>
    <style>
        /* Updated CSS styles */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
    <script>
        function editCourse(courseId) {
            window.location.href = 'editCourse.jsp?courseId=' + courseId;
        }

        function displaySuccessMessage(message) {
            var successMessage = document.getElementById('successMessage');
            successMessage.textContent = message;
            successMessage.style.display = 'block';
            setTimeout(function () {
                successMessage.style.display = 'none';
            }, 3000);
        }
    </script>
</head>
<body>
    <h1>Course List</h1>
    <table>
        <tr>
            <th>Course ID</th>
            <th>Code</th>
            <th>Name</th>
            <th>Teacher</th>
            <th>Credit</th>
            <th>Description</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registra", "root", "");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM course");

                while (rs.next()) {
                    int courseId = rs.getInt("course_id");
                    String code = rs.getString("code");
                    String name = rs.getString("name");
                    String teacher = rs.getString("teacher");
                    int credit = rs.getInt("credit");
                    String description = rs.getString("description");
        %>
        <tr>
            <td><%= courseId %></td>
            <td><%= code %></td>
            <td><%= name %></td>
            <td><%= teacher %></td>
            <td><%= credit %></td>
            <td><%= description %></td>
        </tr>
        <%
            request.setAttribute("courseId_" + courseId, courseId);
            request.setAttribute("code_" + courseId, code);
            request.setAttribute("name_" + courseId, name);
            request.setAttribute("teacher_" + courseId, teacher);
            request.setAttribute("credit_" + courseId, credit);
            request.setAttribute("description_" + courseId, description);
        }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
        %>
    </table>
    <div id="successMessage" style="display: none;"></div>
</body>
</html>
