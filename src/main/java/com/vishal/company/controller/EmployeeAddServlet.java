package com.vishal.company.controller;

import com.vishal.company.dao.EmployeeDAO;
import com.vishal.company.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/add-employee")
public class EmployeeAddServlet extends HttpServlet {

    private final EmployeeDAO employeeDAO = new EmployeeDAO();

    // =========================================================
    // SHOW ADD EMPLOYEE PAGE
    // =========================================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/addEmployee.jsp")
                .forward(request, response);
    }


    // =========================================================
    // ADD EMPLOYEE
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // ---------------------------------------------
            // READ FORM DATA
            // ---------------------------------------------

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

            String dateOfBirth =
                    request.getParameter("dateOfBirth");

            String departmentId =
                    request.getParameter("departmentId");

            String designation =
                    request.getParameter("designation");

            String joiningDate =
                    request.getParameter("joiningDate");

            String salary =
                    request.getParameter("salary");

            String status =
                    request.getParameter("status");


            // ---------------------------------------------
            // BASIC VALIDATION
            // ---------------------------------------------

            if (employeeCode == null || employeeCode.isBlank()
                    || firstName == null || firstName.isBlank()
                    || email == null || email.isBlank()
                    || departmentId == null || departmentId.isBlank()
                    || joiningDate == null || joiningDate.isBlank()) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/addEmployee.jsp?error=validation"
                );

                return;
            }


            // ---------------------------------------------
            // CREATE EMPLOYEE OBJECT
            // ---------------------------------------------

            Employee employee = new Employee();

            employee.setEmployeeCode(employeeCode);

            employee.setFirstName(firstName);

            employee.setLastName(lastName);

            employee.setEmail(email);

            employee.setPhone(phone);

            employee.setGender(gender);


            // ---------------------------------------------
            // DATE OF BIRTH
            // ---------------------------------------------

            if (dateOfBirth != null
                    && !dateOfBirth.isBlank()) {

                employee.setDateOfBirth(
                        Date.valueOf(dateOfBirth)
                );
            }


            // ---------------------------------------------
            // DEPARTMENT
            // ---------------------------------------------

            employee.setDepartmentId(
                    Integer.parseInt(departmentId)
            );


            // ---------------------------------------------
            // DESIGNATION
            // ---------------------------------------------

            employee.setDesignation(designation);


            // ---------------------------------------------
            // JOINING DATE
            // ---------------------------------------------

            employee.setJoiningDate(
                    Date.valueOf(joiningDate)
            );


            // ---------------------------------------------
            // SALARY
            // ---------------------------------------------

            if (salary != null && !salary.isBlank()) {

                employee.setSalary(
                        Double.parseDouble(salary)
                );

            } else {

                employee.setSalary(0);
            }


            // ---------------------------------------------
            // STATUS
            // ---------------------------------------------

            if (status == null || status.isBlank()) {

                employee.setStatus("ACTIVE");

            } else {

                employee.setStatus(status);
            }


            // ---------------------------------------------
            // SAVE EMPLOYEE
            // ---------------------------------------------

            boolean added =
                    employeeDAO.addEmployee(employee);


            if (added) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/employees?success=added"
                );

            } else {

                response.sendRedirect(
                        request.getContextPath()
                                + "/addEmployee.jsp?error=failed"
                );
            }

        } catch (NumberFormatException e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                            + "/addEmployee.jsp?error=invalid"
            );

        } catch (IllegalArgumentException e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                            + "/addEmployee.jsp?error=invalid"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                            + "/addEmployee.jsp?error=failed"
            );
        }
    }
}