package service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/updateCourseServlet")
public class updateCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve data from the request parameters
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String teacher = request.getParameter("teacher");
        int credit = Integer.parseInt(request.getParameter("credit"));
        String description = request.getParameter("description");

        // Database connection parameters (update with your own values)
        String jdbcUrl = "jdbc:mysql://localhost:3306/registra";
        String dbUser = "root";
        String dbPassword = "";

        String successMessage = null;
        String errorMessage = null;

        try {
            // Load the database driver (ensure the JDBC driver is in your classpath)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // SQL update statement
            String updateSql = "UPDATE course SET code=?, name=?, teacher=?, credit=?, description=? WHERE course_id=?";

            // Create a prepared statement
            PreparedStatement preparedStatement = connection.prepareStatement(updateSql);
            preparedStatement.setString(1, code);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, teacher);
            preparedStatement.setInt(4, credit);
            preparedStatement.setString(5, description);
            preparedStatement.setInt(6, courseId);

            // Execute the update
            int rowsUpdated = preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
            connection.close();

            if (rowsUpdated > 0) {
                // Course updated successfully
                successMessage = "Course updated successfully.";
            } else {
                // Handle the case where no rows were updated (e.g., course not found)
                errorMessage = "Course not found or update failed.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions that occur during the update process
            errorMessage = "An error occurred during the update.";
        }

        // Set success and error messages as request attributes
        request.setAttribute("successMessage", successMessage);
        request.setAttribute("errorMessage", errorMessage);

        // Forward the request to course_list.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("course-list.jsp");
        dispatcher.forward(request, response);
    }
}