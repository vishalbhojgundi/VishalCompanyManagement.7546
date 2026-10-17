
package com.vishal.company.dao;

import com.vishal.company.model.Admin;
import com.vishal.company.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    public Admin findByUsername(String username) throws SQLException {
        String sql = """
                SELECT admin_id, full_name, username,
                       password_hash, status
                FROM admins
                WHERE username = ?
                LIMIT 1
                """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Admin admin = new Admin();
                    admin.setAdminId(rs.getInt("admin_id"));
                    admin.setFullName(rs.getString("full_name"));
                    admin.setUsername(rs.getString("username"));
                    admin.setPasswordHash(rs.getString("password_hash"));
                    admin.setStatus(rs.getString("status"));
                    return admin;
                }
            }
        }

        return null;
    }

    public int countEmployees() throws SQLException {
        return count("SELECT COUNT(*) FROM employees");
    }

    public int countDepartments() throws SQLException {
        return count("SELECT COUNT(*) FROM departments");
    }

    public int countAttendanceToday() throws SQLException {
        return count(
                "SELECT COUNT(*) FROM attendance WHERE attendance_date = CURDATE()");
    }

    private int count(String sql) throws SQLException {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }

        return 0;
    }
}
