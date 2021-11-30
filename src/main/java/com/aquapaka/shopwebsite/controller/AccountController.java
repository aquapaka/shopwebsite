package com.aquapaka.shopwebsite.controller;

import javax.servlet.http.HttpServletRequest;

import com.aquapaka.shopwebsite.model.Account;
import com.aquapaka.shopwebsite.service.AccountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AccountController {
    
    private final AccountService accountService;

    @Autowired
    public AccountController(AccountService accountService) {
        this.accountService = accountService;
    }

    /**
     * This controller method is use to do login request
     * @param model
     * @param request
     * @return
     */
    @PostMapping("/login")
    public String login(Model model, HttpServletRequest request) {

        // Get request datas
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String emailRegex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        
        String message = "";

        if(!email.matches(emailRegex)) {
            message = "Email not valid";           
        } else if (password.length() < 8) {
            message = "Password length must >= 8";
        } else {
            if(accountService.checkLogin(email, password)) {
                Account account = accountService.getAccount(email);

                request.getSession().setAttribute("currentAccount", account);
                request.getSession().setAttribute("isLoggedIn", true);
                
                return "redirect:/";
            } else {
                message = "Can't find email or password";
            }
        }
        
        model.addAttribute("message", message);
        return "login";
    }

    /**
     * This controller method is used to do register request,
     * get and validate register datas and then create new account
     * @param model
     * @param request
     * @return
     */
    @PostMapping("/register")
    public String registerNewAccount(Model model, HttpServletRequest request) {

        // Get request datas
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        // Regex used to validate
        String emailRegex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        String phoneRegex = "^[0][0-9]{9}$";

        String message = "";

        // Validate datas
        if(!email.matches(emailRegex)) {
            message = "Email not valid";           
        } else if (password.length() < 8) {
            message = "Password length must >= 8";
        } else if (name.trim().isEmpty()) {
            message = "Name must be filled";
        } else if (address.trim().isEmpty()) {
            message = "Address must be filled";
        } else if (!phone.matches(phoneRegex)) {
            message = "Phone number not valid";
        } else {
            // Try to add new account
            Account account = new Account(email, password, 0, name, address, phone);
            boolean isSuccess = accountService.addNewAccount(account);

            // Check if account added or not
            if (!isSuccess) {
                message = "Email already exist";
            } else {
                String successMessage = "Register successfully, please login";
                model.addAttribute("successMessage", successMessage);
                
                return "login";
            }
        }

        // If data not valid, return register page with error message
        model.addAttribute("message", message);

        return "register";
    }

    @GetMapping("/logout")
    public String logout(Model model, HttpServletRequest request) {

        request.getSession().setAttribute("currentAccount", null);
        request.getSession().setAttribute("isLoggedIn", false);

        return "redirect:/";
    }
}
