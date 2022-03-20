/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.services.implement;


import com.cnpm.pojos.Account;
import com.cnpm.repository.AccountRepository;
import com.cnpm.services.AccountService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service("userDetailsService")
public class AccountServiceImplement implements AccountService{
    @Autowired
    private AccountRepository account;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public boolean addAccount(Account acc) {
        String pass= acc.getPass();
        acc.setPass(this.passwordEncoder.encode(pass));
        acc.setUserRole(Account.USER);
        return this.account.addAccount(acc);
    }

    @Override
    public List<Account> getAccount(String username) {
        return this.account.getAccount(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<Account> accs =this.getAccount(username);
        if(accs.isEmpty()){
            throw new UsernameNotFoundException("tai khoan ko ton tai");
        }
        Account acc = accs.get(0);
        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(acc.getUserRole()));
        return new User(acc.getUser(), acc.getPass(), auth);
    }

    @Override
    public boolean checkUsername(String username) {
        List<Account> accs= this.getAccount(username);
        if(accs.isEmpty()){
            return true;
        }
        return false;
    }
    
}
