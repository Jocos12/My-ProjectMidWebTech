package service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/deleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the course ID from the request parameters
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        // Database connection parameters (update with your own values)
        String jdbcUrl = "jdbc:mysql://localhost:3306/registra";
        String dbUser = "root";
        String dbPassword = "";

        try {
            // Load the database driver (ensure the JDBC driver is in your classpath)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // SQL delete statement
            String deleteSql = "DELETE FROM course WHERE course_id = ?";

            // Create a prepared statement
            PreparedStatement preparedStatement = connection.prepareStatement(deleteSql);
            preparedStatement.setInt(1, courseId);

            // Execute the delete
            int rowsDeleted = preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
            connection.close();

            if (rowsDeleted > 0) {
                // Course deleted successfully
                String successMessage = "Course deleted successfully.";
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": true, \"message\": \"" + successMessage + "\"}");
            } else {
                // Handle the case where no rows were deleted (e.g., course not found)
                String errorMessage = "Course not found or unable to delete.";
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": false, \"message\": \"" + errorMessage + "\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions that occur during the delete process
            String errorMessage = "An error occurred while deleting the course.";
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": false, \"message\": \"" + errorMessage + "\"}");
        }
    }
}
