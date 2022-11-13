package repositories;

import model.service.ServiceType;

import java.util.List;

public interface ServiceTypeRepo {
    List<ServiceType> findAll();
}
