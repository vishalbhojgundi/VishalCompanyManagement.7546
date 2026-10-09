
package com.vishal.company.controller;

import com.vishal.company.dao.AttendanceDAO;
import com.vishal.company.model.Attendance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/attendance")
public class AttendanceListServlet extends HttpServlet {

    private final AttendanceDAO dao = new AttendanceDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String dateText = request.getParameter("date");
            Date selectedDate = null;

            if (dateText != null && !dateText.isBlank()) {
                selectedDate = Date.valueOf(dateText);
            }

            List<Attendance> records = dao.getAllAttendance(selectedDate);

            int present = 0, absent = 0, leave = 0, halfDay = 0;

            for (Attendance a : records) {
                switch (a.getStatus().toUpperCase()) {
                    case "PRESENT" -> present++;
                    case "ABSENT" -> absent++;
                    case "LEAVE" -> leave++;
                    case "HALF DAY" -> halfDay++;
                }
            }

            request.setAttribute("records", records);
            request.setAttribute("selectedDate",
                    selectedDate == null
                            ? LocalDate.now().toString()
                            : selectedDate.toString());

            request.setAttribute("presentCount", present);
            request.setAttribute("absentCount", absent);
            request.setAttribute("leaveCount", leave);
            request.setAttribute("halfDayCount", halfDay);

            request.getRequestDispatcher("/attendance.jsp")
                    .forward(request, response);

        } catch (IllegalArgumentException e) {
            response.sendRedirect(request.getContextPath() + "/attendance");
        } catch (Exception e) {
            throw new ServletException("Unable to load attendance", e);
        }
    }
}
