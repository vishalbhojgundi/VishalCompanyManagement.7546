
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
import java.util.Set;

@WebServlet("/edit-attendance")
public class AttendanceEditServlet extends HttpServlet {

    private final AttendanceDAO dao = new AttendanceDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Attendance attendance = dao.getAttendanceById(id);

            if (attendance == null) {
                response.sendRedirect(request.getContextPath() + "/attendance");
                return;
            }

            request.setAttribute("attendance", attendance);
            request.setAttribute("employees", dao.getEmployees());

            request.getRequestDispatcher("/editAttendance.jsp")
                    .forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/attendance");
        } catch (Exception e) {
            throw new ServletException("Unable to open attendance record", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("attendanceId"));
            int employeeId = Integer.parseInt(request.getParameter("employeeId"));
            Date date = Date.valueOf(request.getParameter("attendanceDate"));
            String status = request.getParameter("status");

            if (!Set.of("PRESENT", "ABSENT", "LEAVE", "HALF DAY")
                    .contains(status)) {
                response.sendRedirect(request.getContextPath() + "/attendance");
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
                response.sendRedirect(request.getContextPath()
                        + "/edit-attendance?id=" + id + "&error=time");
                return;
            }

            Attendance a = new Attendance();
            a.setAttendanceId(id);
            a.setEmployeeId(employeeId);
            a.setAttendanceDate(date);
            a.setStatus(status);
            a.setCheckIn(checkIn);
            a.setCheckOut(checkOut);
            a.setRemarks(request.getParameter("remarks"));

            dao.updateAttendance(a);

            response.sendRedirect(request.getContextPath()
                    + "/attendance?date=" + date + "&success=updated");

        } catch (SQLException e) {
            if ("23000".equals(e.getSQLState())) {
                response.sendRedirect(request.getContextPath()
                        + "/attendance?error=duplicate");
            } else {
                throw new ServletException("Unable to update attendance", e);
            }
        } catch (IllegalArgumentException e) {
            response.sendRedirect(request.getContextPath() + "/attendance");
        } catch (Exception e) {
            throw new ServletException("Unable to update attendance", e);
        }
    }

    private Time parseTime(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        return Time.valueOf(LocalTime.parse(value));
    }
}
