package com.vishal.company.dao;

import com.vishal.company.model.Department;
import com.vishal.company.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDAO {

    // 1. View all departments
    public List<Department> getAllDepartments() throws SQLException {

        List<Department> departments = new ArrayList<>();

        String sql = """
                SELECT department_id, department_name, description, created_at
                FROM departments
                ORDER BY department_id ASC
                """;

        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                departments.add(mapDepartment(resultSet));
            }
        }

        return departments;
    }

    // 2. Find one department by ID
    public Department getDepartmentById(int departmentId) throws SQLException {

        String sql = """
                SELECT department_id, department_name, description, created_at
                FROM departments
                WHERE department_id = ?
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, departmentId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapDepartment(resultSet);
                }
            }
        }

        return null;
    }

    // 3. Add a new department
    public boolean addDepartment(Department department) throws SQLException {

        String sql = """
                INSERT INTO departments (department_name, description)
                VALUES (?, ?)
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, department.getDepartmentName());
            statement.setString(2, department.getDescription());

            return statement.executeUpdate() == 1;
        }
    }

    // 4. Update a department
    public boolean updateDepartment(Department department) throws SQLException {

        String sql = """
                UPDATE departments
                SET department_name = ?, description = ?
                WHERE department_id = ?
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, department.getDepartmentName());
            statement.setString(2, department.getDescription());
            statement.setInt(3, department.getDepartmentId());

            return statement.executeUpdate() == 1;
        }
    }

    // 5. Check whether employees belong to a department
    public boolean hasEmployees(int departmentId) throws SQLException {

        String sql = """
                SELECT COUNT(*)
                FROM employees
                WHERE department_id = ?
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, departmentId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0;
                }
            }
        }

        return false;
    }

    // 6. Delete a department only if no employees belong to it
    public boolean deleteDepartment(int departmentId) throws SQLException {

        String sql = """
                DELETE FROM departments
                WHERE department_id = ?
                """;

        try (Connection connection = DBConnection.getConnection()) {

            // Check and delete using the same connection and transaction.
            connection.setAutoCommit(false);

            try {
                String checkSql = """
                        SELECT COUNT(*)
                        FROM employees
                        WHERE department_id = ?
                        FOR UPDATE
                        """;

                try (PreparedStatement checkStatement =
                             connection.prepareStatement(checkSql)) {

                    checkStatement.setInt(1, departmentId);

                    try (ResultSet resultSet = checkStatement.executeQuery()) {
                        if (resultSet.next() && resultSet.getInt(1) > 0) {
                            connection.rollback();
                            return false;
                        }
                    }
                }

                try (PreparedStatement deleteStatement =
                             connection.prepareStatement(sql)) {

                    deleteStatement.setInt(1, departmentId);

                    boolean deleted = deleteStatement.executeUpdate() == 1;
                    connection.commit();
                    return deleted;
                }

            } catch (SQLException e) {
                connection.rollback();
                throw e;
            } finally {
                connection.setAutoCommit(true);
            }
        }
    }

    // Convert one database row into a Department object
    private Department mapDepartment(ResultSet resultSet) throws SQLException {

        Department department = new Department();

        department.setDepartmentId(
                resultSet.getInt("department_id"));

        department.setDepartmentName(
                resultSet.getString("department_name"));

        department.setDescription(
                resultSet.getString("description"));

        department.setCreatedAt(
                resultSet.getTimestamp("created_at"));

        return department;
    }
}