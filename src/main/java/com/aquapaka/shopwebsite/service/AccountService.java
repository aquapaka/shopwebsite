package com.aquapaka.shopwebsite.service;

import java.util.List;

import com.aquapaka.shopwebsite.model.Account;
import com.aquapaka.shopwebsite.repository.AccountRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {

    private final AccountRepository accountRepository;

    @Autowired
    public AccountService(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    public boolean checkLogin(String email, String password) {
        List<Account> accounts = accountRepository.findAll();

        // Check if email and password matches
        for(Account a : accounts) {
            if(email.equals(a.getEmail()) && password.equals((a.getPassword()))) {
                return true;
            }
        }

        return false;
    }

    public Account getAccount(String email) {
        return accountRepository.findByEmail(email);
    }

    public List<Account> getAccounts() {
        return accountRepository.findAll();
    }

    public boolean addNewAccount(Account account) {

        List<Account> accounts = accountRepository.findAll();

        // Check if email already exist
        for(Account a : accounts) {
            if(account.getEmail().equals(a.getEmail())) {
                return false;
            }
        }

        accountRepository.save(account);
        return true;
    }

}
