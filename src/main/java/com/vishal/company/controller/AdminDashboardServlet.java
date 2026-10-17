
package com.vishal.company.controller;

import com.vishal.company.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private final AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setAttribute("employeeCount",
                    adminDAO.countEmployees());

            request.setAttribute("departmentCount",
                    adminDAO.countDepartments());

            request.setAttribute("attendanceToday",
                    adminDAO.countAttendanceToday());

            request.getRequestDispatcher(
                            "/WEB-INF/views/admin/dashboard.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to load admin dashboard", e);
        }
    }
}
