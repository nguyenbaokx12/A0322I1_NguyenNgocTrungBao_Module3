package repositories;

import model.Payment;

import java.util.List;

public interface IPaymentRepository {
    List<Payment> findAll();
}
