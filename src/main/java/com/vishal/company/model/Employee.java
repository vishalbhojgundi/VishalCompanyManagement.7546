package com.vishal.company.model;

import java.sql.Date;

public class Employee {

    private int employeeId;
    private String employeeCode;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String gender;
    private Date dateOfBirth;
    private int departmentId;
    private String departmentName;
    private String designation;
    private Date joiningDate;
    private double salary;
    private String status;


    // ==============================
    // CONSTRUCTOR
    // ==============================

    public Employee() {
    }


    // ==============================
    // EMPLOYEE ID
    // ==============================

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }


    // ==============================
    // EMPLOYEE CODE
    // ==============================

    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }


    // ==============================
    // FIRST NAME
    // ==============================

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }


    // ==============================
    // LAST NAME
    // ==============================

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    // ==============================
    // EMAIL
    // ==============================

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    // ==============================
    // PHONE
    // ==============================

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    // ==============================
    // GENDER
    // ==============================

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


    // ==============================
    // DATE OF BIRTH
    // ==============================

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }


    // ==============================
    // DEPARTMENT ID
    // ==============================

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }


    // ==============================
    // DEPARTMENT NAME
    // ==============================

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }


    // ==============================
    // DESIGNATION
    // ==============================

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }


    // ==============================
    // JOINING DATE
    // ==============================

    public Date getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(Date joiningDate) {
        this.joiningDate = joiningDate;
    }


    // ==============================
    // SALARY
    // ==============================

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }


    // ==============================
    // STATUS
    // ==============================

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDepartmentNameById(int departmentId) {

        String sql = """
            SELECT department_name
            FROM departments
            WHERE department_id = ?
            """;

        try (java.sql.Connection connection =
                     com.vishal.company.util.DBConnection.getConnection();
             java.sql.PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, departmentId);

            try (java.sql.ResultSet resultSet =
                         statement.executeQuery()) {

                if (resultSet.next()) {
                    return resultSet.getString("department_name");
                }
            }

        } catch (java.sql.SQLException e) {
            throw new RuntimeException(
                    "Failed to retrieve department name", e);
        }

        return "Unknown Department";
    }

}