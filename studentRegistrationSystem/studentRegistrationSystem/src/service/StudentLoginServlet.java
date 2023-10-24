package service;

import model.StudentDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;

@WebServlet("/student-login-process")
public class StudentLoginServlet extends HttpServlet {
    private StudentDAO studentDAO;

    public void init() {
        studentDAO = new StudentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String password = request.getParameter("password");

        if (studentDAO.validateStudent(studentId, password)) {
            response.sendRedirect("Auca.jsp"); // Redirect to the AUCA page on successful login
        } else {
            request.setAttribute("errorMessage", "Invalid student ID or password");
            request.getRequestDispatcher("invalidStudent_login.jsp").forward(request, response); // Show error message on failed login
        }
    }
}
