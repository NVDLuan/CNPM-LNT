/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.services;

import com.cnpm.pojos.LoaiSanPham;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface LoaiSanPhamService {
    List<LoaiSanPham> getList();
    boolean add(LoaiSanPham lsp);
    boolean delete(int id);
}
