package service;

import controller.Teacher;
import model.TeacherDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register-teacher")
public class TeacherServlet extends HttpServlet {
    private TeacherDAO teacherDAO;

    public void init() {
        teacherDAO = new TeacherDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String qualification = request.getParameter("qualification");
        String role = request.getParameter("role");

        Teacher teacher = new Teacher(code, name, password, qualification, role);

        teacherDAO.saveTeacher(teacher);

        response.sendRedirect("TeacherSuc.jsp");
    }
}
