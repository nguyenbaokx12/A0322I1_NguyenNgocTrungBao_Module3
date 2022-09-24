package com.example.CapNhapUngDungQuanLyUser.until;

public class Constants {
    public static final String INSERT_USERS_SQL = "INSERT INTO User" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    public static final String SELECT_USER_BY_ID = "select id,name,email,country from User where id =?";
    public static final String SELECT_ALL_USERS = "select * from User";
    public static final String DELETE_USERS_SQL = "delete from User where id = ?;";
    public static final String UPDATE_USERS_SQL = "update User set name = ?,email= ?, country =? where id = ?;";

}
