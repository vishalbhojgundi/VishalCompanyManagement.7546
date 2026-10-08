package com.vishal.company.controller;

import com.vishal.company.dao.EmployeeDAO;
import com.vishal.company.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/edit-employee")
public class EmployeeEditServlet extends HttpServlet {

    private final EmployeeDAO employeeDAO = new EmployeeDAO();


    // ==========================================
    // OPEN EDIT EMPLOYEE PAGE
    // ==========================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.isBlank()) {
            response.sendRedirect(
                    request.getContextPath() + "/employees"
            );
            return;
        }

        try {

            int employeeId = Integer.parseInt(id);

            Employee employee =
                    employeeDAO.getEmployeeById(employeeId);

            if (employee == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/employees?error=notfound"
                );

                return;
            }

            request.setAttribute("employee", employee);

            request.getRequestDispatcher(
                    "/editEmployee.jsp"
            ).forward(request, response);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/employees?error=invalid"
            );
        }
    }


    // ==========================================
    // UPDATE EMPLOYEE
    // ==========================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int employeeId = Integer.parseInt(
                    request.getParameter("employeeId")
            );

            String employeeCode =
                    request.getParameter("employeeCode");

            String firstName =
                    request.getParameter("firstName");

            String lastName =
                    request.getParameter("lastName");

            String email =
                    request.getParameter("email");

            String phone =
                    request.getParameter("phone");

            String gender =
                    request.getParameter("gender");

            String departmentIdParameter =
                    request.getParameter("departmentId");

            String designation =
                    request.getParameter("designation");

            String salaryParameter =
                    request.getParameter("salary");

            String status =
                    request.getParameter("status");


            // ------------------------------------------
            // BASIC VALIDATION
            // ------------------------------------------

            if (employeeCode == null || employeeCode.isBlank()
                    || firstName == null || firstName.isBlank()
                    || email == null || email.isBlank()
                    || departmentIdParameter == null
                    || departmentIdParameter.isBlank()) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/employees?error=validation"
                );

                return;
            }


            int departmentId =
                    Integer.parseInt(departmentIdParameter);

            double salary = 0;

            if (salaryParameter != null
                    && !salaryParameter.isBlank()) {

                salary = Double.parseDouble(salaryParameter);
            }


            // ------------------------------------------
            // CREATE EMPLOYEE OBJECT
            // ------------------------------------------

            Employee employee = new Employee();

            employee.setEmployeeId(employeeId);

            employee.setEmployeeCode(employeeCode);

            employee.setFirstName(firstName);

            employee.setLastName(lastName);

            employee.setEmail(email);

            employee.setPhone(phone);

            employee.setGender(gender);

            employee.setDepartmentId(departmentId);

            employee.setDesignation(designation);

            employee.setSalary(salary);

            employee.setStatus(status);


            // ------------------------------------------
            // UPDATE DATABASE
            // ------------------------------------------

            boolean updated =
                    employeeDAO.updateEmployee(employee);


            if (updated) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/employees?success=updated"
                );

            } else {

                response.sendRedirect(
                        request.getContextPath()
                                + "/employees?error=update"
                );
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/employees?error=invalid"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                            + "/employees?error=update"
            );
        }
    }
}