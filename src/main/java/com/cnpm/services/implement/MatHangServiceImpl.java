/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.services.implement;

import com.cnpm.pojos.MatHang;
import com.cnpm.repository.MatHangReponsitory;
import com.cnpm.services.MatHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * @author ADMIN
 */
@Service
public class MatHangServiceImpl implements MatHangService{
    @Autowired
    private MatHangReponsitory matHangRepository;
    @Override
    public boolean add(MatHang mh) {
        return this.matHangRepository.add(mh);
    }

    @Override
    public boolean delete(int id) {
        return this.matHangRepository.delete(id);
    }

    @Override
    public MatHang getOne(int id) {

        return this.matHangRepository.getOne(id);
    }

    @Override
    public List<MatHang> getList(String kw, int page) {
        return this.matHangRepository.getList(kw, page);
    }

    @Override
    public List<MatHang> getList(int count, int page) {
        return this.matHangRepository.getList(count,page);
    }

    @Override
    public List<MatHang> getListInLSP(int id) {
        return this.matHangRepository.getListInLSP(id);
    }

    @Override
    public List<MatHang> getList(int count, int page, String kw) {
        return this.matHangRepository.getList(count, page, kw);
    }

    @Override
    public boolean updateProduct(MatHang matHang) {
        return this.matHangRepository.updateProduct(matHang);
    }

    @Override
    public boolean giamsoluong(MatHang matHang, int count){
        return this.matHangRepository.giamsoluong(matHang,count);
    }

}
