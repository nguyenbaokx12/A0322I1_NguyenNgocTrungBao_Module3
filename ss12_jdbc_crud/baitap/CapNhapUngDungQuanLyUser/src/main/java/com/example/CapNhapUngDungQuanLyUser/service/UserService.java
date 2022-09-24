package com.example.CapNhapUngDungQuanLyUser.service;

import com.example.CapNhapUngDungQuanLyUser.model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    void addNewUser(User user) throws SQLException, ClassNotFoundException;
    void deleteUser(int id) throws SQLException, ClassNotFoundException;
    void updateUser(User user) throws SQLException, ClassNotFoundException;
    List<User> findAllUser() throws SQLException, ClassNotFoundException;
    User findById(int id) throws SQLException, ClassNotFoundException;
}
