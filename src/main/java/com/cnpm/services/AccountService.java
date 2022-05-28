/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.services;

import com.cnpm.pojos.Account;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author ADMIN
 */
public interface AccountService extends UserDetailsService {
    boolean addAccount(Account acc);

    List<Account> getAccount(String username);

    boolean checkUsername(String username);

    List<Account> getListAccount();

    boolean delete(int id);

    Account getProfile();
    boolean updateAvatar(Account acc);
    boolean updatePass(String passNew, String passNow);
}
