package com.vishal.company.controller;

import com.vishal.company.dao.EmployeeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delete-employee")
public class EmployeeDeleteServlet extends HttpServlet {

    private final EmployeeDAO employeeDAO = new EmployeeDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int employeeId = Integer.parseInt(
                    request.getParameter("id")
            );

            boolean deleted =
                    employeeDAO.deleteEmployee(employeeId);

            if (deleted) {
                response.sendRedirect(
                        request.getContextPath()
                                + "/employees?success=deleted"
                );
            } else {
                response.sendRedirect(
                        request.getContextPath()
                                + "/employees?error=delete"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                            + "/employees?error=delete"
            );
        }
    }
}