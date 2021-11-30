package com.aquapaka.shopwebsite.service;

import java.util.List;

import com.aquapaka.shopwebsite.model.OrderDetail;
import com.aquapaka.shopwebsite.repository.OrderDetailRepository;

import org.springframework.stereotype.Service;

@Service
public class OrderDetailService {
    private final OrderDetailRepository orderDetailRepository;

    public OrderDetailService(OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
    }

    public void addOrderDetails(List<OrderDetail> orderDetail) {
        orderDetailRepository.saveAll(orderDetail);
    }

}
