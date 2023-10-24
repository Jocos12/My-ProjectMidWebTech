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

@WebServlet("/UpdateAcademicServlet")
public class UpdateAcademicServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String codeToUpdate = request.getParameter("codeToUpdate");
            String academicName = request.getParameter("academicName");
            String academicType = request.getParameter("academicType");
            String unit = request.getParameter("unit");
            String program = request.getParameter("program");

            Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your database driver
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registra", "root", ""); // Replace with your database URL, username, and password

            // Construct an update SQL query using the codeToUpdate value
            String updateQuery = "UPDATE academicun SET academicName=?, academicType=?, unit=?, program=? WHERE code=?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, academicName);
            pstmt.setString(2, academicType);
            pstmt.setString(3, unit);
            pstmt.setString(4, program);
            pstmt.setString(5, codeToUpdate);

            int rowCount = pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            // Set a success message
            String successMessageUpdate = "Updated academic unit with code: " + codeToUpdate;
            request.setAttribute("successMessageUpdate", successMessageUpdate);
            // Redirect back to the original page
            response.sendRedirect("academic-units.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
