package com.example.CapNhapUngDungQuanLyUser.service.Impl;

import com.example.CapNhapUngDungQuanLyUser.model.User;
import com.example.CapNhapUngDungQuanLyUser.repositories.Impl.UserRepoImpl;
import com.example.CapNhapUngDungQuanLyUser.service.UserService;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserRepoImpl userRepo = new UserRepoImpl();
    @Override
    public void addNewUser(User user) throws SQLException, ClassNotFoundException {
        userRepo.addNewUser(user);
    }

    @Override
    public void deleteUser(int id) throws SQLException, ClassNotFoundException {
        userRepo.deleteUser(id);
    }

    @Override
    public void updateUser(User user) throws SQLException, ClassNotFoundException {
        userRepo.updateUser(user);
    }

    @Override
    public List<User> findAllUser() throws SQLException, ClassNotFoundException {
        return userRepo.findAllUser();
    }

    @Override
    public User findById(int id) throws SQLException, ClassNotFoundException {
        return userRepo.findById(id);
    }
}
