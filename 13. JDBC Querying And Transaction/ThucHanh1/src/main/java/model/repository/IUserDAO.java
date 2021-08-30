package model.repository;

import model.beans.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void insertUser(User user) throws SQLException;
    User selectUser(int id);
    List<User> selectAllUsers();
    void deleteUser(int id) throws SQLException;
    void updateUser(User user) throws SQLException;
    public User getUserById(int id);
    public void insertUserStore(User user) throws SQLException;
    public void addUserTransaction(User user, int[] permission);
    public void insertUpdateWithoutTransaction();
    public void insertUpdateUseTransaction();
}
