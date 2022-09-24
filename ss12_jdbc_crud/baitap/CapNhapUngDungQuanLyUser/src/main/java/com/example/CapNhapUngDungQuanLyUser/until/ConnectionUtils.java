package com.example.CapNhapUngDungQuanLyUser.until;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtils {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/User";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "Baokx12@";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        System.out.println("Connect Success");

        return connection;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        getConnection();
    }
}
