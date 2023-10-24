package service;

import controller.DefCourse;
import model.AcademicUnitDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/save-academic-unit")
public class AcademicUnitServlet extends HttpServlet {
    private AcademicUnitDAO academicUnitDAO;

    public void init() {
        academicUnitDAO = new AcademicUnitDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String academicUnitCode = request.getParameter("code");
        String academicUnitName = request.getParameter("academicName");
        String academicUnitType = request.getParameter("academicType");
        String academicUnitUnit = request.getParameter("unit"); // Added to retrieve the "unit" parameter
        String academicUnitProgram = request.getParameter("program"); // Added to retrieve the "program" parameter

        DefCourse academicUnit = new DefCourse(academicUnitCode, academicUnitName, academicUnitType, academicUnitUnit, academicUnitProgram); // Use the updated constructor

        academicUnitDAO.saveAcademicUnit(academicUnit);

        response.sendRedirect("academic-units.jsp");
    }
}
