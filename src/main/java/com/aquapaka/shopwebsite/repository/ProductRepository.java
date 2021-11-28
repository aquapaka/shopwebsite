package com.aquapaka.shopwebsite.repository;

import com.aquapaka.shopwebsite.model.Product;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
