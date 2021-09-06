package repository;

import modal.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {
    private static final int DIAMOND_ID = 82091;
    private static final int PLATINUM_ID = 81038;
    private static final int GOLD_ID = 89401;
    private static final int SILVER_ID = 88284;
    private static final int MEMBER_ID = 85714;
    public static final String CALL_SELECT_ALL_CUSTOMERS = "{CALL select_all_customers}";
    public static final String CALL_INSERT_CUSTOMER = "{CALL insert_customer(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
    public static final String CALL_UPDATE_CUSTOMER = "{CALL update_customer(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
    public static final String CALL_DELETE_CUSTOMER = "{CALL delete_customer(?)}";

    public static int checkCustomerType(String customerType) {
        int customerTypeId = 0;
        switch(customerType) {
            case "diamond":
                customerTypeId = DIAMOND_ID;
                break;
            case "platinum":
                customerTypeId = PLATINUM_ID;
                break;
            case "gold":
                customerTypeId = GOLD_ID;
                break;
            case "silver":
                customerTypeId = SILVER_ID;
                break;
            case "member":
                customerTypeId = MEMBER_ID;
                break;
        }
        return customerTypeId;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        List<Customer> customers = new ArrayList<>();
        try {
            callableStatement = connection.prepareCall(CALL_SELECT_ALL_CUSTOMERS);
            resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int customerId = resultSet.getInt("customer_id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String customerName = resultSet.getString("customer_name");
                String customerBirthday = resultSet.getString("customer_birthday");
                String customerGender = resultSet.getString("customer_gender");
                String customerIdCard = resultSet.getString("customer_id_card");
                String customerPhone = resultSet.getString("customer_phone");
                String customerEmail = resultSet.getString("customer_email");
                String customerAddress = resultSet.getString("customer_address");
                customers.add(new Customer(customerId, customerTypeId, customerName, customerBirthday,customerGender,
                        customerIdCard, customerPhone, customerEmail, customerAddress));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                assert resultSet != null;
                resultSet.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                callableStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            DBConnection.close();
        }
        return customers.size() == 0 ? null : customers;
    }

    @Override
    public void saveCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(CALL_INSERT_CUSTOMER);
            callableStatement.setInt(1, customer.getCustomerId());
            callableStatement.setInt(2, customer.getCustomerTypeId());
            callableStatement.setString(3, customer.getCustomerName());
            callableStatement.setString(4, customer.getCustomerBirthday());
            callableStatement.setString(5, customer.getCustomerGender());
            callableStatement.setString(6, customer.getCustomerIdCard());
            callableStatement.setString(7, customer.getCustomerPhone());
            callableStatement.setString(8, customer.getCustomerEmail());
            callableStatement.setString(9, customer.getCustomerAddress());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                assert callableStatement != null;
                callableStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
    }

    @Override
    public Customer selectCustomerById(int id) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        Customer customer = new Customer();
        try {
            callableStatement = connection.prepareCall("{CALL select_customer_by_id(?)}");
            callableStatement.setInt(1, id);
            resultSet = callableStatement.executeQuery();
            resultSet.next();
            int customerTypeId = resultSet.getInt("customer_type_id");
            String customerName = resultSet.getString("customer_name");
            String customerBirthday = resultSet.getString("customer_birthday");
            String customerGender = resultSet.getString("customer_gender");
            String customerIdCard = resultSet.getString("customer_id_card");
            String customerPhone = resultSet.getString("customer_phone");
            String customerEmail = resultSet.getString("customer_email");
            String customerAddress = resultSet.getString("customer_address");
            customer = new Customer(id, customerTypeId, customerName, customerBirthday, customerGender,
                    customerIdCard, customerPhone, customerEmail, customerAddress);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                assert resultSet != null;
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                callableStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return customer;
    }

    @Override
    public void updateCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(CALL_UPDATE_CUSTOMER);
            callableStatement.setInt(1, customer.getCustomerId());
            callableStatement.setInt(2, customer.getCustomerTypeId());
            callableStatement.setString(3, customer.getCustomerName());
            callableStatement.setString(4, customer.getCustomerBirthday());
            callableStatement.setString(5, customer.getCustomerGender());
            callableStatement.setString(6, customer.getCustomerIdCard());
            callableStatement.setString(7, customer.getCustomerPhone());
            callableStatement.setString(8, customer.getCustomerEmail());
            callableStatement.setString(9, customer.getCustomerAddress());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                assert callableStatement != null;
                callableStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
    }

    @Override
    public void deleteCustomer(int id) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(CALL_DELETE_CUSTOMER);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                assert callableStatement != null;
                callableStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
    }
}
