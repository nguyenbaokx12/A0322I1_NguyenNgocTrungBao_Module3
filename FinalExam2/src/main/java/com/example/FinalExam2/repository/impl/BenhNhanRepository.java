package com.example.FinalExam2.repository.impl;

import com.example.FinalExam2.model.BenhNhan;
import com.example.FinalExam2.repository.IBenhNhan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BenhNhanRepository implements IBenhNhan {
    private final String SELECT_ALL = "select * from benhnhan;";
    private final String DELETE_BY_ID = " delete from benhnhan where idBenhNhan =?;";
    private final String UPDATE_BY_ID = "update benhnhan set `nameBenhNhan` = ?,ngayNhapVien = ?,ngayXuatVien = ?,lyDo = ? where idBenhNhan = ?";


    @Override
    public List<BenhNhan> findAll() {
        List<BenhNhan> benhNhanList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idBenhNhan = resultSet.getInt("idBenhNhan");
                String nameBenhNhan = resultSet.getString("nameBenhNhan");
                String ngayNhapVien = resultSet.getString("ngayNhapVien");
                String ngayXuatVien = resultSet.getString("ngayXuatVien");
                String lyDo = resultSet.getString("lyDo");
                int id_BenhAn = resultSet.getInt("id_BenhAn");
                BenhNhan benhNhan = new BenhNhan(idBenhNhan,nameBenhNhan,ngayNhapVien,ngayXuatVien,lyDo,id_BenhAn);
                benhNhanList.add(benhNhan);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return benhNhanList;
    }

    @Override
    public boolean edit(BenhNhan benhNhan) throws SQLException {
        boolean rowUpdate;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
        preparedStatement.setInt(5, benhNhan.getIdBenhNhan());
        preparedStatement.setString(1, benhNhan.getNameBenhNhan());
        preparedStatement.setString(2, benhNhan.getNgayNhapVien());
        preparedStatement.setString(3, benhNhan.getNgayXuatVien());
        preparedStatement.setString(4, benhNhan.getLyDo());
        rowUpdate = preparedStatement.executeUpdate() > 0;
        return rowUpdate;
    }

    @Override
    public boolean delete(int idBenhNhan) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, idBenhNhan);
            int num = preparedStatement.executeUpdate();
            return (num == 1);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
