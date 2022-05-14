/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.controller;

import com.cnpm.javaUtils.PersonUsing;
import com.cnpm.pojos.*;
import com.cnpm.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author ADMIN
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private MatHangService matHangService;
    @Autowired
    private GioHangServices gioHangServices;
    @Autowired
    private LoaiSanPhamService loaiSanPhamService;
    @Autowired
    private AddressServices addressServices;
    @Autowired
    private AccountService accountService;

    @ModelAttribute
    public void attribute(Model model) {
        if (PersonUsing.getUser() != "anonymousUser") {
            model.addAttribute("cartCounter", this.gioHangServices.count());
        }
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam(required = false) Map<String, String> param) {
        int page = Integer.parseInt(param.getOrDefault("page", "1"));
        String kw = param.getOrDefault("kw", "");
        int id = Integer.parseInt(param.getOrDefault("danhmuc", "-1"));
        if(id!=-1){
            model.addAttribute("listHang", this.matHangService.getListInLSP(id));
        }
        else model.addAttribute("listHang", this.matHangService.getList(kw, page));
        model.addAttribute("danhmuc", this.loaiSanPhamService.getList());
        return "index";
    }

    @RequestMapping("/cart")
    public String giohang(Model model) {
        model.addAttribute("carts", this.gioHangServices.get());
        return "giohang";
    }

    @RequestMapping("/lienhe")
    public String lienhe(Model model) {

        return "lienhe";
    }

    @RequestMapping("/Thanhtoan/{id}")
    public String Thanhtoan(Model model ,@PathVariable(value = "id") Integer id) {
        model.addAttribute("product", this.matHangService.getOne(id));
        model.addAttribute("hoadon",new HoaDon());
        model.addAttribute("diachi", this.addressServices.listDiaChi());
        return "Thanhtoan";
    }

    @GetMapping("/Thanhtoan/all")
    public String hoadon(Model model){

        return null;
    }

    @RequestMapping("/chitiet/{id}")
    public String chitiet(Model model, @PathVariable(value = "id") Integer id) {
        MatHang matHang = this.matHangService.getOne(id);
        model.addAttribute("product", matHang);
        return "chitiet";
    }

    @GetMapping("/user")
    public ResponseEntity<String> user() {
        String username = PersonUsing.getUser();

        ResponseEntity<String> stringRequestEntity = new ResponseEntity<>(username, HttpStatus.OK);
        return stringRequestEntity;
    }

    @GetMapping("/address/add")
    public String address(Model model){
        model.addAttribute("address", new DiaChi());
        return "addAddress";
    }
    @PostMapping("/address/add")
    public String reAdd(Model model, @ModelAttribute(name = "address")DiaChi diaChi){
        if(this.addressServices.create(diaChi)){
            return "forward:/Thanhtoan";
        }
        return "redirect:/address/add";
    }
    @GetMapping("/profile")
    public String profile(Model model){
        model.addAttribute("myprofile", this.accountService.getProfile());
        return "profileUser";
    }
}
