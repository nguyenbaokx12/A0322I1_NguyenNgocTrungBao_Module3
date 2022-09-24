package com.example.TaoUngDungQuanLySanPham.models;

public class Product {
    private int id;
    private String name;
    private double price;
    private String manufacturerProduct;
    private String granteeByYear;

    public Product() {
    }

    public Product(int id, String name, double price, String manufacturerProduct, String granteeByYear) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.manufacturerProduct = manufacturerProduct;
        this.granteeByYear = granteeByYear;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getManufacturerProduct() {
        return manufacturerProduct;
    }

    public void setManufacturerProduct(String manufacturerProduct) {
        this.manufacturerProduct = manufacturerProduct;
    }

    public String getGranteeByYear() {
        return granteeByYear;
    }

    public void setGranteeByYear(String granteeByYear) {
        this.granteeByYear = granteeByYear;
    }
}
