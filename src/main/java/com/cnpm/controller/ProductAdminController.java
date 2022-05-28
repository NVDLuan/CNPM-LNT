package com.cnpm.controller;

import com.cnpm.pojos.LoaiSanPham;
import com.cnpm.pojos.MatHang;
import com.cnpm.services.LoaiSanPhamService;
import com.cnpm.services.MatHangService;
import com.cnpm.services.NhomSanPhamService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/admin/product")
public class ProductAdminController {

    @Autowired
    private MatHangService matHangService;
    @Autowired
    private LoaiSanPhamService loaiSanPhamService;
    @Autowired
    private NhomSanPhamService nhomSanPhamService;

    @RequestMapping("")
    public String product(Model model, @RequestParam(required = true) Map<String, String> param) {
        int page = Integer.parseInt(param.getOrDefault("page", "1"));
        int count = Integer.parseInt(param.getOrDefault("count", "10"));
        model.addAttribute("list", this.matHangService.getList(10, 1, ""));
        return "pageProduct";
    }

    @GetMapping("/updatesanpham/{id}")
    public String updatemathang(Model model, @PathVariable int id) {
         List <LoaiSanPham> listLsp = this.loaiSanPhamService.getList();
        model.addAttribute("list", listLsp);
        model.addAttribute("product", this.matHangService.getOne(id));
        model.addAttribute("id", id);
        return "updatesanpham";
    }


    @PostMapping("/updatesanpham/{id}")
    public String updateProduct(@ModelAttribute("product") MatHang matHang, @PathVariable int id) {
        matHang.setIdMatHang(id);
        matHang.setLoaiSP(this.loaiSanPhamService.getOne(matHang.getIdLoaiSanPham()));
        if ( this.matHangService.updateProduct(matHang)) {
            return "redirect:/admin/sanpham";
        } else {
            return "redirect:/admin/updatesanpham/" + id;
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable int id) {
        this.matHangService.delete(id);
        return "redirect:/admin/sanpham";
    }
    
//    DELETE NHOM SAN PHAM
    @GetMapping("/deletenhom/{id}")
    public String deleteNhomsanpham(@PathVariable int id) {
        this.nhomSanPhamService.delete(id);
        return "redirect:/admin/nhomsanpham";
    }
    
//    DELETE LOẠI SAN PHAM
    @GetMapping("/deleteloai/{id}")
    public String deleteLoaisanpham(@PathVariable int id){
        this.loaiSanPhamService.delete(id);
        return"redirect:/admin/loaisanpham";
    }

}
