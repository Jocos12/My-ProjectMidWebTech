<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>

<%
try {
    String courseIdToDelete = request.getParameter("courseId");

    if (courseIdToDelete != null && !courseIdToDelete.isEmpty()) {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your database driver
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registra", "root", ""); // Replace with your database URL, username, and password

        // Construct a delete SQL query using the courseIdToDelete value
        String deleteQuery = "DELETE FROM course WHERE course_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
        pstmt.setInt(1, Integer.parseInt(courseIdToDelete));

        int rowCount = pstmt.executeUpdate();

        pstmt.close();
        conn.close();

        // Set a success message
        String successMessage = "Deleted course with ID: " + courseIdToDelete + " from the database.";
        request.setAttribute("successMessage", successMessage);

        // Redirect back to the original page (change this URL as needed)
        response.sendRedirect("course-list.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
