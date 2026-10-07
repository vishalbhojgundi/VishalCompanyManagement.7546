package com.vishal.company.controller;

import com.vishal.company.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/database-test")
public class DatabaseTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (Connection connection = DBConnection.getConnection()) {

            PrintWriter out = response.getWriter();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Database Test</title>");
            out.println("</head>");

            out.println("<body>");

            out.println("<h1>Database Connection Successful!</h1>");

            out.println("<p>Java → JDBC → MySQL</p>");

            out.println("<p>Database: vishal_company</p>");

            out.println("<p>Connection valid: "
                    + connection.isValid(2)
                    + "</p>");

            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {

            response.setStatus(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR
            );

            PrintWriter out = response.getWriter();

            out.println("<h1>Database Connection Failed</h1>");

            out.println("<p>" + e.getMessage() + "</p>");

            e.printStackTrace();
        }
    }
}