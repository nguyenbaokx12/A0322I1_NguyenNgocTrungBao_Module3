package service.Impl;

import model.Payment;
import repositories.Impl.PaymentRepository;
import service.IPaymentService;

import java.util.List;

public class PaymentService implements IPaymentService {
    PaymentRepository paymentRepository = new PaymentRepository();

    @Override
    public List<Payment> findAll() {
        return paymentRepository.findAll();
    }
}
