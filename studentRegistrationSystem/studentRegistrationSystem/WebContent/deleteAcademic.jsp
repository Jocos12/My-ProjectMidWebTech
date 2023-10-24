<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
try {
    String codeToDelete = request.getParameter("codeToDelete");

    if (codeToDelete != null && !codeToDelete.isEmpty()) {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your database driver
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registra", "root", ""); // Replace with your database URL, username, and password

        // Construct a delete SQL query using the codeToDelete value
        String deleteQuery = "DELETE FROM academicun WHERE code = ?";
        PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
        pstmt.setString(1, codeToDelete);

        int rowCount = pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();

        // Set a success message
        String successMessage = "Deleted academic unit with code: " + codeToDelete + " from the database.";
        request.setAttribute("successMessage", successMessage);
        
        // Redirect back to the original page
        response.sendRedirect("academic-units.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
