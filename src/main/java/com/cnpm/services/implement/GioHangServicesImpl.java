package com.cnpm.services.implement;

import com.cnpm.pojos.GioHang;
import com.cnpm.repository.GioHangRepository;
import com.cnpm.services.AccountService;
import com.cnpm.services.GioHangServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GioHangServicesImpl implements GioHangServices {
    @Autowired
    private GioHangRepository gioHangRepository;
    @Autowired
    private AccountService accountService;
    @Override
    public boolean add(GioHang gioHang) {

        return this.gioHangRepository.add(gioHang, this.accountService.getProfile());
    }

    @Override
    public boolean update(GioHang gioHang) {
        return this.gioHangRepository.update(gioHang);
    }

    @Override
    public boolean delete(int id) {
        return this.gioHangRepository.delete(id);
    }

    @Override
    public List<GioHang> get() {
        return this.gioHangRepository.get();
    }

    @Override
    public int count() {
        return this.gioHangRepository.count();
    }

    @Override
    public boolean addCountCart(int id) {
        return this.gioHangRepository.addCountCart(id);
    }

    @Override
    public boolean truCountCart(int id) {
        return this.gioHangRepository.truCountCart(id);
    }
}
