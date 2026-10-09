package com.vishal.company.model;

import java.sql.Timestamp;

public class Department {

    private int departmentId;
    private String departmentName;
    private String description;
    private Timestamp createdAt;

    public Department() {
    }

    public Department(int departmentId, String departmentName, String description,
                      Timestamp createdAt) {
        this.departmentId = departmentId;
        this.departmentName = departmentName;
        this.description = description;
        this.createdAt = createdAt;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}