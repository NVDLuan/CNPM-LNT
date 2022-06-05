package com.cnpm.repository;

import com.cnpm.pojos.HoaDon;

import java.util.List;

public interface HoaDonRepository {
    boolean add(HoaDon hoaDon);
    boolean delete(int idHoaDon);
    HoaDon getOne(int id);
    List<HoaDon> getList();
    boolean update(HoaDon hoaDon);
    List<HoaDon> getListAdmin(int page);
    List<HoaDon> getnew();
    int getcountNew();
    boolean huydonhang(int id);
    boolean capnhat(int id);
}
