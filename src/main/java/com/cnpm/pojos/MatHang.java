/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.pojos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

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
@Table(name = "mathang")
public class MatHang implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IDMatHang")
    private int idMatHang;
    @Column(name="TenMH")
    private String tenMH;
    @Column(name="Hang")
    private String hang;
    @Column(name="HinhAnh")
    private String hinhAnh;
    @Column(name="Gia")
    private int gia;
    @Column(name="GiaKhuyenMai")
    private int giaKhuyenMai;
    @Column(name = "SoLuong")
    private int soLuong;
    @Column(name = "ChiTiet")
    private String chiTiet;
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LoaiSP")
    private LoaiSanPham loaiSP;

    @Override
    public String toString() {
        return "MatHang{" +
                "tenMH='" + tenMH + '\'' +
                '}';
    }

    @Transient
    private MultipartFile file;
    @Transient
    private int idLoaiSanPham;
    @OneToMany(mappedBy = "matHang",fetch = FetchType.LAZY)
    @JsonIgnore
    private List<Images> listImg;
    @OneToMany(cascade = CascadeType.DETACH,fetch = FetchType.LAZY, mappedBy = "iDMatHang")
    @JsonIgnore
    private Collection<Comment> commentCollection;

    public MatHang(String tenMH, String hang, String hinhAnh, int gia, int giaKhuyenMai, int soLuong, String chiTiet, LoaiSanPham loaiSP, int idBanHang) {
        this.tenMH = tenMH;
        this.hang = hang;
        this.hinhAnh = hinhAnh;
        this.gia = gia;
        this.giaKhuyenMai = giaKhuyenMai;
        this.soLuong = soLuong;
        this.chiTiet = chiTiet;
        this.loaiSP = loaiSP;

    }

    public MatHang(int IdMatHang, String tenMH, String hang, String hinhAnh, int gia, int giaKhuyenMai, int soLuong, String chiTiet, LoaiSanPham loaiSP, int idBanHang) {
        this.idMatHang = IdMatHang;
        this.tenMH = tenMH;
        this.hang = hang;
        this.hinhAnh = hinhAnh;
        this.gia = gia;
        this.giaKhuyenMai = giaKhuyenMai;
        this.soLuong = soLuong;
        this.chiTiet = chiTiet;
        this.loaiSP = loaiSP;

    }
    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public int getIdMatHang() {
        return idMatHang;
    }

    public void setIdMatHang(int IdMatHang) {
        this.idMatHang = IdMatHang;
    }

    public String getTenMH() {
        return tenMH;
    }

    public void setTenMH(String tenMH) {
        this.tenMH = tenMH;
    }

    public String getHang() {
        return hang;
    }

    public void setHang(String hang) {
        this.hang = hang;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public int getGiaKhuyenMai() {
        return giaKhuyenMai;
    }

    public void setGiaKhuyenMai(int giaKhuyenMai) {
        this.giaKhuyenMai = giaKhuyenMai;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getChiTiet() {
        return chiTiet;
    }

    public void setChiTiet(String chiTiet) {
        this.chiTiet = chiTiet;
    }

    public LoaiSanPham getLoaiSP() {
        return loaiSP;
    }

    public void setLoaiSP(LoaiSanPham loaiSP) {
        this.loaiSP = loaiSP;
    }


    public MatHang() {
    }

    public int getIdLoaiSanPham() {
        return idLoaiSanPham;
    }
    
    public void setIdLoaiSanPham(int idLoaiSanPham) {
        this.idLoaiSanPham = idLoaiSanPham;
    }
    
}
