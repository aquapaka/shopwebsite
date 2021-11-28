package com.aquapaka.shopwebsite.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    
    private List<Product> products;

    public Cart() {
        this.products = new ArrayList<>();
    }

    public List<Product> getProducts() {
        return products;
    }

    public void addProduct(Product product) {
        products.add(product);
    }
    
    public void removeProductByIndex(int index) {
        for(int i = 0; i < products.size(); i++) {
            if(i == index) {
                products.remove(i);
            }
        }
    }

    public int totalPrice() {
        int total = 0;

        for(Product p : products) {
            total += p.getPrice();
        }

        return total;
    }
}
