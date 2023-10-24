package service;

import controller.StudentRegistration;

import model.RegistrationDAO;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    private RegistrationDAO registrationDAO;

    public void init() {
        registrationDAO = new RegistrationDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Retrieve student registration information from the form
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String semester = request.getParameter("semester");
        String department = request.getParameter("department");
        String course = request.getParameter("course");
        String program = request.getParameter("program");
        String faculty = request.getParameter("faculty");
        String registrationDate = request.getParameter("registrationDate");

        StudentRegistration studentRegistration = new StudentRegistration(studentId, firstName, lastName, semester, department, course, program, faculty, registrationDate);

        // Save the student registration information
        registrationDAO.saveStudentRegistration(studentRegistration);

        response.sendRedirect("registration.jsp");
    }
}