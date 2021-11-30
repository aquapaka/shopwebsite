package com.aquapaka.shopwebsite.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table
public class UserOrder {
    
    @Id
    @SequenceGenerator(
        name = "user_order_sequence",
        sequenceName = "user_order_sequence",
        allocationSize = 1
    )
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "user_order_sequence"
    )
    private Long id;
    private int status;
    private Date date;
    private String name;
    private String phone;
    private String email;
    private String address;
    private int totalPrice;
    @OneToMany(mappedBy="userOrder")
    private List<OrderDetail> orderDetails;

    public UserOrder() {

    }
    
    public UserOrder(int status, Date date, String name, String phone, String email, String address, int totalPrice,
            List<OrderDetail> orderDetails) {
        this.status = status;
        this.date = date;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.totalPrice = totalPrice;
        this.orderDetails = orderDetails;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    
    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    
}
