package com.example.FinalExam2.service.impl;

import com.example.FinalExam2.model.BenhAn;
import com.example.FinalExam2.repository.impl.BenhAnRepository;
import com.example.FinalExam2.service.IBenhAnService;

import java.util.List;

public class BenhAnService implements IBenhAnService {
    BenhAnRepository benhAnRepository = new BenhAnRepository();
    @Override
    public List<BenhAn> findAll() {
        return benhAnRepository.findAll();
    }
}
