package repository;

import model.User;

import java.util.List;

public interface IUserDAO {
    User selectUser(int id);
    // chọn tất cả user trong MySQL
    List<User> selectAllUsers();
    // xoá một user theo id
    void deleteUser(int id);
    // cập nhật một user
    void updateUser(User user);
}
