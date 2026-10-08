package com.vishal.company.controller;

import com.vishal.company.dao.EmployeeDAO;
import com.vishal.company.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/search-employee")
public class EmployeeSearchServlet extends HttpServlet {

    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String keyword =
                request.getParameter("keyword");

        List<Employee> employees;

        if (keyword == null || keyword.isBlank()) {
            employees = employeeDAO.getAllEmployees();
        } else {
            employees =
                    employeeDAO.searchEmployees(keyword);
        }

        request.setAttribute("employees", employees);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher(
                "/searchEmployee.jsp"
        ).forward(request, response);
    }
}