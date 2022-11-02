package repositories.Impl;

import model.Room;
import repositories.IRoomRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomRepository implements IRoomRepository {
    private final String SELECT_ALL = "select * from Room;";
    private final String DELETE_BY_ID = " delete from Room where maPhongTro =?;";
    private final String ADD_NEW = "insert into Room(tenNguoiThue,sDT,ngayBatDau,idHinhThuc) values (?,?,?,?);";
    private final String UPDATE_BY_ID = "update product set `name` = ?,price = ?,quantity = ?,color = ?,id_category = ? where id = ?";
    private final String SEARCH_BY = "call search(?)";

    @Override
    public List<Room> findAll() {
        List<Room> roomList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int maPhongTro = resultSet.getInt("maPhongTro");
                String tenNguoiThue = resultSet.getString("tenNguoiThue");
                int sDT = resultSet.getInt("sDT");
                String ngayBatDau = resultSet.getString("ngayBatDau");
                int idHinhThuc = resultSet.getInt("idHinhThuc");
                Room room = new Room(maPhongTro, tenNguoiThue, sDT, ngayBatDau, idHinhThuc);
                roomList.add(room);
            }
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return roomList;
    }

    @Override
    public void create(Room room) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW);
            preparedStatement.setString(1, room.getTenNguoiThue());
            preparedStatement.setInt(2, room.getsDT());
            preparedStatement.setString(3, room.getNgayBatDau());
            preparedStatement.setInt(4,room.getIdHinhThuc());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean delete(int maPhongTro) {Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, maPhongTro);
            int num = preparedStatement.executeUpdate();
            return (num == 1);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Room> search(String tenNguoiThue) {
        List<Room> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_BY);
            callableStatement.setString(1,tenNguoiThue);
            callableStatement.executeUpdate();
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int maPhongTro = resultSet.getInt("maPhongTro");
                String tenNguoiThueSearch = resultSet.getString("tenNguoiThue");
                int sDT = resultSet.getInt("sDT");
                String ngayBatDau = resultSet.getString("ngayBatDau");
                int idHinhThuc = resultSet.getInt("idHinhThuc");
                list.add(new Room(maPhongTro, tenNguoiThueSearch, sDT, ngayBatDau, idHinhThuc));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }
}
