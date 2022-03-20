/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.pojos;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name="loaisanpham")
public class LoaiSanPham implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IDLoaiSP")
    private int idLoaiSP;
    @JoinColumn(name="IDNhomSP")
    @ManyToOne
    private NhomSanPham nSP;
    @Column(name="TenLoaiSP")
    private String tenLoaiSP;
    
    @OneToMany(mappedBy = "loaiSP")
    private List<MatHang> listMatHang;

    public LoaiSanPham() {
    }

    public LoaiSanPham(NhomSanPham NSP, String tenLoaiSP) {
        this.nSP = NSP;
        this.tenLoaiSP = tenLoaiSP;
    }

    public LoaiSanPham(int idLoaiSP, NhomSanPham NSP, String tenLoaiSP) {
        this.idLoaiSP = idLoaiSP;
        this.nSP = NSP;
        this.tenLoaiSP = tenLoaiSP;
    }
    
    public int getIdLoaiSP() {
        return idLoaiSP;
    }

    public void setIdLoaiSP(int idLoaiSP) {
        this.idLoaiSP = idLoaiSP;
    }

    public NhomSanPham getNSP() {
        return nSP;
    }

    public void setNSP(NhomSanPham NSP) {
        this.nSP = NSP;
    }

    public String getTenLoaiSP() {
        return tenLoaiSP;
    }

    public void setTenLoaiSP(String tenLoaiSP) {
        this.tenLoaiSP = tenLoaiSP;
    }

    public NhomSanPham getnSP() {
        return nSP;
    }

    public void setnSP(NhomSanPham nSP) {
        this.nSP = nSP;
    }

    public List<MatHang> getListMatHang() {
        return listMatHang;
    }

    public void setListMatHang(List<MatHang> listMatHang) {
        this.listMatHang = listMatHang;
    }

    
}
