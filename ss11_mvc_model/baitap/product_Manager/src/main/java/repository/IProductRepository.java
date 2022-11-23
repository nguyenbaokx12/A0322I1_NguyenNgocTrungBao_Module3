package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    public List<Product> findAll();
    public List<Product> findBy(String name);
    public boolean add(Product book);

    boolean delete(int id);
}
