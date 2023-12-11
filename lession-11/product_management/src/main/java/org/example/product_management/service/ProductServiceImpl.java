package org.example.product_management.service;

import org.example.product_management.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static final Map<Integer, Product> products;

    static {
        products = new HashMap<>();

        products.put(1, new Product(1, "Monitor", 1000, "60Hz Monitor", "Viewsonic"));
        products.put(2, new Product(2, "Mouse", 2000, "Gaming Mouse", "ROG"));
        products.put(3, new Product(3, "Keyboard", 3000, "Gaming Keyboard", "Corsair"));
        products.put(4, new Product(4, "Headphone", 4000, "Gaming Headphone", "Steelseries"));
        products.put(5, new Product(5, "Microphone", 5000, "Gaming Microphone", "Razer"));
    }

    @Override
    public List<Product> showProductList() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void addProduct(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void deleteProduct(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = new ArrayList<>();
        for (Product product : products.values()) {
            if (product.getName().equalsIgnoreCase(name)) {
                productList.add(product);
            }
        }
        return productList;
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }
}
