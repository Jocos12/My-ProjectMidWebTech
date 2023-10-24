package service;

import controller.Student;
import model.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register-student")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO;

    public void init() {
        studentDAO = new StudentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Retrieve student information from the registration form
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String password = request.getParameter("password");
        String dateOfBirth = request.getParameter("dateOfBirth");

        Student student = new Student(studentId, fName, lName, password, dateOfBirth);

        // Save the student information
        studentDAO.saveStudent(student);

        response.sendRedirect("StudentSuc.jsp");
    }
}
