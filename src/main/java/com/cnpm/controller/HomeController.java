/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.controller;

import com.cnpm.javaUtils.PersonUsing;
import com.cnpm.pojos.Account;
import com.cnpm.pojos.LoaiSanPham;
import com.cnpm.pojos.MatHang;
import com.cnpm.pojos.NhomSanPham;
import com.cnpm.services.AccountService;
import com.cnpm.services.GioHangServices;
import com.cnpm.services.LoaiSanPhamService;
import com.cnpm.services.MatHangService;
import com.cnpm.services.NhomSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
    private Object matHangCollection;

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
        String danhmuc = param.get("danhmuc");
        model.addAttribute("danhmuc", this.loaiSanPhamService.getList());
        if (danhmuc == null) {
            model.addAttribute("listHang", this.matHangService.getList(kw, page));
            model.addAttribute("acc", new Account());
        }
        else{
            LoaiSanPham loai = this.loaiSanPhamService.getOne(Integer.parseInt(danhmuc));
            model.addAttribute("listHang", loai.mathangCollection);
        }
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


    @RequestMapping("/chitiet/{id}")
    public String chitiet(Model model, @PathVariable(value = "id") Integer id) {
        MatHang matHang = this.matHangService.getOne(id);
        model.addAttribute("product", matHang);
        model.addAttribute("danhmuc", this.loaiSanPhamService.getList());
        return "chitiet";
    }
    @RequestMapping("/Thanhtoan/{id}")
    public String Thanhtoan(Model model, @PathVariable(value = "id") Integer id) {
        MatHang matHang = this.matHangService.getOne(id);
        model.addAttribute("product", matHang);
        return "Thanhtoan";
    }


    @GetMapping("/user")
    public ResponseEntity<String> user() {
        String username = PersonUsing.getUser();
        ResponseEntity<String> stringRequestEntity = new ResponseEntity<>(username, HttpStatus.OK);
        return stringRequestEntity;
    }

}
