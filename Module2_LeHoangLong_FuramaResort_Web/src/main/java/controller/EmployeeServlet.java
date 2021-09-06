package controller;

import modal.Employee;
import repository.EmployeeDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {

    private static final EmployeeDAO employeeDAO = new EmployeeDAO();

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
                addNewEmployee(request, response);
                break;
            case "update":
                updateEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
        }
    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("furama/employee/crud-employee.jsp").forward(request, response);
    }

    private void addNewEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeName = request.getParameter("employee-name");
        String employeeBirthday = request.getParameter("employee-birthday");
        String employeeIdCard = request.getParameter("employee-id-card");
        double employeeSalary = Double.parseDouble(request.getParameter("employee-salary"));
        String employeePhone = request.getParameter("employee-phone");
        String employeeEmail = request.getParameter("employee-email");
        String employeeAddress = request.getParameter("employee-address");
        int positionId = EmployeeDAO.checkPosition(request.getParameter("position-id"));
        int educationDegreeId = EmployeeDAO.checkEducationDegree(request.getParameter("education-degree-id"));
        int divisionId = EmployeeDAO.checkDivision(request.getParameter("division-id")) ;
        String username = request.getParameter("username");
        int employeeId;
        List<Employee> employees = employeeDAO.selectAllEmployees();
        if (employees == null) {
            employeeId = 1;
        } else {
            employeeId = employees.get(employees.size() - 1).getEmployeeId() + 1;
        }
        Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId, username);
        employeeDAO.saveEmployee(employee);
        String message = "Thêm Mới Nhân Viên Thành Công!";
        request.setAttribute("message", message);
        request.getRequestDispatcher("furama/employee/crud-employee.jsp").forward(request, response);
    }

    private void showListForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employees = employeeDAO.selectAllEmployees();
        request.setAttribute("employees", employees);
        request.getRequestDispatcher("furama/employee/list-employee.jsp").forward(request, response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeDAO.selectEmployeeById(id);
        request.setAttribute("updateEmployee", employee);
        request.getRequestDispatcher("furama/employee/crud-employee.jsp").forward(request, response);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("employee-id"));
        String employeeName = request.getParameter("employee-name");
        String employeeBirthday = request.getParameter("employee-birthday");
        String employeeIdCard = request.getParameter("employee-id-card");
        double employeeSalary = Double.parseDouble(request.getParameter("employee-salary"));
        String employeePhone = request.getParameter("employee-phone");
        String employeeEmail = request.getParameter("employee-email");
        String employeeAddress = request.getParameter("employee-address");
        int positionId = EmployeeDAO.checkPosition(request.getParameter("position-id"));
        int educationDegreeId = EmployeeDAO.checkEducationDegree(request.getParameter("education-degree-id"));
        int divisionId = EmployeeDAO.checkDivision(request.getParameter("division-id")) ;
        String username = request.getParameter("username");
        Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId, username);
        employeeDAO.updateEmployee(employee);
        String message = "Đã Cập Nhật Thành Công!";
        request.setAttribute("message", message);
        request.getRequestDispatcher("furama/employee/crud-employee.jsp").forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeDAO.selectEmployeeById(id);
        request.setAttribute("deleteEmployee", employee);
        request.getRequestDispatcher("furama/employee/crud-employee.jsp").forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("employee-id"));
        Employee employee = employeeDAO.selectEmployeeById(id);
        String message = "Đã Xóa Thành Công!";
        request.setAttribute("message", message);
        request.setAttribute("deleteEmployee", employee);
        request.getRequestDispatcher("furama/employee/crud-employee.jsp").forward(request, response);
        employeeDAO.deleteEmployee(id);
    }
}
