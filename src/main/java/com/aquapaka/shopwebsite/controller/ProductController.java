package com.aquapaka.shopwebsite.controller;

import javax.servlet.http.HttpServletRequest;

import com.aquapaka.shopwebsite.model.Product;
import com.aquapaka.shopwebsite.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {

    private final ProductService productService;
    
    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/addProduct")
    public String addProduct(Model model, HttpServletRequest request) {

        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");
        String display = request.getParameter("display");
        String os = request.getParameter("os");
        String cpu = request.getParameter("cpu");
        String gpu = request.getParameter("gpu");
        String ram = request.getParameter("ram");
        String storage = request.getParameter("storage");
        String battery = request.getParameter("battery");
        String img = request.getParameter("img");
        
        Product product = new Product(name, price, description, brand, display, os, cpu, gpu, ram, storage, battery, img);
        productService.addProduct(product);

        model.addAttribute("adminMessage", "Add product successfully"); 

        return "redirect:/";
    }
}
