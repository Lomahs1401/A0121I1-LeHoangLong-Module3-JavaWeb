package repository;

import modal.Customer;

import java.util.List;

public interface ICustomerDAO {
    List<Customer> selectAllCustomer();
    void saveCustomer(Customer customer);
    Customer selectCustomerById(int id);
    void updateCustomer(Customer customer);
    void deleteCustomer(int id);
}
