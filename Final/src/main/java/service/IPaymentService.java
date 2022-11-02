package service;

import model.Payment;

import java.util.List;

public interface IPaymentService {
    List<Payment> findAll();
}
