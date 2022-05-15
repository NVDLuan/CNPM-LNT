/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.pojos;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name="nhomsanpham")
public class NhomSanPham implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IDNhomSP")
    private int idNhomSP;
    @Column(name="TenNhomSP")
    private String tenNhomSP;
    @OneToMany(mappedBy = "nSP", fetch = FetchType.EAGER)
    private List<LoaiSanPham> loaiSanPham;
    

    public List<LoaiSanPham> getLoaiSanPham() {
        return loaiSanPham;
    }

    public void setLoaiSanPham(List<LoaiSanPham> loaiSanPham) {
        this.loaiSanPham = loaiSanPham;
    }

    public NhomSanPham(String tenNhomSP) {
        this.tenNhomSP = tenNhomSP;
    }

    public NhomSanPham() {
    }

    public NhomSanPham(int idNhomSP, String tenNhomSP) {
        this.idNhomSP = idNhomSP;
        this.tenNhomSP = tenNhomSP;
    }

    public int getIdNhomSP() {
        return idNhomSP;
    }

    public void setIdNhomSP(int idNhomSP) {
        this.idNhomSP = idNhomSP;
    }

    public String getTenNhomSP() {
        return tenNhomSP;
    }

    public void setTenNhomSP(String tenNhomSP) {
        this.tenNhomSP = tenNhomSP;
    }
          
}
