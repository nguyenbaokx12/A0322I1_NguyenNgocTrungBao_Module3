package service;

import model.Product;

import java.util.List;
public interface IProductService {
    //    Hiển thị danh sách sản phẩm
//    Tạo sản phẩm mới
//    Cập nhật thông tin sản phẩm
//    Xoá một sản phẩm
//    Xem chi tiết một sản phẩm
//    Tìm kiếm sản phẩm theo tên
    public List<Product> findAll();
    public List<Product> findBy(String name);
    public boolean add(Product book);
    public boolean delete(int id);

}