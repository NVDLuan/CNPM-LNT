/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.services.implement;

import com.cnpm.pojos.LoaiSanPham;
import com.cnpm.repository.LoaiSanPhamReponsitory;
import com.cnpm.services.LoaiSanPhamService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author ADMIN
 */
public class LoaiSanPhamserviceImpl implements LoaiSanPhamService{
    @Autowired
    private LoaiSanPhamReponsitory loaiSanPhamReponsitory;
    @Override
    public List<LoaiSanPham> getList() {
        return this.loaiSanPhamReponsitory.getList();
    }

    @Override
    public boolean add(LoaiSanPham lsp) {
        return this.loaiSanPhamReponsitory.add(lsp);
    }

    @Override
    public boolean delete(int id) {
        return this.loaiSanPhamReponsitory.delete(id);
    }
    
}
