package model;

public class Product {
    // id sản phẩm
    private int id;
    // tên sản phẩm
    private String nameProduct;
    // giá sản phẩm
    private String price;
    // mô tả sản phẩm
    private String description;
    // nhà sản xuất
    private String country;

    public Product(int id, String nameProduct, String price, String description, String country) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.price = price;
        this.description = description;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
