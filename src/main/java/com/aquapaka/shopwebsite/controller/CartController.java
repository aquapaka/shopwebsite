package com.aquapaka.shopwebsite.controller;

import javax.servlet.http.HttpServletRequest;

import com.aquapaka.shopwebsite.model.Cart;
import com.aquapaka.shopwebsite.model.Product;
import com.aquapaka.shopwebsite.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CartController {

    private final ProductService productService;

    @Autowired
    public CartController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/cartAdd")
    public String addProduct(Model model, HttpServletRequest request) {

        Long id = Long.parseLong(request.getParameter("id"));
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if(cart == null) {
            cart = new Cart();
        }

        Product product = productService.getProduct(id);
        cart.addProduct(product);

        request.getSession().setAttribute("cart", cart);

        return "redirect:/";
    }
    
    @PostMapping("/cartRemove")
    public String removeProduct(Model model, HttpServletRequest request) {

        Cart cart = (Cart)request.getSession().getAttribute("cart");
        int index = Integer.parseInt(request.getParameter("index"));

        cart.removeProductByIndex(index);

        request.getSession().setAttribute("cart", cart);

        return "redirect:/";
    }
}
