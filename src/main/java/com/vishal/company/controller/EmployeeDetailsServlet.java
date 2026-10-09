
package com.vishal.company.controller;

import com.vishal.company.dao.EmployeeDAO;
import com.vishal.company.model.Employee;
import com.vishal.company.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/employee-details")
public class EmployeeDetailsServlet extends HttpServlet {

    private final EmployeeDAO employeeDAO = new EmployeeDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String idParameter = request.getParameter("id");

        if (idParameter == null || idParameter.isBlank()) {
            response.sendRedirect(
                    request.getContextPath() + "/employees");
            return;
        }

        try {
            int employeeId = Integer.parseInt(idParameter);

            // Get employee information
            Employee employee =
                    employeeDAO.getEmployeeById(employeeId);

            if (employee == null) {
                response.sendRedirect(
                        request.getContextPath() + "/employees");
                return;
            }

            // Get department name directly from MySQL
            String departmentName = "Unknown Department";

            String sql = """
                    SELECT department_name
                    FROM departments
                    WHERE department_id = ?
                    """;

            try (Connection connection =
                         DBConnection.getConnection();
                 PreparedStatement statement =
                         connection.prepareStatement(sql)) {

                statement.setInt(
                        1, employee.getDepartmentId());

                try (ResultSet resultSet =
                             statement.executeQuery()) {

                    if (resultSet.next()) {
                        departmentName =
                                resultSet.getString("department_name");
                    }
                }
            }

            // Send information to the JSP page
            request.setAttribute("employee", employee);
            request.setAttribute(
                    "departmentName", departmentName);

            // Open employee details page
            request.getRequestDispatcher(
                            "/employeeDetails.jsp")
                    .forward(request, response);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath() + "/employees");

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to display employee details", e);
        }
    }
}
