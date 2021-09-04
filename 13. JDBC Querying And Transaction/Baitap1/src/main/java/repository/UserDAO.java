package repository;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UserDAO implements IUserDAO {
    public static final String SELECT_USER_BY_ID = "SELECT * FROM users WHERE id = ?;";
    public static final String CALL_SELECT_ALL_USERS = "{CALL select_all_user};";
    public static final String CALL_UPDATE_USER = "{CALL edit_user(?, ?, ?, ?)};";
    public static final String CALL_DELETE_USER = "{CALL delete_user(?)};";

    public UserDAO() {
    }

    // Phương thức chọn một user theo id
    @Override
    public User selectUser(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        User user = null;
        ResultSet resultSet = null;
        // Step 1: Establishing a Connection
        try {
            preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                assert false;
                resultSet.close();
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return user;
    }

    // Phương thức chọn tất cả users
    @Override
    public List<User> selectAllUsers() {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        List<User> users = new ArrayList<>();
        try {
            callableStatement = connection.prepareCall(CALL_SELECT_ALL_USERS);
            resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                assert resultSet != null;
                resultSet.close();
                callableStatement.close();
                DBConnection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return users;
    }

    // Phương thức xoá một user theo id
    @Override
    public void deleteUser(int id) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        boolean rowDeleted;
        try {
            callableStatement = connection.prepareCall(CALL_DELETE_USER);
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
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

    // Phương thức cập nhật một user
    @Override
    public void updateUser(User user) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        boolean rowUpdated;
        try {
            callableStatement = connection.prepareCall(CALL_UPDATE_USER);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, user.getId());
            rowUpdated = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
