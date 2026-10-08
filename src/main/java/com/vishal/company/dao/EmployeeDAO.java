package com.vishal.company.dao;

import com.vishal.company.model.Employee;
import com.vishal.company.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    // ADD EMPLOYEE
    public boolean addEmployee(Employee employee) {

        String sql = """
                INSERT INTO employees
                (
                    employee_code,
                    first_name,
                    last_name,
                    email,
                    phone,
                    gender,
                    date_of_birth,
                    department_id,
                    designation,
                    joining_date,
                    salary,
                    status
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(1, employee.getEmployeeCode());
            statement.setString(2, employee.getFirstName());
            statement.setString(3, employee.getLastName());
            statement.setString(4, employee.getEmail());
            statement.setString(5, employee.getPhone());
            statement.setString(6, employee.getGender());

            if (employee.getDateOfBirth() != null) {
                statement.setDate(
                        7,
                        Date.valueOf(employee.getDateOfBirth())
                );
            } else {
                statement.setDate(7, null);
            }

            statement.setInt(8, employee.getDepartmentId());
            statement.setString(9, employee.getDesignation());

            statement.setDate(
                    10,
                    Date.valueOf(employee.getJoiningDate())
            );

            statement.setDouble(11, employee.getSalary());
            statement.setString(12, employee.getStatus());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // GET ALL EMPLOYEES
    public List<Employee> getAllEmployees() {

        List<Employee> employees = new ArrayList<>();

        String sql = """
                SELECT
                    e.employee_id,
                    e.employee_code,
                    e.first_name,
                    e.last_name,
                    e.email,
                    e.phone,
                    e.gender,
                    e.date_of_birth,
                    e.department_id,
                    d.department_name,
                    e.designation,
                    e.joining_date,
                    e.salary,
                    e.status
                FROM employees e
                INNER JOIN departments d
                    ON e.department_id = d.department_id
                ORDER BY e.employee_id ASC
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql);
                ResultSet resultSet =
                        statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Employee employee = new Employee();

                employee.setEmployeeId(
                        resultSet.getInt("employee_id")
                );

                employee.setEmployeeCode(
                        resultSet.getString("employee_code")
                );

                employee.setFirstName(
                        resultSet.getString("first_name")
                );

                employee.setLastName(
                        resultSet.getString("last_name")
                );

                employee.setEmail(
                        resultSet.getString("email")
                );

                employee.setPhone(
                        resultSet.getString("phone")
                );

                employee.setGender(
                        resultSet.getString("gender")
                );

                Date dob = resultSet.getDate("date_of_birth");

                if (dob != null) {
                    employee.setDateOfBirth(
                            dob.toLocalDate()
                    );
                }

                employee.setDepartmentId(
                        resultSet.getInt("department_id")
                );

                employee.setDepartmentName(
                        resultSet.getString("department_name")
                );

                employee.setDesignation(
                        resultSet.getString("designation")
                );

                Date joiningDate =
                        resultSet.getDate("joining_date");

                if (joiningDate != null) {
                    employee.setJoiningDate(
                            joiningDate.toLocalDate()
                    );
                }

                employee.setSalary(
                        resultSet.getDouble("salary")
                );

                employee.setStatus(
                        resultSet.getString("status")
                );

                employees.add(employee);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return employees;
    }


    // SEARCH EMPLOYEE
    public List<Employee> searchEmployees(String keyword) {

        List<Employee> employees = new ArrayList<>();

        String sql = """
                SELECT
                    e.employee_id,
                    e.employee_code,
                    e.first_name,
                    e.last_name,
                    e.email,
                    e.phone,
                    e.gender,
                    e.date_of_birth,
                    e.department_id,
                    d.department_name,
                    e.designation,
                    e.joining_date,
                    e.salary,
                    e.status
                FROM employees e
                INNER JOIN departments d
                    ON e.department_id = d.department_id
                WHERE
                    e.employee_code LIKE ?
                    OR e.first_name LIKE ?
                    OR e.last_name LIKE ?
                    OR e.email LIKE ?
                    OR e.designation LIKE ?
                ORDER BY e.employee_id ASC
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            String searchValue = "%" + keyword + "%";

            statement.setString(1, searchValue);
            statement.setString(2, searchValue);
            statement.setString(3, searchValue);
            statement.setString(4, searchValue);
            statement.setString(5, searchValue);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    Employee employee = new Employee();

                    employee.setEmployeeId(
                            resultSet.getInt("employee_id")
                    );

                    employee.setEmployeeCode(
                            resultSet.getString("employee_code")
                    );

                    employee.setFirstName(
                            resultSet.getString("first_name")
                    );

                    employee.setLastName(
                            resultSet.getString("last_name")
                    );

                    employee.setEmail(
                            resultSet.getString("email")
                    );

                    employee.setPhone(
                            resultSet.getString("phone")
                    );

                    employee.setGender(
                            resultSet.getString("gender")
                    );

                    Date dob =
                            resultSet.getDate("date_of_birth");

                    if (dob != null) {
                        employee.setDateOfBirth(
                                dob.toLocalDate()
                        );
                    }

                    employee.setDepartmentId(
                            resultSet.getInt("department_id")
                    );

                    employee.setDepartmentName(
                            resultSet.getString("department_name")
                    );

                    employee.setDesignation(
                            resultSet.getString("designation")
                    );

                    Date joiningDate =
                            resultSet.getDate("joining_date");

                    if (joiningDate != null) {
                        employee.setJoiningDate(
                                joiningDate.toLocalDate()
                        );
                    }

                    employee.setSalary(
                            resultSet.getDouble("salary")
                    );

                    employee.setStatus(
                            resultSet.getString("status")
                    );

                    employees.add(employee);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return employees;
    }
}