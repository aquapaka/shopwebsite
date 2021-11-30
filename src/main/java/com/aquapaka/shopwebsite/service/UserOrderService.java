package com.aquapaka.shopwebsite.service;

import java.util.List;

import com.aquapaka.shopwebsite.model.UserOrder;
import com.aquapaka.shopwebsite.repository.UserOrderRepository;

import org.springframework.stereotype.Service;

@Service
public class UserOrderService {
    private final UserOrderRepository userOrderRepository;

    public UserOrderService(UserOrderRepository userOrderRepository) {
        this.userOrderRepository = userOrderRepository;
    }

    public void addUserOrder(UserOrder userOrder) {
        userOrderRepository.save(userOrder);
    }

    public List<UserOrder> getUserOrders() {
        return userOrderRepository.findAll();
    }
}
