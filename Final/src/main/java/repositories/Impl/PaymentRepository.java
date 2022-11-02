package repositories.Impl;

import model.Payment;
import repositories.IPaymentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentRepository implements IPaymentRepository {
    private final String SELECT_ALL="SELECT * FROM Payment;";

    @Override
    public List<Payment> findAll() {
        // kết nối db
        List<Payment> categoryList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String namePayment = resultSet.getString("namePayment");
                Payment payment = new Payment(id,namePayment);
                categoryList.add(payment);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categoryList;
    }
}
