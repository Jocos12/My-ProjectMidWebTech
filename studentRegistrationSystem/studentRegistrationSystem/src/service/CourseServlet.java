package service;

import controller.Course;
import controller.Teacher;
import model.CourseDAO;
import model.TeacherDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

@WebServlet("/create-course")
public class CourseServlet extends HttpServlet {
    private CourseDAO courseDAO;
    private TeacherDAO teacherDAO;

    public void init() {
        courseDAO = new CourseDAO();
        teacherDAO = new TeacherDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the list of teachers from the DAO
        List<Teacher> teachers = teacherDAO.getAllTeachers();

        // Set the list of teachers in the request attribute
        request.setAttribute("teachers", teachers);

        // Forward to the course creation page (course.jsp)
        request.getRequestDispatcher("course.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get data from the form
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String teacher = request.getParameter("teacher");
        int credit = Integer.parseInt(request.getParameter("credit"));
        String description = request.getParameter("description");

        // Create a new course object
        Course course = new Course();
        course.setCode(code);
        course.setName(name);
        course.setTeacher(teacher);
        course.setCredit(credit);
        course.setDescription(description);

        // Save the course in the database
        courseDAO.saveCourse(course);

        // Set a success message attribute
        request.setAttribute("successMessage", "Course created successfully");

        // Forward to the course creation page with success message
        doGet(request, response);
    }
}
