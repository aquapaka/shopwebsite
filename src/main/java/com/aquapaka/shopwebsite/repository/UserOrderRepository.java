package com.aquapaka.shopwebsite.repository;

import com.aquapaka.shopwebsite.model.UserOrder;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserOrderRepository extends JpaRepository<UserOrder, Long> {    
}
