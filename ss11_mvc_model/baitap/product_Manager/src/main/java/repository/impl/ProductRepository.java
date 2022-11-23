package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"tivi",2000000.0,"Viet Nam","2 nam"));
        productList.add(new Product(2,"tủ lạnh",800000.0,"Nhật Bản","3 nam"));
        productList.add(new Product(3,"Máy giặt",750000.0,"Nhật Bản","1 nam"));
        productList.add(new Product(4,"Tủ",370000.0,"Thái Lan","1 nam"));

    }



    @Override
    public List<Product> findAll() {
        return productList;
    }


    @Override
    public List<Product> findBy(String name) {
        List<Product> list = new ArrayList<>();
        for (int i = 0;i<productList.size();i++){
            if (productList.get(i).getNameProduct().equalsIgnoreCase(name)){
                list.add(productList.get(i));
            }
        }
        return  list;
    }

    @Override
    public boolean add(Product product) {
        return productList.add(product);
    }

    @Override
    public boolean delete(int id) {
        for (int i = 0;i<productList.size();i++){
            if (productList.get(i).getIdProduct()==id){
                productList.remove(i);
            }
        }
        return true;
    }
}