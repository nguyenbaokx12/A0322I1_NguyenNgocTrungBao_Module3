package service;

import model.Room;

import java.sql.SQLException;
import java.util.List;

public interface IRoomService {
    List<Room> findAll();
    void create(Room room);
//    boolean edit(Product product) throws SQLException;
    boolean delete(int maPhongTro);
    List<Room> search(String tenNguoiThue);
}
