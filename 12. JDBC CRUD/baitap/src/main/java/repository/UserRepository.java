package repository;

import model.User;
import java.util.List;

public interface UserRepository {
    // thêm một user
    void insertUser(User user);
    // chọn 1 user theo id
    User selectUser(int id);
    // chọn tất cả user trong MySQL
    List<User> selectAllUsers();
    // xoá một user theo id
    void deleteUser(int id);
    // cập nhật một user
    void updateUser(User user);
    // tìm kiếm user theo country
    List<User> findByCountry(String country);
    // sắp xếp theo name
    List<User> sortName();
}
