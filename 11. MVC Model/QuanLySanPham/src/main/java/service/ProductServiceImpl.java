package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// ProductServiceImpl là một lớp triển khai đầy đủ các phương thức được khai báo
// trong interface ProductService
public class ProductServiceImpl implements ProductService{

    // Sử dụng dữ liệu Product được khởi tạo sẵn
    private static final Map<Integer, Product> products;
    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Samsung Galaxy A50S", "2500000" ,"Sản phẩm tốt mức giá phổ thông", "Trung Quốc"));
        products.put(2, new Product(2, "Samsung Galaxy A20S 64GB", "4890000","Điện thoại tốt nahats năm 2020", "Trung Quốc"));
        products.put(3, new Product(3, "Iphone 11 Pro Max 64GB", "12390000","Điện thoại tốt nhất năm 2019", "Thái Lan"));
        products.put(4, new Product(4, "OPPO Reno2 F", "4269000","Sản phẩm mới từ dòng OPPO", "Trung Quốc"));
        products.put(5, new Product(5, "Xiaomi Redmi Note 8 (4GB/128GB)", "4319000","Sản phẩm nổi bật năm 2020", "Thái Lan"));
    }

    // Trả về danh sách Product
    @Override
    public List<Product> findAllProduct() {
        return new ArrayList<>(products.values());
    }

    // Lưu Product trong các action tạo mới product
    @Override
    public void saveProduct(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    // Cập nhật 1 Product
    @Override
    public void updateProduct(int id, Product product) {
        products.put(id, product);
    }

    // Xoá 1 product
    @Override
    public void deleteProduct(int id) {
        products.remove(id);
    }
}
