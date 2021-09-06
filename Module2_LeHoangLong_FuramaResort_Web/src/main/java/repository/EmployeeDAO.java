package repository;

import modal.Employee;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO implements IEmployeeDAO {

    public static final String CALL_SELECT_ALL_EMPLOYEES = "{CALL select_all_employees}";
    public static final String CALL_INSERT_EMPLOYEE = "{CALL insert_employee(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
    public static final String CALL_UPDATE_EMPLOYEE = "CALL update_employee(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    public static final String CALL_DELETE_EMPLOYEE = "CALL delete_employee(?)";
    public static final String CALL_SELECT_EMPLOYEE_BY_ID = "CALL select_employee_by_id(?)";

    public static int checkPosition(String position) {
        int positionId = 0;
        switch (position) {
            case "le-tan":
                positionId = 1;
                break;
            case "giam-doc":
                positionId = 2;
                break;
            case "quan-ly":
                positionId = 3;
                break;
            case "phuc-vu":
                positionId = 4;
                break;
            case "chuyen-vien":
                positionId = 5;
                break;
            case "giam-sat":
                positionId = 6;
                break;
        }
        return positionId;
    }

    public static int checkEducationDegree(String educationDegree) {
        int educationDegreeId = 0;
        switch (educationDegree) {
            case "dai-hoc":
                educationDegreeId = 10;
                break;
            case "trung-cap":
                educationDegreeId = 11;
                break;
            case "cao-dang":
                educationDegreeId = 12;
                break;
            case "sau-dai-hoc":
                educationDegreeId = 13;
                break;
        }
        return educationDegreeId;
    }

    public static int checkDivision(String division) {
        int divisionId = 0;
        switch (division) {
            case "sale-marketing":
                divisionId = 100;
                break;
            case "phuc-vu":
                divisionId = 101;
                break;
            case "quan-ly":
                divisionId = 102;
                break;
            case "hanh-chinh":
                divisionId = 103;
                break;
        }
        return divisionId;
    }

    @Override
    public List<Employee> selectAllEmployees() {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        List<Employee> employees = new ArrayList<>();
        try {
            callableStatement = connection.prepareCall(CALL_SELECT_ALL_EMPLOYEES);
            resultSet = callableStatement.executeQuery();
            while(resultSet.next()) {
                int employeeId = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("employee_name");
                String employeeBirthday = resultSet.getString("employee_birthday");
                String employeeIdCard = resultSet.getString("employee_id_card");
                double employeeSalary = resultSet.getDouble("employee_salary");
                String employeePhone = resultSet.getString("employee_phone");
                String employeeEmail = resultSet.getString("employee_email");
                String employeeAddress = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String username = resultSet.getString("username");
                employees.add(new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                        employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId, username));
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
        return employees.size() == 0 ? null : employees;
    }

    @Override
    public void saveEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(CALL_INSERT_EMPLOYEE);
            callableStatement.setInt(1, employee.getEmployeeId());
            callableStatement.setString(2, employee.getEmployeeName());
            callableStatement.setString(3, employee.getEmployeeBirthday());
            callableStatement.setString(4, employee.getEmployeeIdCard());
            callableStatement.setDouble(5, employee.getEmployeeSalary());
            callableStatement.setString(6, employee.getEmployeePhone());
            callableStatement.setString(7, employee.getEmployeeMail());
            callableStatement.setString(8, employee.getEmployeeAddress());
            callableStatement.setInt(9, employee.getPositionId());
            callableStatement.setInt(10, employee.getEducationDegreeId());
            callableStatement.setInt(11, employee.getDivisionId());
            callableStatement.setString(12, employee.getUsername());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                assert callableStatement != null;
                callableStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            DBConnection.close();
        }
    }

    @Override
    public Employee selectEmployeeById(int id) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        Employee employee = new Employee();
        try {
            callableStatement = connection.prepareCall(CALL_SELECT_EMPLOYEE_BY_ID);
            callableStatement.setInt(1, id);
            resultSet = callableStatement.executeQuery();
            while(resultSet.next()) {
                int employeeId = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("employee_name");
                String employeeBirthday = resultSet.getString("employee_birthday");
                String employeeIdCard = resultSet.getString("employee_id_card");
                double employeeSalary = resultSet.getDouble("employee_salary");
                String employeePhone = resultSet.getString("employee_phone");
                String employeeEmail = resultSet.getString("employee_email");
                String employeeAddress = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String username = resultSet.getString("username");
                employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                        employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId, username);
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
        return employee;
    }

    @Override
    public void updateEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(CALL_UPDATE_EMPLOYEE);
            callableStatement.setInt(1, employee.getEmployeeId());
            callableStatement.setString(2, employee.getEmployeeName());
            callableStatement.setString(3, employee.getEmployeeBirthday());
            callableStatement.setString(4, employee.getEmployeeIdCard());
            callableStatement.setDouble(5, employee.getEmployeeSalary());
            callableStatement.setString(6, employee.getEmployeePhone());
            callableStatement.setString(7, employee.getEmployeeMail());
            callableStatement.setString(8, employee.getEmployeeAddress());
            callableStatement.setInt(9, employee.getPositionId());
            callableStatement.setInt(10, employee.getEducationDegreeId());
            callableStatement.setInt(11, employee.getDivisionId());
            callableStatement.setString(12, employee.getUsername());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                assert callableStatement != null;
                callableStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            DBConnection.close();
        }
    }

    @Override
    public void deleteEmployee(int id) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(CALL_DELETE_EMPLOYEE);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                assert callableStatement != null;
                callableStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            DBConnection.close();
        }
    }
}
