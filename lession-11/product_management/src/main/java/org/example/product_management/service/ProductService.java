package org.example.product_management.service;

import org.example.product_management.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> showProductList();

    void addProduct(Product product);

    void updateProduct(int id, Product product);

    void deleteProduct(int id);

    List<Product> findByName(String name);

    Product findById(int id);
}
