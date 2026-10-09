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

@WebServlet("/edit-department")
public class DepartmentEditServlet extends HttpServlet {

    private final DepartmentDAO departmentDAO = new DepartmentDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Department department =
                    departmentDAO.getDepartmentById(id);

            if (department == null) {
                response.sendRedirect(
                        request.getContextPath() + "/departments");
                return;
            }

            request.setAttribute("department", department);

            request.getRequestDispatcher("/editDepartment.jsp")
                    .forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(
                    request.getContextPath() + "/departments");

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to load department", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("departmentId"));

            String name = request.getParameter("departmentName");
            String description = request.getParameter("description");

            if (name == null || name.trim().isEmpty()) {
                response.sendRedirect(
                        request.getContextPath()
                                + "/edit-department?id=" + id
                                + "&error=required");
                return;
            }

            Department department = new Department();
            department.setDepartmentId(id);
            department.setDepartmentName(name.trim());
            department.setDescription(
                    description == null || description.isBlank()
                            ? null : description.trim());

            boolean updated =
                    departmentDAO.updateDepartment(department);

            if (updated) {
                response.sendRedirect(
                        request.getContextPath()
                                + "/departments?success=updated");
            } else {
                response.sendRedirect(
                        request.getContextPath() + "/departments");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(
                    request.getContextPath() + "/departments");

        } catch (SQLException e) {
            if ("23000".equals(e.getSQLState())) {
                response.sendRedirect(
                        request.getContextPath()
                                + "/departments?error=duplicate");
            } else {
                throw new ServletException(
                        "Unable to update department", e);
            }
        }
    }
}