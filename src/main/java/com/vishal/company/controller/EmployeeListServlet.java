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

@WebServlet("/employees")
public class EmployeeListServlet extends HttpServlet {

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

        List<Employee> employees =
                employeeDAO.getAllEmployees();

        request.setAttribute("employees", employees);

        request.getRequestDispatcher("/employees.jsp")
                .forward(request, response);
    }
}