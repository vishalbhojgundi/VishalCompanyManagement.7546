package com.vishal.company.controller;

import com.vishal.company.dao.EmployeeDAO;
import com.vishal.company.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/add-employee")
public class EmployeeAddServlet extends HttpServlet {

    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        Employee employee = new Employee();

        employee.setEmployeeCode(
                request.getParameter("employeeCode")
        );

        employee.setFirstName(
                request.getParameter("firstName")
        );

        employee.setLastName(
                request.getParameter("lastName")
        );

        employee.setEmail(
                request.getParameter("email")
        );

        employee.setPhone(
                request.getParameter("phone")
        );

        employee.setGender(
                request.getParameter("gender")
        );

        String dob = request.getParameter("dateOfBirth");

        if (dob != null && !dob.isBlank()) {
            employee.setDateOfBirth(
                    LocalDate.parse(dob)
            );
        }

        employee.setDepartmentId(
                Integer.parseInt(
                        request.getParameter("departmentId")
                )
        );

        employee.setDesignation(
                request.getParameter("designation")
        );

        employee.setJoiningDate(
                LocalDate.parse(
                        request.getParameter("joiningDate")
                )
        );

        employee.setSalary(
                Double.parseDouble(
                        request.getParameter("salary")
                )
        );

        employee.setStatus(
                request.getParameter("status")
        );

        boolean success =
                employeeDAO.addEmployee(employee);

        if (success) {
            response.sendRedirect(
                    request.getContextPath()
                            + "/employees"
            );
        } else {
            response.sendRedirect(
                    request.getContextPath()
                            + "/addEmployee.jsp?error=true"
            );
        }
    }
}