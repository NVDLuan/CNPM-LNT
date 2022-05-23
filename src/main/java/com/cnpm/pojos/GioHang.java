/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.pojos;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name="giohang")
public class GioHang implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IdGioHang")
    private int idGioHang;
    @JoinColumn (name="IdKhach")
    @ManyToOne
    private Account idKhachHang;
    @JoinColumn(name="IDMatHang")
    @ManyToOne(fetch =FetchType.EAGER)
    private MatHang idMatHang;
    @Column(name="SoLuong")
    private int soLuong;

    public int getIdGioHang() {
        return idGioHang;
    }

    public void setIdGioHang(int idGioHang) {
        this.idGioHang = idGioHang;
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

    public GioHang(Account idKhachHang, MatHang idMatHang, int soLuong) {
        this.idKhachHang = idKhachHang;
        this.idMatHang = idMatHang;
        this.soLuong = soLuong;
    }

    public GioHang() {
    }
    @Override
    public String toString() {
        return "GioHang{" +
                "idGioHang=" + idGioHang +
                ", idKhachHang=" + idKhachHang +
                ", idMatHang=" + idMatHang +
                ", soLuong=" + soLuong +
                '}';
    }
    
}
