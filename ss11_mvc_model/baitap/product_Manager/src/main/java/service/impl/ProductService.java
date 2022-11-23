package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> findBy(String name) {
        return  productRepository.findBy(name);
    }


    @Override
    public boolean add(Product product) {
        productRepository.add(product);
        return true;
    }

    @Override
    public  boolean delete(int id) {
        return productRepository.delete(id);
    }
}