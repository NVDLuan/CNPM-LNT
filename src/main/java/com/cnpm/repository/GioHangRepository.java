package com.cnpm.repository;

import com.cnpm.pojos.Account;
import com.cnpm.pojos.GioHang;
import com.cnpm.pojos.MatHang;

import java.util.List;

public interface GioHangRepository {
    boolean add(GioHang gioHang, Account account);
    boolean update(GioHang gioHang);
    boolean delete(int id);
    List<GioHang> get();
    int count();
    GioHang isEmptyMatHang(MatHang matHang, Account account);
    boolean addCountCart(int id);
    boolean truCountCart(int id);
}
