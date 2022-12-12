package com.example.FinalExam2.repository.impl;


import com.example.FinalExam2.model.BenhAn;
import com.example.FinalExam2.repository.IBenhAn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BenhAnRepository implements IBenhAn {
    private final String SELECT_ALL="SELECT * FROM benhan;";
    @Override
    public List<BenhAn> findAll() {
        List<BenhAn> benhAnList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idBenhAn = resultSet.getInt("idBenhAn");
                String nameBenhAn = resultSet.getString("nameBenhAn");
                BenhAn benhAn = new BenhAn(idBenhAn, nameBenhAn);
                benhAnList.add(benhAn);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return benhAnList;
    }
}
