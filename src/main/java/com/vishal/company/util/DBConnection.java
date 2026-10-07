package com.vishal.company.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnection {

    private static final Properties properties = new Properties();

    static {
        try {
            InputStream inputStream =
                    DBConnection.class.getClassLoader()
                            .getResourceAsStream("db.properties");

            if (inputStream == null) {
                throw new RuntimeException("db.properties file not found");
            }

            properties.load(inputStream);

        } catch (Exception e) {
            throw new RuntimeException(
                    "Failed to load database configuration", e
            );
        }
    }

    public static Connection getConnection() {
        try {

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                    properties.getProperty("db.url"),
                    properties.getProperty("db.username"),
                    properties.getProperty("db.password")
            );

        } catch (Exception e) {
            throw new RuntimeException("Database connection failed", e);
        }
    }
}