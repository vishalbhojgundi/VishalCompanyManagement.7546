package com.vishal.company.controller;

import com.vishal.company.dao.DepartmentDAO;
import com.vishal.company.model.Department;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/departments")
public class DepartmentListServlet extends HttpServlet {

    private final DepartmentDAO departmentDAO = new DepartmentDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Department> departments =
                    departmentDAO.getAllDepartments();

            request.setAttribute("departments", departments);

            request.getRequestDispatcher("/departments.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to load departments", e);
        }
    }
}