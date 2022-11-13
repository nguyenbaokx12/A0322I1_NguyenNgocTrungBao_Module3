package repositories;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;

import java.util.List;

public interface EmployeeRepo {
    List<Employee> findAll();
    List<Position> findAllPosition();
    List<EducationDegree> findAllEducationDegree();
    List<Division> findAllDivision();
    Employee findById(int id);
    void create(Employee employee);
    void edit(Employee employee);
    void delete(int id);
}
