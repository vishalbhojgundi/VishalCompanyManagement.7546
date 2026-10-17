
package com.vishal.company.controller;

import com.vishal.company.dao.AdminDAO;
import com.vishal.company.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

    private final AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null
                && session.getAttribute("adminId") != null) {

            response.sendRedirect(
                    request.getContextPath() + "/admin/dashboard");
            return;
        }

        request.getRequestDispatcher("/admin-login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate the input
        if (username == null || password == null
                || username.isBlank() || password.isEmpty()) {

            request.setAttribute(
                    "error",
                    "Enter your username and password.");

            request.getRequestDispatcher("/admin-login.jsp")
                    .forward(request, response);
            return;
        }

        try {
            // Find admin by username
            Admin admin =
                    adminDAO.findByUsername(username.trim());

            // Compare the normal password with the database password
            boolean valid = admin != null
                    && "ACTIVE".equalsIgnoreCase(admin.getStatus())
                    && admin.getPasswordHash() != null
                    && password.equals(admin.getPasswordHash());

            if (!valid) {
                request.setAttribute(
                        "error",
                        "Invalid username or password.");

                request.getRequestDispatcher("/admin-login.jsp")
                        .forward(request, response);
                return;
            }

            // Invalidate the previous session after successful login
            HttpSession oldSession = request.getSession(false);

            if (oldSession != null) {
                oldSession.invalidate();
            }

            // Create a new session
            HttpSession session = request.getSession(true);

            session.setAttribute("adminId", admin.getAdminId());
            session.setAttribute("admin", admin.getFullName());
            session.setAttribute(
                    "adminUsername",
                    admin.getUsername());

            // Session expires after 20 minutes of inactivity
            session.setMaxInactiveInterval(20 * 60);

            // Open admin dashboard
            response.sendRedirect(
                    request.getContextPath() + "/admin/dashboard");

        } catch (Exception e) {
            throw new ServletException(
                    "Admin login failed", e);
        }
    }
}
