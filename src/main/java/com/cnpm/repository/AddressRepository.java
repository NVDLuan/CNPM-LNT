package com.cnpm.repository;

import com.cnpm.pojos.DiaChi;

import java.util.List;

public interface AddressRepository {
    List<DiaChi> listDiaChi();
    DiaChi getOne(int id);
    boolean create(DiaChi diaChi);
    boolean update(DiaChi diaChi);
    boolean delete(int id);
}
