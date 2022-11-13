package repositories;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserRepo {
    public void addNewUser(User user) throws SQLException, ClassNotFoundException;

    public void findById(int id) throws SQLException, ClassNotFoundException;

    public List<User> findAllUsers();

    public boolean deleteUser(int id) throws SQLException, ClassNotFoundException;

    public boolean updateUser(User user) throws SQLException, ClassNotFoundException;

    public User getUserById(int id);

    public void insertUser(User user);

}
