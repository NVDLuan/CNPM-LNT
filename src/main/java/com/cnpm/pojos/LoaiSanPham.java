/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "loaisanpham")
public class LoaiSanPham implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IDLoaiSP")
    private int idLoaiSP;
    @JoinColumn(name = "IDNhomSP")
    @ManyToOne
    private NhomSanPham nSP;
    @Column(name = "TenLoaiSP")
    private String tenLoaiSP;
    @OneToMany(mappedBy = "loaiSP")
    private List<MatHang> listMatHang;

    @Transient
    private int idNhomsp;

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

    public int getIdNhomsp() {
        return this.idNhomsp;
    }

    public void setIdNhomsp(int idNhomsp) {
        this.idNhomsp = idNhomsp;
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
