package repositories;

import model.customer.CustomerType;

import java.util.List;

public interface CustomerTypeRepo {
    List<CustomerType> findAll();
    void save(CustomerType customerType);
    void delete(int id);
    void update(CustomerType customerType);
    CustomerType findById(int id);
}
