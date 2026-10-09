package com.vishal.company.controller;

import com.vishal.company.dao.DepartmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delete-department")
public class DepartmentDeleteServlet extends HttpServlet {

    private final DepartmentDAO departmentDAO = new DepartmentDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String idParameter = request.getParameter("id");
        String contextPath = request.getContextPath();

        try {
            int id = Integer.parseInt(idParameter);

            if (departmentDAO.hasEmployees(id)) {
                response.sendRedirect(
                        contextPath
                                + "/departments?error=hasEmployees");
                return;
            }

            boolean deleted = departmentDAO.deleteDepartment(id);

            response.sendRedirect(
                    contextPath + "/departments?success="
                            + (deleted ? "deleted" : "notfound"));

        } catch (NumberFormatException e) {
            response.sendRedirect(contextPath + "/departments");

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to delete department", e);
        }
    }
}