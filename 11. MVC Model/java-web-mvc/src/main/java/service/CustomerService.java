package service;

import model.Customer;

import java.util.List;

// interface CustomerService là 1 interface định nghĩa các phương thức ở tầng service để thao
// tác với đối tượng dữ liệu Customer
public interface CustomerService {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void update(int id, Customer customer);
    void remove (int id);
}
