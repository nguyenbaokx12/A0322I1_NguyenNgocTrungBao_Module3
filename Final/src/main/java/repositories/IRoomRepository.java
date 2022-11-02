package repositories;

import model.Room;

import java.sql.SQLException;
import java.util.List;

public interface IRoomRepository {
    List<Room> findAll();
    void create(Room room);
    boolean delete(int maPhongTro);
    List<Room> search(String tenNguoiThue);
}
