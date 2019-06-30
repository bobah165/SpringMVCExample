package com.crud.service;

import com.crud.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> allProduct();
    void add (Product product);
    void delete(Product product);
    void edit (Product product);
    Product getByID (int id);
}
