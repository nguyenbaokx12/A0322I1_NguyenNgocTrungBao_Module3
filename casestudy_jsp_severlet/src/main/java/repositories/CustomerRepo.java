package repositories;

import model.customer.Customer;

import java.util.List;

public interface CustomerRepo {
    List<Customer> findAll();
    void save(Customer customer);
    void delete(String id);
    void update(Customer customer);
    Customer findById(String id);
}
