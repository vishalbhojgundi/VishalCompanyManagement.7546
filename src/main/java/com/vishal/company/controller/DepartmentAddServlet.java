package com.vishal.company.controller;

import com.vishal.company.dao.DepartmentDAO;
import com.vishal.company.model.Department;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/add-department")
public class DepartmentAddServlet extends HttpServlet {

    private final DepartmentDAO departmentDAO = new DepartmentDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/addDepartment.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("departmentName");
        String description = request.getParameter("description");

        if (name == null || name.trim().isEmpty()) {
            response.sendRedirect(
                    request.getContextPath()
                            + "/add-department?error=required");
            return;
        }

        Department department = new Department();
        department.setDepartmentName(name.trim());
        department.setDescription(
                description == null || description.isBlank()
                        ? null : description.trim());

        try {
            boolean added = departmentDAO.addDepartment(department);

            if (added) {
                response.sendRedirect(
                        request.getContextPath()
                                + "/departments?success=added");
            } else {
                response.sendRedirect(
                        request.getContextPath()
                                + "/add-department?error=failed");
            }

        } catch (SQLException e) {
            if ("23000".equals(e.getSQLState())) {
                response.sendRedirect(
                        request.getContextPath()
                                + "/add-department?error=duplicate");
            } else {
                throw new ServletException(
                        "Unable to add department", e);
            }
        }
    }
}