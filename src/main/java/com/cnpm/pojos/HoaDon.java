/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.pojos;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name="hoadon")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IDHoaDon")
    private int idHoaDon;
    @JoinColumn (name="IDKhachHang")
    @ManyToOne
    private Account idKhachHang;
    @JoinColumn(name="IDMatHang")
    @ManyToOne
    private MatHang idMatHang;
    @Column(name="SoLuong")
    private int soLuong;
    @JoinColumn(name="diachi")
    @ManyToOne(fetch = FetchType.EAGER)
    private DiaChi diaChi;
    @Column(name="TongTien")
    private int tongTien;
    @Column(name="TinhTrang")
    private String tinhTrang;
    @Transient
    private int idAddress;
    private int gia;
    private Date dateDatHang;

    public Date getDateDatHang() {
        return dateDatHang;
    }

    public void setDateDatHang(Date dateDatHang) {
        this.dateDatHang = dateDatHang;
    }

    public int getGia() {
        return gia;
    }


    public void setGia(int gia) {
        this.gia = gia;
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    public DiaChi getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(DiaChi diaChi) {
        this.diaChi = diaChi;
    }

    public int getIdHoaDon() {
        return idHoaDon;
    }

    public void setIdHoaDon(int idHoaDon) {
        this.idHoaDon = idHoaDon;
    }

    public MatHang getIdMatHang() {
        return idMatHang;
    }

    public void setIdMatHang(MatHang idMatHang) {
        this.idMatHang = idMatHang;
    }

    public Account getIdKhachHang() {
        return idKhachHang;
    }

    public void setIdKhachHang(Account idKhachHang) {
        this.idKhachHang = idKhachHang;
    }



    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }



    public int getTongTien() {
        return tongTien;
    }

    public void setTongTien(int tongTien) {
        this.tongTien = tongTien;
    }

    public String getTinhTrang() {

        return tinhTrang;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public HoaDon() {
    }

    public HoaDon(Account idKhachHang, MatHang idMatHang, int soLuong, int tongTien, String tinhTrang) {
        this.idKhachHang = idKhachHang;
        this.idMatHang = idMatHang;
        this.soLuong = soLuong;
        this.tongTien = tongTien;
        this.tinhTrang = tinhTrang;
    }
}
