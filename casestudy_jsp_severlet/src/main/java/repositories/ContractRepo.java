package repositories;

import model.contract.Contract;
import model.customer.Customer;
import model.employee.Employee;
import model.service.Service;

import java.util.List;

public interface ContractRepo {
    List<Contract> findAllContract();
    List<Employee> findAllEmployee();
    List<Customer> findAllCustomer();
    List<Service> fillAllService();
    Contract findById(int id);
    void create(Contract contract);
    void delete(int id);
    void update(Contract contract);
}
