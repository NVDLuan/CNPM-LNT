/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.pojos;

import com.cnpm.validator.UsernameAccount;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "account")
public class Account implements Serializable{
    public static final String ADMIM="ROLE_ADMIN";
    public static final String USER = "ROLE_USER";
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IdAccount")
    private int id;
    private String user;
    private String pass;
    @Email(message = "vui long nhap email")
    private String email;
    private String userRole;
    @Transient
    private String repass;
    private String avatar;
    @Transient
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setAccount(AccountTmp tmp){
        this.user=tmp.getUser();
        this.pass=tmp.getPass();
        this.email=tmp.getEmail();
    }

    public String getRepass() {
        return repass;
    }

    public void setRepass(String repass) {
        this.repass = repass;
    }
    
    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public Account(int id, String user, String pass, String email, String userRole) {
        this.id = id;

        this.user = user;
        this.pass = pass;
        this.email = email;
        this.userRole = userRole;
    }

    public Account(int id,  String user, String pass, String email) {
        this.id = id;

        this.user = user;
        this.pass = pass;
        this.email = email;
    }

    public Account(String user, String pass, String email, String userRole) {
        this.user = user;
        this.pass = pass;
        this.email = email;
        this.userRole = userRole;

    }
    
    public Account(String user, String pass, String email) {

        this.user = user;
        this.pass = pass;
        this.email = email;
    }

    public Account() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Account{" +
                "user='" + user + '\'' +
                '}';
    }
}
