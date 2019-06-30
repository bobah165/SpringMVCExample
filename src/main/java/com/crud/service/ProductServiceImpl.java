package com.crud.service;

import com.crud.dao.ProductDAO;
import com.crud.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    private ProductDAO productDAO;

    @Autowired
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Override
    @Transactional
    public List<Product> allProduct() {
        return productDAO.allProduct();
    }

    @Override
    @Transactional
    public void add(Product product) {
        productDAO.add(product);
    }

    @Override
    @Transactional
    public void delete(Product product) {
        productDAO.delete(product);
    }

    @Override
    @Transactional
    public void edit(Product product) {
        productDAO.edit(product);
    }

    @Override
    @Transactional
    public Product getByID(int id) {
        return productDAO.getByID(id);
    }
}
