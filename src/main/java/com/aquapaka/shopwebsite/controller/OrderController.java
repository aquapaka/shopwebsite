package com.aquapaka.shopwebsite.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.aquapaka.shopwebsite.model.Cart;
import com.aquapaka.shopwebsite.model.OrderDetail;
import com.aquapaka.shopwebsite.model.Product;
import com.aquapaka.shopwebsite.model.UserOrder;
import com.aquapaka.shopwebsite.service.OrderDetailService;
import com.aquapaka.shopwebsite.service.UserOrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class OrderController {

    private final UserOrderService userOrderService;
    private final OrderDetailService orderDetailService;
    
    @Autowired
    public OrderController(UserOrderService userOrderService, OrderDetailService orderDetailService) {
        this.userOrderService = userOrderService;
        this.orderDetailService = orderDetailService;
    }

    @PostMapping("/submitOrder")
    public String submitOrder(Model model, HttpServletRequest request) {

        // Check if cart is empty
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if(cart == null || cart.getProducts().isEmpty()) {
            model.addAttribute("cartMessage", "Cart is empty");
            return "order";
        }

        // Get datas from form
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // Save datas to attributes
        model.addAttribute("name", name);
        model.addAttribute("phone", phone);
        model.addAttribute("email", email);
        model.addAttribute("address", address);

        String emailRegex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        String phoneRegex = "^[0][0-9]{9}$";

        // Validate datas
        String emailMessage, phoneMessage, nameMessage, addressMessage;
        boolean valid = true;
        if (!email.matches(emailRegex)) {
            emailMessage = "Email not valid";
            valid = false;
        } else emailMessage = "";

        if (!phone.matches(phoneRegex)) {
            phoneMessage = "Phone number not valid";
            valid = false;
        } else phoneMessage = "";

        if (name.trim().isEmpty()) {
            nameMessage = "Name must be filled";
            valid = false;
        } else nameMessage = "";

        if (address.trim().isEmpty()) {
            addressMessage = "Address must be filled";
            valid = false;
        } else addressMessage = "";

        if(!valid) {
            model.addAttribute("emailMessage", emailMessage);
            model.addAttribute("phoneMessage", phoneMessage);
            model.addAttribute("nameMessage", nameMessage);
            model.addAttribute("addressMessage", addressMessage);

            return "order";

        } else {
            UserOrder userOrder = new UserOrder(0, new Date(), name, phone, email, address, cart.totalPrice(), null);
            List<OrderDetail> orderDetails = new ArrayList<>();
            
            for(Product product : cart.getProducts()) {
                OrderDetail orderDetail = new OrderDetail(userOrder, product);
                orderDetails.add(orderDetail);
            }

            userOrder.setOrderDetails(orderDetails);

            userOrderService.addUserOrder(userOrder);
            orderDetailService.addOrderDetails(orderDetails);

            model.addAttribute("submited", true);
            model.addAttribute("name", null);
            model.addAttribute("phone", null);
            model.addAttribute("email", null);
            model.addAttribute("address", null);
            request.getSession().setAttribute("cart", null);
            
            return "order";
        }
    }

    @GetMapping("/viewOrders")
    public String viewOrders(Model model) {
        List<UserOrder> userOrders = userOrderService.getUserOrders();

        model.addAttribute("userOrders", userOrders);

        return "viewOrders";
    }
}
