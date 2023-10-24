package controller;

import javax.persistence.*;

@Entity
@Table(name = "academicUn")
public class DefCourse {
    @Id
    @Column(name = "code")
    private String code;

    @Column(name = "academicName")
    private String academicName;

    @Column(name = "academicType")
    private String academicType;

    @Column(name = "unit")
    private String unit;

    @Column(name = "program")
    private String program;

    public DefCourse() {
        // Default constructor
    }

    public DefCourse(String code, String academicName, String academicType, String unit, String program) {
        this.code = code;
        this.academicName = academicName;
        this.academicType = academicType;
        this.unit = unit;
        this.program = program;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getAcademicName() {
        return academicName;
    }

    public void setAcademicName(String academicName) {
        this.academicName = academicName;
    }

    public String getAcademicType() {
        return academicType;
    }

    public void setAcademicType(String academicType) {
        this.academicType = academicType;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }
}
