package com.example.TaoUngDungQuanLySanPham.services;

import com.example.TaoUngDungQuanLySanPham.models.Product;

import java.util.List;

public interface ProductService {
    void addProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int id );
    List<Product> findAll();
    Product findById(int id);

}
