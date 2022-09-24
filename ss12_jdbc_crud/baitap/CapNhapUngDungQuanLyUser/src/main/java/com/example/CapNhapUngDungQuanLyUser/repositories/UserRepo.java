package com.example.CapNhapUngDungQuanLyUser.repositories;

import com.example.CapNhapUngDungQuanLyUser.model.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface UserRepo {
    void addNewUser(User user) throws SQLException, ClassNotFoundException;
    void deleteUser(int id) throws SQLException, ClassNotFoundException;
    void updateUser(User user) throws SQLException, ClassNotFoundException;
    List<User> findAllUser() throws SQLException, ClassNotFoundException;
    User findById(int id) throws SQLException, ClassNotFoundException;
}
