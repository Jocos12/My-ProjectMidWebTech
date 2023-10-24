package controller;

import javax.persistence.*;

@Entity
@Table(name = "student_registration")
public class StudentRegistration {
    @Id
    @Column(name = "student_id")
    private int studentId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "semester")
    private String semester;

    @Column(name = "department")
    private String department;

    @Column(name = "course")
    private String course;

    @Column(name = "program")
    private String program;

    @Column(name = "faculty")
    private String faculty;

    @Column(name = "registration_date")
    private String registrationDate;

    public StudentRegistration() {
        // Default constructor
    }

    public StudentRegistration(int studentId, String firstName, String lastName, String semester, String department, String course, String program, String faculty, String registrationDate) {
        this.studentId = studentId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.semester = semester;
        this.department = department;
        this.course = course;
        this.program = program;
        this.faculty = faculty;
        this.registrationDate = registrationDate;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public String getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(String registrationDate) {
        this.registrationDate = registrationDate;
    }
}
