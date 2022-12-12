package com.example.FinalExam2.service.impl;


import com.example.FinalExam2.model.BenhNhan;
import com.example.FinalExam2.repository.IBenhNhan;
import com.example.FinalExam2.repository.impl.BenhNhanRepository;
import com.example.FinalExam2.service.IBenhNhanService;

import java.sql.SQLException;
import java.util.List;

public class BenhNhanService implements IBenhNhanService {
    IBenhNhan benhNhanRepository = new BenhNhanRepository();

    @Override
    public List<BenhNhan> findAll() {
        return benhNhanRepository.findAll();
    }

    @Override
    public boolean edit(BenhNhan benhNhan) throws SQLException {
        return benhNhanRepository.edit(benhNhan);
    }

    @Override
    public boolean delete(int idBenhNhan) {
        return benhNhanRepository.delete(idBenhNhan);
    }
}
