package com.aquapaka.shopwebsite.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.aquapaka.shopwebsite.model.Product;
import com.aquapaka.shopwebsite.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    private final ProductService productService;
    
    @Autowired
    public MainController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String index(Model model) {

        List<Product> products = productService.getProducts();

        model.addAttribute("products", products);
        
        return "index";
    }

    @GetMapping("/login")
    public String login(Model model) {

        return "login";
    }

    @GetMapping("/register")
    public String register(Model model) {

        return "register";
    }

    @GetMapping("/search")
    public String search(Model model, HttpServletRequest request) {
    
        List<Product> products = productService.getProducts();

        String searchKeyword = request.getParameter("search");
        List<Product> searchedProducts = new ArrayList<Product>();

        for (Product product : products) {
            if(product.getName().toLowerCase().contains(searchKeyword.toLowerCase())) {
                searchedProducts.add(product);
            }
        }

        String searchMessage = "Searches for " + searchKeyword + ", found " + searchedProducts.size() + " products";
        model.addAttribute("searchMessage", searchMessage);
        model.addAttribute("products", searchedProducts);

        return "index";
    }

    @GetMapping("/productInfo")
    public String productInfo(Model model, HttpServletRequest request) {

        Long id = Long.parseLong(request.getParameter("id"));

        System.out.println("id:" + id);

        Product product = productService.getProduct(id);

        model.addAttribute("product", product);

        return "productInfo";
    }

    @GetMapping("/addProduct")
    public String addProduct() {

        return "addProduct";
    }
}
