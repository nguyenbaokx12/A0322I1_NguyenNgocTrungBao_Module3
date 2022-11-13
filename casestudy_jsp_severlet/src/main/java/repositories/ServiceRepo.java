package repositories;

import model.service.Service;

import java.util.List;

public interface ServiceRepo {
    List<Service> findAll();
    List<String> findAllStandardRoom ();
    void save(Service service);
    void delete(String id);
    void update(Service service);
    Service findById(String id);
}
