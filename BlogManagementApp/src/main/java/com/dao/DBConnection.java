package com.dao;

import java.sql.*;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/";
    private static final String DB_NAME = "blog_db";
    private static final String USER = "root";
    private static final String PASSWORD = "your_password";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            createDatabaseAndTables();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void createDatabaseAndTables() {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                Statement stmt = conn.createStatement()) {

            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS " + DB_NAME);

            try (Connection dbConn = DriverManager.getConnection(URL + DB_NAME, USER, PASSWORD);
                    Statement st = dbConn.createStatement()) {

                st.executeUpdate("""
                            CREATE TABLE IF NOT EXISTS users (
                                id INT PRIMARY KEY AUTO_INCREMENT,
                                username VARCHAR(50) NOT NULL UNIQUE,
                                password VARCHAR(100) NOT NULL,
                                role ENUM('admin','author') DEFAULT 'author'
                            );
                        """);

                st.executeUpdate("""
                            CREATE TABLE IF NOT EXISTS posts (
                                id INT PRIMARY KEY AUTO_INCREMENT,
                                title VARCHAR(150) NOT NULL,
                                content TEXT NOT NULL,
                                author_id INT,
                                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                FOREIGN KEY (author_id) REFERENCES users(id)
                            );
                        """);

                ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM users");
                rs.next();
                if (rs.getInt(1) == 0) {
                    st.executeUpdate("INSERT INTO users(username, password, role) VALUES ('admin','admin123','admin')");
                    System.out.println("✅ Default admin user created: admin / admin123");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL + DB_NAME, USER, PASSWORD);
    }
}
