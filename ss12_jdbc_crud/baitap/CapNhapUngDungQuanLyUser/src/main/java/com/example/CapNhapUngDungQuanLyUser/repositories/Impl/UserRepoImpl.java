package com.example.CapNhapUngDungQuanLyUser.repositories.Impl;

import com.example.CapNhapUngDungQuanLyUser.model.User;
import com.example.CapNhapUngDungQuanLyUser.repositories.UserRepo;
import com.example.CapNhapUngDungQuanLyUser.until.ConnectionUtils;
import com.example.CapNhapUngDungQuanLyUser.until.Constants;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepoImpl implements UserRepo {


    @Override
    public void addNewUser(User user) throws SQLException, ClassNotFoundException {
        try (
            Connection connection = ConnectionUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(Constants.INSERT_USERS_SQL);)
        {
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void deleteUser(int id) throws SQLException, ClassNotFoundException {
        try(Connection connection = ConnectionUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(Constants.DELETE_USERS_SQL))
        {
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        }

    }

    @Override
    public void updateUser(User user) throws SQLException, ClassNotFoundException {
        try(Connection connection = ConnectionUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(Constants.UPDATE_USERS_SQL))
        {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4,user.getId());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public List<User> findAllUser() throws SQLException, ClassNotFoundException {
        List<User> userList = new ArrayList<>();
        try(Connection connection = ConnectionUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(Constants.SELECT_ALL_USERS);
            ResultSet resultSet = preparedStatement.executeQuery();)
        {
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email =resultSet.getString("email");
                String country =resultSet.getString("country");
                userList.add(new User(id,name, email,country));
            }
        }
        return userList;
    }

    @Override
    public User findById(int id) throws SQLException, ClassNotFoundException {
        User user = null;
        try(Connection connection = ConnectionUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(Constants.SELECT_USER_BY_ID);)
        {
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                String name = resultSet.getString("name");
                String email =resultSet.getString("email");
                String country =resultSet.getString("country");
                user = new User(id,name, email, country);
                return user;
            };
        };
        return null;
    }
}
