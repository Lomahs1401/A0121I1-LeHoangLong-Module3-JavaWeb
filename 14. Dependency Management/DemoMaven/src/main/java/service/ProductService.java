package service;

import model.Product;

import java.util.List;

// Interface ProductService là 1 interface định nghĩa các phương thức ở tầng service
// để người dùng có thể thao tác dữ liệu Product
public interface ProductService {
    List<Product> findAllProduct();
    void saveProduct(Product product);
    Product findById(int id);
    void updateProduct(int id, Product product);
    void deleteProduct(int id);
}
