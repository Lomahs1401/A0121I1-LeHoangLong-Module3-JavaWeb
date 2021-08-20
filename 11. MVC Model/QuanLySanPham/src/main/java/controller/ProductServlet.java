package controller;

import model.Product;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {

    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            // Khởi tạo action
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            default:
                showListProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            // Khởi tạo action
            action = "";
        }
        switch (action) {
            case "create":
                createNewProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void showListProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        lấy tất cả dữ liệu giả từ đối tượng ProductServiceImpl qua phương thức findAllProduct()
        Phương thức findAllProduct() trả về KDL ArrayList<>
        public List<Product> findAllProduct() {
            return new ArrayList<>(products.values());
        }
        */
        List<Product> products = this.productService.findAllProduct();
        request.setAttribute("products", products);
        // Chuyển hướng ProductServlet đến trang list.jsp, hiển thị tất cả danh sách product
        request.getRequestDispatcher("product/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // giữ trạng thái request và respone trước đó của list.jsp
        // chuyển hướng đến trang create.jsp
        request.getRequestDispatcher("product/create.jsp").forward(request, response);
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ các thẻ input request từ trang create.jsp
        String nameProduct = request.getParameter("nameProduct");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String country = request.getParameter("country");

        // sinh id ngẫu nhiên cho product từ 1 -> 10000
        int id = (int)(Math.random() * 10000);

        Product product = new Product(id, nameProduct, price, description, country);

        /* Lưu dữ liệu của đối tượng product qua phương thức save()
            public void save(Product product) {
                products.put(product.getId(), product)
        */
        this.productService.saveProduct(product);

        // Chuyển hướng về lại trang create.jsp để thông báo cho người dùng biết đã create product thành công!
        request.setAttribute("message", "Created New Product Successfully!");
        request.getRequestDispatcher("product/create.jsp").forward(request, response);

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("product/edit.jsp").forward(request, response);
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        String price= request.getParameter("price");
        String description = request.getParameter("description");
        String country = request.getParameter("country");

        Product product = this.productService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setNameProduct(nameProduct);
            product.setPrice(price);
            product.setDescription(description);
            product.setCountry(country);
            // Cập nhật lại dữ liệu qua phương thức updateProduct(int id, Product product)
            this.productService.updateProduct(id, product);
            request.setAttribute("product", product);
            request.setAttribute("message", "Updated Product Successfully!");
            request.getRequestDispatcher("product/edit.jsp").forward(request, response);
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("product/delete.jsp").forward(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            this.productService.deleteProduct(id);
            // Chuyển hướng về lại ProductServlet
            response.sendRedirect("/products");
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("product/view.jsp").forward(request, response);
        }
    }
}
