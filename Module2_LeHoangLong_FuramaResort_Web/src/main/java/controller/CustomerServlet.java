package controller;

import modal.Customer;
import repository.CustomerDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {

    private static final CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "home":
                showHomePage(request, response);
                break;
            case "create":
                showCreateForm(request, response);
                break;
            case "list":
                showListForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addNewCustomer(request, response);
                break;
            case "update":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
        }
    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("furama/customer/crud-customer.jsp").forward(request, response);
    }

    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ create-update-customer.jsp
        String name = request.getParameter("name");
        String customerType = request.getParameter("customer-type");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("id-card");
        String phoneNumber = request.getParameter("phone-number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = CustomerDAO.checkCustomerType(customerType);
        List<Customer> customers = customerDAO.selectAllCustomer();
        int id;
        if (customers == null) {
            id = 1;
        } else {
            id = customers.get(customers.size() - 1).getCustomerId() + 1;
        }
        Customer customer = new Customer(id, customerTypeId, name, birthday, gender, idCard, phoneNumber, email, address);
        // Lưu dữ liệu của khách hàng vào DB
        customerDAO.saveCustomer(customer);
        String message = "Thêm Khách Hàng Mới Thành Công!";
        request.setAttribute("message", message);
        request.getRequestDispatcher("furama/customer/crud-customer.jsp").forward(request, response);
    }

    private void showListForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu của customer trong database
        List<Customer> customers = customerDAO.selectAllCustomer();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("furama/customer/list-customer.jsp").forward(request, response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerDAO.selectCustomerById(id);
        request.setAttribute("updateCustomer", customer);
        request.getRequestDispatcher("furama/customer/crud-customer.jsp").forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ update-customer.jsp
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String customerType = request.getParameter("customer-type");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("id-card");
        String phoneNumber = request.getParameter("phone-number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = CustomerDAO.checkCustomerType(customerType);

        Customer customer = new Customer(id, customerTypeId, name, birthday, gender, idCard, phoneNumber, email, address);
        customerDAO.updateCustomer(customer);
        String message = "Đã Cập Nhật Thành Công!";
        request.setAttribute("message", message);
        request.setAttribute("updateCustomer", customer);
        request.getRequestDispatcher("furama/customer/crud-customer.jsp").forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerDAO.selectCustomerById(id);
        request.setAttribute("deleteCustomer", customer);
        request.getRequestDispatcher("furama/customer/crud-customer.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerDAO.selectCustomerById(id);
        request.setAttribute("deleteCustomer", customer);
        String message = "Đã Xóa Thành Công!";
        request.setAttribute("message", message);
        request.getRequestDispatcher("furama/customer/crud-customer.jsp").forward(request, response);
        customerDAO.deleteCustomer(id);
    }

    private void addNewService(HttpServletRequest request, HttpServletResponse response) {
        // Lấy dữ liệu từ các thẻ input request từ service.jsp
        int serviceId = Integer.parseInt(request.getParameter("service-id"));
        String serviceName = request.getParameter("service-name");
        int serviceArea = Integer.parseInt(request.getParameter("service-area"));
        double serviceCost = Double.parseDouble(request.getParameter("service-cost"));
        int serviceMaxPeople = Integer.parseInt(request.getParameter("service-max-people"));
        String rentType = request.getParameter("rent-type");
        String serviceType = request.getParameter("service-type");
        String standardRoom = request.getParameter("standard-room");
        String descriptionOtherConvenience = request.getParameter("description-other-convenience");
        double poolArea = Double.parseDouble(request.getParameter("pool-area"));
        int numberOfFloors = Integer.parseInt(request.getParameter("number-of-floors"));
    }
}
