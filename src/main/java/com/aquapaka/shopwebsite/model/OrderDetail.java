package com.aquapaka.shopwebsite.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table
public class OrderDetail {
    
    @Id
    @SequenceGenerator(
        name = "order_detail_sequence",
        sequenceName = "order_detail_sequence",
        allocationSize = 1
    )
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "order_detail_sequence"
    )
    private Long id;

    @ManyToOne
    @JoinColumn(name="orderId")
    private UserOrder userOrder;
    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;
    
    public OrderDetail() {
    }    

    public OrderDetail(UserOrder userOrder, Product product) {
        this.userOrder = userOrder;
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserOrder getUserOrder() {
        return userOrder;
    }

    public void setUserOrder(UserOrder userOrder) {
        this.userOrder = userOrder;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
