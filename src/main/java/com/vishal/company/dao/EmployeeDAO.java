package com.vishal.company.dao;

import com.vishal.company.model.Employee;
import com.vishal.company.util.DBConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    // =========================================================
    // ADD EMPLOYEE
    // =========================================================

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

            // Date of birth
            statement.setDate(7, employee.getDateOfBirth());

            statement.setInt(8, employee.getDepartmentId());
            statement.setString(9, employee.getDesignation());

            // Joining date
            statement.setDate(10, employee.getJoiningDate());

            statement.setDouble(11, employee.getSalary());
            statement.setString(12, employee.getStatus());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    // =========================================================
    // GET ALL EMPLOYEES
    // =========================================================

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
                JOIN departments d
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

                Employee employee =
                        extractEmployee(resultSet);

                employees.add(employee);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return employees;
    }


    // =========================================================
    // GET EMPLOYEE BY ID
    // =========================================================

    public Employee getEmployeeById(int employeeId) {

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
                JOIN departments d
                    ON e.department_id = d.department_id
                WHERE e.employee_id = ?
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, employeeId);

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                if (resultSet.next()) {

                    return extractEmployee(resultSet);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // UPDATE EMPLOYEE
    // =========================================================

    public boolean updateEmployee(Employee employee) {

        String sql = """
                UPDATE employees
                SET
                    employee_code = ?,
                    first_name = ?,
                    last_name = ?,
                    email = ?,
                    phone = ?,
                    gender = ?,
                    department_id = ?,
                    designation = ?,
                    salary = ?,
                    status = ?
                WHERE employee_id = ?
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
            statement.setInt(7, employee.getDepartmentId());
            statement.setString(8, employee.getDesignation());
            statement.setDouble(9, employee.getSalary());
            statement.setString(10, employee.getStatus());

            statement.setInt(11, employee.getEmployeeId());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    // =========================================================
    // DELETE EMPLOYEE
    // =========================================================

    public boolean deleteEmployee(int employeeId) {

        String sql = """
                DELETE FROM employees
                WHERE employee_id = ?
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, employeeId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    // =========================================================
    // SEARCH EMPLOYEE
    // =========================================================

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
                JOIN departments d
                    ON e.department_id = d.department_id
                WHERE
                    e.employee_code LIKE ?
                    OR e.first_name LIKE ?
                    OR e.last_name LIKE ?
                    OR e.email LIKE ?
                    OR e.designation LIKE ?
                    OR d.department_name LIKE ?
                ORDER BY e.employee_id ASC
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            String searchPattern = "%" + keyword + "%";

            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);
            statement.setString(3, searchPattern);
            statement.setString(4, searchPattern);
            statement.setString(5, searchPattern);
            statement.setString(6, searchPattern);

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                while (resultSet.next()) {

                    Employee employee =
                            extractEmployee(resultSet);

                    employees.add(employee);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return employees;
    }


    // =========================================================
    // CONVERT RESULTSET → EMPLOYEE OBJECT
    // =========================================================

    private Employee extractEmployee(ResultSet resultSet)
            throws Exception {

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

        employee.setDateOfBirth(
                resultSet.getDate("date_of_birth")
        );

        employee.setDepartmentId(
                resultSet.getInt("department_id")
        );

        employee.setDepartmentName(
                resultSet.getString("department_name")
        );

        employee.setDesignation(
                resultSet.getString("designation")
        );

        employee.setJoiningDate(
                resultSet.getDate("joining_date")
        );

        employee.setSalary(
                resultSet.getDouble("salary")
        );

        employee.setStatus(
                resultSet.getString("status")
        );

        return employee;
    }
}