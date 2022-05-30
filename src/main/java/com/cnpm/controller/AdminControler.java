/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.controller;

import com.cnpm.pojos.LoaiSanPham;
import com.cnpm.pojos.MatHang;
import com.cnpm.pojos.NhomSanPham;
import com.cnpm.services.*;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.cnpm.pojos.Account;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;
/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/admin")
public class AdminControler {
    @Autowired
    private MatHangService matHangService;
    @Autowired
    private NhomSanPhamService nhomSanPhamService;
    @Autowired
    private LoaiSanPhamService loaiSanPhamService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private HoaDonServices hoaDonServices;
    @GetMapping("/themsanpham")
    public String addMatHang(Model model){
        model.addAttribute("mathang", new MatHang());
        List <LoaiSanPham> listLsp = this.loaiSanPhamService.getList();
        model.addAttribute("list", listLsp);
        return "themsanpham";
    }
    
    @PostMapping("/matHang/add")
    public String readdMatHang(@ModelAttribute(value="mathang") MatHang hang){
        hang.setLoaiSP(this.loaiSanPhamService.getOne(hang.getIdLoaiSanPham()));
        if(this.matHangService.add(hang)){
            return "redirect:/";
        }
        else{
            return "themsanpham";
        }
    }
    
    @GetMapping("/nhomsanpham")
    public String addNhomSanPham(Model model){
        model.addAttribute("nsp", new NhomSanPham());
        model.addAttribute("nhom", this.nhomSanPhamService.getNSP());
        return "nhomsanpham";
    }

    @RequestMapping(path= "/nhomSanPham/add", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public String readdNhomSanPham(@ModelAttribute(value="nsp")NhomSanPham nsp){
        System.err.println();
        System.err.println(nsp.getTenNhomSP());
        if(this.nhomSanPhamService.add(nsp)){
            return "redirect:/admin/nhomsanpham";
        }
        else{
            return "addNhomSanPham";
        }
    }

    @GetMapping("/loaisanpham")
    public String addLoaiSanPham(Model model){
        List<NhomSanPham> listNSP = this.nhomSanPhamService.getNSP();
        model.addAttribute("lsp", new LoaiSanPham());
        model.addAttribute("listNSP", listNSP);
        model.addAttribute("loai", this.loaiSanPhamService.getList());
        return "loaisanpham";
    }
    
    @PostMapping("/loaiSanPham/add")
    public String readdLoaiSanPham(@ModelAttribute(value="lsp")LoaiSanPham lsp){
        NhomSanPham nhomSanPham = this.nhomSanPhamService.getNhomSanPham(lsp.getIdNhomsp());
        lsp.setNSP(nhomSanPham);
        System.err.println();
        System.err.println("===================== Fix bug Fix BUG ========================="+lsp.getTenLoaiSP());
        if(this.loaiSanPhamService.add(lsp)){
            return "redirect:/admin/loaisanpham";
        }
        else{
            return "addLoaiSanPham";
        }
    }
 
    @RequestMapping("")
    public String admin(Model model, @RequestParam(required = false) Map<String, String> param){
        int page = Integer.parseInt(param.getOrDefault("page", "1"));
        int count = Integer.parseInt(param.getOrDefault("count", "20"));
        model.addAttribute("list", this.matHangService.getList(count, page));
        model.addAttribute("countnew", this.hoaDonServices.getcountNew());
        return "pageAdmin";
    }
    
    @RequestMapping("/sanpham")
    public String danhsachsanpham(Model model, @RequestParam(required = false) Map<String, String> param){
        model.addAttribute("list", this.matHangService.getList(param.getOrDefault("kw", ""), Integer.parseInt(param.getOrDefault("page", "1"))));
        return "sanpham";
    }
//    Phần tài khoản
    @RequestMapping("/taikhoan")
    public String danhsachtaikhoan(Model model, @RequestParam(required = false) Map<String, String> param) throws NoSuchAlgorithmException{
        List<Account> list = this.accountService.getListAccount();
        for(int i= 0; i < list.size(); i++){
            String pass = list.get(i).getPass();
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(pass.getBytes());
            byte[] digest = md.digest();
            String passok = DatatypeConverter.printHexBinary(digest).toUpperCase();
            list.get(i).setPass(passok);
        }
        model.addAttribute("account", list);
        
        return "taikhoan";
    }

    @GetMapping("/comment")
    public String ViewComment(Model model){
        model.addAttribute("viewcm", this.commentService.getComment());
        return "comment";
    }

    @GetMapping("/donDatHang")
    public String ViewHoadon(Model model){
        model.addAttribute("listHoaDon", this.hoaDonServices.getListAdmin(0));
        return "donDatHang";
    }
    @GetMapping("/donDatHang/new")
    public String ViewHoadonnew(Model model){
        model.addAttribute("listHoaDon", this.hoaDonServices.getnew());
        return "donDatHang";
    }


    @GetMapping("/deleteComment/{id}")
    public String deleteComment(@PathVariable int id) {
        this.commentService.delete(id);
        return "redirect:/admin/comment";
    }

}
