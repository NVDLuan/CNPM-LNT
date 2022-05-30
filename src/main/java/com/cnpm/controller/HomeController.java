/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.controller;

import com.cnpm.javaUtils.PersonUsing;
import com.cnpm.pojos.*;
import com.cnpm.services.*;
import com.cnpm.services.AccountService;
import com.cnpm.services.GioHangServices;
import com.cnpm.services.LoaiSanPhamService;
import com.cnpm.services.MatHangService;
import com.cnpm.services.NhomSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
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
    @Autowired
    private NhomSanPhamService nhomSanPhamService;
    @Autowired
    private HoaDonServices hoaDonServices;
    @Autowired
    private CommentService commentService;
    @ModelAttribute
    public void attribute(Model model) {
        if (PersonUsing.getUser() != "anonymousUser") {
            model.addAttribute("user", this.accountService.getProfile());
            model.addAttribute("cartCounter", this.gioHangServices.count());
        }
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam(required = false) Map<String, String> param) {
        if(Integer.parseInt(param.getOrDefault("danhmuc", "-1"))!=-1){
            model.addAttribute("listHang", this.matHangService.getListInLSP(Integer.parseInt(param.getOrDefault("danhmuc", "-1"))));
        }
        else model.addAttribute("listHang", this.matHangService.getList(param.getOrDefault("kw", ""), Integer.parseInt(param.getOrDefault("page", "1"))));
        model.addAttribute("danhmuc", this.nhomSanPhamService.getNSP());
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
    public String chitiet(Model model, @PathVariable(value = "id") Integer id, Map<String, String> param) {
        model.addAttribute("product", this.matHangService.getOne(id));
        model.addAttribute("listComment",this.commentService.list(id,0));
        if(Integer.parseInt(param.getOrDefault("danhmuc", "-1"))!=-1){
            model.addAttribute("listHang", this.matHangService.getListInLSP(Integer.parseInt(param.getOrDefault("danhmuc", "-1"))));
        }
        else model.addAttribute("listHang", this.matHangService.getList(param.getOrDefault("kw", ""), Integer.parseInt(param.getOrDefault("page", "1"))));
        model.addAttribute("danhmuc", this.nhomSanPhamService.getNSP());
        return "chitiet";
    }
    @GetMapping("/Thanhtoan/all")
    public String hoadon(Model model, HttpSession session){
        model.addAttribute("address" , this.addressServices.listDiaChi());
        model.addAttribute("productListA", this.gioHangServices.get());
        model.addAttribute("diachi", this.addressServices.listDiaChi());
        model.addAttribute("hoadon", new HoaDon());
        session.setAttribute("cart", this.gioHangServices.get());
        session.setAttribute("url", "all");
        return "Thanhtoan";
    }


    @RequestMapping("/Thanhtoan/{id}")
    public String Thanhtoan(Model model, @PathVariable(value = "id") Integer id, HttpSession session) {
        model.addAttribute("diachi", this.addressServices.listDiaChi());
        model.addAttribute("address" , this.addressServices.listDiaChi());
        model.addAttribute("product", this.matHangService.getOne(id));
        model.addAttribute("hoadon", new HoaDon());
        session.setAttribute("url", id);
        return "Thanhtoan";
    }


    @GetMapping("/user")
    public ResponseEntity<String> user() {

        ResponseEntity<String> stringRequestEntity = new ResponseEntity<>(PersonUsing.getUser(), HttpStatus.OK);
        return stringRequestEntity;
    }

    @GetMapping("/address/add")
    public String address(Model model){
        model.addAttribute("address", new DiaChi());
        return "addAddress";
    }
    @PostMapping("/address/add")
    public String reAdd(Model model, @ModelAttribute(name = "address")DiaChi diaChi, HttpSession session){
        if(this.addressServices.create(diaChi)){
            return "redirect:/Thanhtoan/"+session.getAttribute("url");
        }
        return "redirect:/address/add";
    }
    @PostMapping("/dathang/all")
    public String datHangAll(Model model, @ModelAttribute(value="hoadon") HoaDon hoaDon, HttpSession session){
        if(this.hoaDonServices.thanhtoan((List<GioHang>) session.getAttribute("cart"),hoaDon))
        return "redirect:/hoadon";
        else return "redirect:/Thanhtoan/all";
    }
    @PostMapping("/dathang/{id}")
    public String datHangID(Model model, @ModelAttribute(value="hoadon") HoaDon hoaDon, @PathVariable(value = "id")Integer id, HttpSession session){
        session.setAttribute("mathang", this.matHangService.getOne(id));
        if(this.hoaDonServices.thanhtoan(this.matHangService.getOne(id), hoaDon))return "redirect:/hoadon";
        else return "redirect:/Thanhtoan/"+id;
    }
    @GetMapping("/hoadon")
    public String hoadonthanhtoan(Model model, HttpSession session){
        if(session.getAttribute("mathang")!= null) {
            model.addAttribute("mathang", session.getAttribute("mathang"));
            session.removeAttribute("mathang");
        }
        else {
            model.addAttribute("hoadon", (List<GioHang>) session.getAttribute("cart"));
            session.removeAttribute("cart");
        }
        return "hoadon";
    }
}
