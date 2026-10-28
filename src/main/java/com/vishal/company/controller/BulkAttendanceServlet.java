
package com.vishal.company.controller;

import com.vishal.company.dao.AttendanceDAO;
import com.vishal.company.model.Attendance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@WebServlet("/admin/bulk-attendance")
public class BulkAttendanceServlet extends HttpServlet {

    private final AttendanceDAO dao = new AttendanceDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String dateText = request.getParameter("date");

            LocalDate selectedDate = (dateText == null || dateText.isBlank())
                    ? LocalDate.now()
                    : LocalDate.parse(dateText);

            Date sqlDate = Date.valueOf(selectedDate);

            request.setAttribute("selectedDate", selectedDate.toString());
            request.setAttribute(
                    "employees",
                    dao.getEmployeesForBulkAttendance(sqlDate));

            request.getRequestDispatcher(
                            "/WEB-INF/views/admin/bulkAttendance.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to load bulk attendance", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String redirect = request.getContextPath()
                + "/admin/bulk-attendance";

        try {
            String dateText = request.getParameter("attendanceDate");

            if (dateText == null || dateText.isBlank()) {
                response.sendRedirect(redirect + "?error=invalid");
                return;
            }

            Date date = Date.valueOf(dateText);

            String[] employeeIds = request.getParameterValues("employeeId");
            String[] statuses = request.getParameterValues("status");
            String[] remarks = request.getParameterValues("remarks");

            if (employeeIds == null || statuses == null
                    || remarks == null
                    || employeeIds.length == 0
                    || employeeIds.length != statuses.length
                    || employeeIds.length != remarks.length) {

                response.sendRedirect(
                        redirect + "?date=" + date + "&error=invalid");
                return;
            }

            Set<String> allowedStatuses = Set.of(
                    "PRESENT", "ABSENT", "LEAVE", "HALF DAY");

            List<Attendance> entries = new ArrayList<>();

            for (int i = 0; i < employeeIds.length; i++) {

                int employeeId = Integer.parseInt(employeeIds[i]);
                String status = statuses[i];

                if (status == null || !allowedStatuses.contains(status)) {
                    response.sendRedirect(
                            redirect + "?date=" + date + "&error=invalid");
                    return;
                }

                String remark = remarks[i];

                if (remark != null && remark.length() > 255) {
                    response.sendRedirect(
                            redirect + "?date=" + date + "&error=invalid");
                    return;
                }

                Attendance attendance = new Attendance();
                attendance.setEmployeeId(employeeId);
                attendance.setAttendanceDate(date);
                attendance.setStatus(status);
                attendance.setRemarks(
                        remark == null || remark.isBlank()
                                ? null : remark.trim());

                entries.add(attendance);
            }

            dao.saveBulkAttendance(date, entries);

            response.sendRedirect(
                    redirect + "?date=" + date + "&success=saved");

        } catch (IllegalArgumentException e) {
            response.sendRedirect(redirect + "?error=invalid");

        } catch (SQLException e) {
            if ("23000".equals(e.getSQLState())) {
                response.sendRedirect(redirect + "?error=duplicate");
            } else {
                throw new ServletException(
                        "Unable to save bulk attendance", e);
            }

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to save bulk attendance", e);
        }
    }
}
