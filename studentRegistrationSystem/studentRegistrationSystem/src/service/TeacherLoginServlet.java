package service;

import model.TeacherDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;

@WebServlet("/teacher-login")
public class TeacherLoginServlet extends HttpServlet {
    private TeacherDAO teacherDAO;

    public void init() {
        teacherDAO = new TeacherDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        if (teacherDAO.validateTeacher(name, password)) {
            response.sendRedirect("index.jsp"); // Redirect to a secured teacher dashboard page on successful login
        } else {
            request.setAttribute("errorMessage", "Invalid name or password");
            request.getRequestDispatcher("invalidT_login.jsp").forward(request, response); // Show error message on failed login
        }
    }
}
