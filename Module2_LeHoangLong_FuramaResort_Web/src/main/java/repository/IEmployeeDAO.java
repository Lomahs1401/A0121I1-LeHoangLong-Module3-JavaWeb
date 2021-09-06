package repository;

import modal.Employee;

import java.util.List;

public interface IEmployeeDAO {
    List<Employee> selectAllEmployees();
    void saveEmployee(Employee employee);
    Employee selectEmployeeById(int id);
    void updateEmployee(Employee employee);
    void deleteEmployee(int id);
}
