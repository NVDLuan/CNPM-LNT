package com.cnpm.services;

import com.cnpm.pojos.Account;
import com.cnpm.pojos.GioHang;
import com.cnpm.pojos.MatHang;

import java.util.List;

public interface GioHangServices {
    boolean add(GioHang gioHang);
    boolean update(GioHang gioHang);
    boolean delete(int id);
    List<GioHang> get();
    int count();
    boolean addCountCart(int id);
    boolean truCountCart(int id);
}
