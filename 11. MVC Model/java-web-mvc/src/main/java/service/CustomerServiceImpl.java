package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// CustomerServiceImpl là một lớp triển khai đầy đủ các phương thức của interface CustomerService
public class CustomerServiceImpl implements CustomerService {
    //Chúng ta giả lập lớp CustomerServiceImpl làm đối tượng cung cấp dữ liệu giả.
    //Trong các ứng dụng thực tes, danh sách khách hàng sẽ được lưu vào cơ sở dữ liệu

    private final static Map<Integer, Customer> listCustomers;

    static {
        listCustomers = new HashMap<>();
        listCustomers.put(1, new Customer(1, "John", "john@gmail.com", "Hanoi"));
        listCustomers.put(2, new Customer(2, "Bill", "bill@gmail.com", "Danang"));
        listCustomers.put(3, new Customer(3, "Alex", "alex@gmail.com", "Saigon"));
        listCustomers.put(4, new Customer(4, "Adam", "adam@gmail.com", "Beijing"));
        listCustomers.put(5, new Customer(5, "Sophia", "sophia@gmail.com", "Miami"));
        listCustomers.put(6, new Customer(6, "Rose", "rose@gmail.com", "Japan"));
    }
    // phương thức values trả về value của hashmap (<key,value>)
    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(listCustomers.values());
    }

    @Override
    public void save(Customer customer) {
        listCustomers.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return listCustomers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        listCustomers.put(id, customer);
    }

    @Override
    public void remove(int id) {
        listCustomers.remove(id);
    }
}
