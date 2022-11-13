package repositories.Impl;

import model.User;
import repositories.UserRepo;
import until.ConnectionUntil;
import until.Constants;

import java.sql.*;
import java.util.List;

public class UserRepoImpl implements UserRepo {

    @Override
    public void addNewUser(User user) throws SQLException, ClassNotFoundException {
        try (
                Connection connection = ConnectionUntil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(Constants.INSERT_USERS_SQL);)
        {
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void findById(int id){
    }

    @Override
    public List<User> findAllUsers() {
        return null;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException, ClassNotFoundException {
        Connection connection = ConnectionUntil.getConnection();
        boolean rowDelete = false;
        try {
            if(connection!=null) {
                CallableStatement callableStatement = connection.prepareCall("call delete_user(?)");
                callableStatement.setInt(1, id);
                rowDelete = callableStatement.executeUpdate() > 0;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public boolean updateUser(User user) throws SQLException, ClassNotFoundException {
        Connection connection = ConnectionUntil.getConnection();
        boolean rowUpdate = false;
        try {
            if(connection!=null) {
                CallableStatement callableStatement = connection.prepareCall("call update_user(?,?,?,?);");
                callableStatement.setString(1, user.getName());
                callableStatement.setString(2, user.getEmail());
                callableStatement.setString(3, user.getCountry());
                callableStatement.setInt(4, user.getId());

                rowUpdate = callableStatement.executeUpdate() > 0;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return rowUpdate;
    }

    @Override
    public User getUserById(int id) {
        return null;
    }

    @Override
    public void insertUser(User user) {

    }
}
