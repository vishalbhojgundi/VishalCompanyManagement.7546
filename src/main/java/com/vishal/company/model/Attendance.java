
package com.vishal.company.model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Attendance {

    private int attendanceId;
    private int employeeId;
    private String employeeCode;
    private String employeeName;
    private Date attendanceDate;
    private String status;
    private Time checkIn;
    private Time checkOut;
    private String remarks;
    private Timestamp createdAt;

    // Default constructor
    public Attendance() {
    }

    // Getters and setters

    public int getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(int attendanceId) {
        this.attendanceId = attendanceId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public Date getAttendanceDate() {
        return attendanceDate;
    }

    public void setAttendanceDate(Date attendanceDate) {
        this.attendanceDate = attendanceDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Time getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Time checkIn) {
        this.checkIn = checkIn;
    }

    public Time getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Time checkOut) {
        this.checkOut = checkOut;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
