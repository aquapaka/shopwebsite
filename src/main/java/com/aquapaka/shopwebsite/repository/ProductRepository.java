package com.aquapaka.shopwebsite.repository;

import com.aquapaka.shopwebsite.model.Product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}
