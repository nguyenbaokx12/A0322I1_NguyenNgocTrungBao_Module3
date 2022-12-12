package com.example.FinalExam2.repository;

import com.example.FinalExam2.model.BenhNhan;

import java.sql.SQLException;
import java.util.List;

public interface IBenhNhan {
    List<BenhNhan> findAll();
    boolean edit(BenhNhan benhNhan) throws SQLException;
    boolean delete(int idBenhNhan);
}
