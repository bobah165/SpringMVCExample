package com.crud.dao;

import com.crud.model.Product;

import java.util.List;

public interface ProductDAO {

    List<Product> allProduct();
    void add (Product product);
    void delete(Product product);
    void edit (Product product);
    Product getByID (int id);
}
