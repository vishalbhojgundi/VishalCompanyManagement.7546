
package com.vishal.company.dao;

import com.vishal.company.model.Attendance;
import com.vishal.company.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {

    public List<Attendance> getAllAttendance(Date date) throws SQLException {
        List<Attendance> list = new ArrayList<>();

        String sql = """
            SELECT a.*, e.employee_code,
                   CONCAT(e.first_name, ' ',
                          COALESCE(e.last_name, '')) AS employee_name
            FROM attendance a
            JOIN employees e ON a.employee_id = e.employee_id
            WHERE (? IS NULL OR a.attendance_date = ?)
            ORDER BY a.attendance_date DESC, e.employee_id ASC
            """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            if (date == null) {
                ps.setNull(1, Types.DATE);
                ps.setNull(2, Types.DATE);
            } else {
                ps.setDate(1, date);
                ps.setDate(2, date);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapAttendance(rs));
                }
            }
        }
        return list;
    }

    public Attendance getAttendanceById(int id) throws SQLException {
        String sql = """
            SELECT a.*, e.employee_code,
                   CONCAT(e.first_name, ' ',
                          COALESCE(e.last_name, '')) AS employee_name
            FROM attendance a
            JOIN employees e ON a.employee_id = e.employee_id
            WHERE a.attendance_id = ?
            """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapAttendance(rs);
                }
            }
        }
        return null;
    }

    public boolean saveAttendance(Attendance a) throws SQLException {
        String sql = """
            INSERT INTO attendance
                (employee_id, attendance_date, status,
                 check_in, check_out, remarks)
            VALUES (?, ?, ?, ?, ?, ?)
            """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, a.getEmployeeId());
            ps.setDate(2, a.getAttendanceDate());
            ps.setString(3, a.getStatus());
            setTime(ps, 4, a.getCheckIn());
            setTime(ps, 5, a.getCheckOut());
            ps.setString(6, a.getRemarks());

            return ps.executeUpdate() == 1;
        }
    }

    public boolean updateAttendance(Attendance a) throws SQLException {
        String sql = """
            UPDATE attendance
            SET employee_id = ?, attendance_date = ?, status = ?,
                check_in = ?, check_out = ?, remarks = ?
            WHERE attendance_id = ?
            """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, a.getEmployeeId());
            ps.setDate(2, a.getAttendanceDate());
            ps.setString(3, a.getStatus());
            setTime(ps, 4, a.getCheckIn());
            setTime(ps, 5, a.getCheckOut());
            ps.setString(6, a.getRemarks());
            ps.setInt(7, a.getAttendanceId());

            return ps.executeUpdate() == 1;
        }
    }

    public List<Attendance> getEmployees() throws SQLException {
        List<Attendance> list = new ArrayList<>();

        String sql = """
            SELECT employee_id, employee_code,
                   CONCAT(first_name, ' ',
                          COALESCE(last_name, '')) AS employee_name
            FROM employees
            WHERE status = 'ACTIVE'
            ORDER BY first_name, last_name
            """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Attendance a = new Attendance();
                a.setEmployeeId(rs.getInt("employee_id"));
                a.setEmployeeCode(rs.getString("employee_code"));
                a.setEmployeeName(rs.getString("employee_name"));
                list.add(a);
            }
        }
        return list;
    }

    private void setTime(PreparedStatement ps, int index, Time time)
            throws SQLException {
        if (time == null) {
            ps.setNull(index, Types.TIME);
        } else {
            ps.setTime(index, time);
        }
    }

    private Attendance mapAttendance(ResultSet rs) throws SQLException {
        Attendance a = new Attendance();

        a.setAttendanceId(rs.getInt("attendance_id"));
        a.setEmployeeId(rs.getInt("employee_id"));
        a.setEmployeeCode(rs.getString("employee_code"));
        a.setEmployeeName(rs.getString("employee_name"));
        a.setAttendanceDate(rs.getDate("attendance_date"));
        a.setStatus(rs.getString("status"));
        a.setCheckIn(rs.getTime("check_in"));
        a.setCheckOut(rs.getTime("check_out"));
        a.setRemarks(rs.getString("remarks"));
        a.setCreatedAt(rs.getTimestamp("created_at"));

        return a;
    }
}
