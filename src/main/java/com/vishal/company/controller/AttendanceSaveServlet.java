
package com.vishal.company.controller;

import com.vishal.company.dao.AttendanceDAO;
import com.vishal.company.model.Attendance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.SQLException;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.Set;

@WebServlet("/mark-attendance")
public class AttendanceSaveServlet extends HttpServlet {

    private final AttendanceDAO dao = new AttendanceDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("employees", dao.getEmployees());
            request.setAttribute("today", Date.valueOf(
                    java.time.LocalDate.now()).toString());

            request.getRequestDispatcher("/markAttendance.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Unable to open attendance form", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            int employeeId = Integer.parseInt(
                    request.getParameter("employeeId"));

            Date date = Date.valueOf(request.getParameter("attendanceDate"));
            String status = request.getParameter("status");

            Set<String> allowed = Set.of(
                    "PRESENT", "ABSENT", "LEAVE", "HALF DAY");

            if (!allowed.contains(status)) {
                response.sendRedirect(
                        request.getContextPath()
                                + "/mark-attendance?error=invalid");
                return;
            }

            Time checkIn = parseTime(request.getParameter("checkIn"));
            Time checkOut = parseTime(request.getParameter("checkOut"));

            if (!status.equals("PRESENT") && !status.equals("HALF DAY")) {
                checkIn = null;
                checkOut = null;
            }

            if (checkIn != null && checkOut != null
                    && checkOut.before(checkIn)) {
                response.sendRedirect(
                        request.getContextPath()
                                + "/mark-attendance?error=time");
                return;
            }

            Attendance a = new Attendance();
            a.setEmployeeId(employeeId);
            a.setAttendanceDate(date);
            a.setStatus(status);
            a.setCheckIn(checkIn);
            a.setCheckOut(checkOut);
            a.setRemarks(request.getParameter("remarks"));

            dao.saveAttendance(a);

            response.sendRedirect(request.getContextPath()
                    + "/attendance?date=" + date + "&success=added");

        } catch (SQLException e) {
            if ("23000".equals(e.getSQLState())) {
                response.sendRedirect(request.getContextPath()
                        + "/mark-attendance?error=duplicate");
            } else {
                throw new ServletException("Unable to save attendance", e);
            }
        } catch (IllegalArgumentException e) {
            response.sendRedirect(request.getContextPath()
                    + "/mark-attendance?error=invalid");
        } catch (Exception e) {
            throw new ServletException("Unable to save attendance", e);
        }
    }

    private Time parseTime(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        return Time.valueOf(LocalTime.parse(value));
    }
}
