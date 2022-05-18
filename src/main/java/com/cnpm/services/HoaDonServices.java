package com.cnpm.services;

import com.cnpm.pojos.GioHang;
import com.cnpm.pojos.HoaDon;
import com.cnpm.pojos.MatHang;

import java.util.List;

public interface HoaDonServices {
    boolean add(HoaDon hoaDon);
    boolean delete(int idHoaDon);
    HoaDon getOne(int id);
    List<HoaDon> getList();
    boolean update(HoaDon hoaDon);
    boolean thanhtoan(List<GioHang> gioHangList, HoaDon hoaDon);
    boolean thanhtoan(MatHang matHang, HoaDon hoaDon);
}
