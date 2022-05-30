/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.controller;

import com.cnpm.pojos.Account;
import com.cnpm.pojos.AccountTmp;
import com.cnpm.pojos.MatHang;
import com.cnpm.services.AccountService;

import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpSession;

import com.cnpm.services.HoaDonServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author ADMIN
 */
@Controller
public class UserController {
    @Autowired
    private AccountService userDetailsService;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private AccountService accountService;
    @Autowired
    private HoaDonServices hoaDonServices;
    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
        dataBinder.addValidators();
    }
    
    @GetMapping("/login")
    public String login(){

        return "login";
    }

    @RequestMapping("/signup")
    public String signup(Model model){
        model.addAttribute("acc", new AccountTmp());
        return "signup";
    }

    
    @GetMapping("/register")
    public String register(@RequestParam(value="code") int item, Model model, HttpSession session){
        model.addAttribute("acc", new AccountTmp());
        AccountTmp accs= (AccountTmp) session.getAttribute("acc");
        if(item == accs.getCode()){
            Account acc = new Account();
            acc.setAccount(accs);
            if(!this.userDetailsService.addAccount(acc)) return "signup";
            return "redirect:/";
        }
  
        return "signup";
    }
    @PostMapping("/verification")
    public String verificationEmail(@ModelAttribute(name="acc") AccountTmp acc, HttpSession session){
        Random r = new Random();
        int code = r.nextInt(899999)+100000;
        acc.setCode(code);
        SimpleMailMessage mess= new SimpleMailMessage();
        mess.setTo(acc.getEmail());
        mess.setSubject("Công nghệ phần mềm nhóm LNT");
        mess.setText("Mã xác minh email của bạn là: /n /t "+ acc.getCode());
        
        this.mailSender.send(mess);
        session.setAttribute("acc", acc);
        return "chungthuc";
    }

    @GetMapping("/profile")
    public String profile(Model model){
        model.addAttribute("Changeassword", this.accountService.getProfile());
        return "profileUser";
    }

    @PostMapping("/changeassword")
    public String Changeassword(Model model, @RequestParam(required = false) Map<String, String> param){
        String passnow = param.get("passnow");
        String passnew = param.get("passnew");
        String repassnew = param.get("repassnew");
        if(!passnew.equals(repassnew)){
            return "redirect:/profile";
        }
        else{
            if(this.accountService.updatePass(passnew, passnow)){
                return "redirect:/";
            }
            else {
                System.err.println("===bug===");
                System.err.println("bug do chinh sua data");
                return "redirect:/profile";
            }
        }

    }
//    Update avatar
    @GetMapping("/addavatar")
    public String Avatar(Model model){
        model.addAttribute("myprofile", this.accountService.getProfile());
        return "addavatar";
    }
    @PostMapping("/updateAvatar")
    public String addAvatar(Model model, @ModelAttribute(value = "myprofile")Account acc ){
        this.accountService.updateAvatar(acc);
        model.addAttribute("myprofile", this.accountService.getProfile());

        return "addavatar";
    }

    @GetMapping("/profilename")
    public ResponseEntity <Account> getprofile(){
        return new ResponseEntity<>(this.accountService.getProfile(), HttpStatus.OK);
    }

    @GetMapping("/donhang")
    public String Donhangcuaban(Model model){
        model.addAttribute("myhoadon", this.hoaDonServices.getList());
        return "donhang";
    }
        
}
