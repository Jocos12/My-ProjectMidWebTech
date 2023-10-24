package controller;

import javax.persistence.*;
@Entity
@Table(name = "teacher")
public class Teacher {
    @Id
    @Column(name = "code")
    private String code;

    @Column(name = "name")
    private String name;

    @Column(name = "password")
    private String password;

    @Column(name = "qualification")
    private String qualification;

    @Column(name = "role")
    private String role;

    public Teacher() {
        // Default constructor
    }

    public Teacher(String code, String name, String password, String qualification, String role) {
        this.code = code;
        this.name = name;
        this.password = password;
        this.qualification = qualification;
        this.role = role;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
