package com.cnpm.services.implement;

import com.cnpm.pojos.HoaDon;
import com.cnpm.repository.HoaDonRepository;
import com.cnpm.services.HoaDonServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonServicesImpl implements HoaDonServices {
    @Autowired
    private HoaDonRepository hoaDonRepository;
    @Override
    public boolean add(HoaDon hoaDon) {
        return this.hoaDonRepository.add(hoaDon);
    }

    @Override
    public boolean delete(int idHoaDon) {
        return this.hoaDonRepository.delete(idHoaDon);
    }

    @Override
    public HoaDon getOne(int id) {
        return this.hoaDonRepository.getOne(id);
    }

    @Override
    public List<HoaDon> getList() {
        return this.hoaDonRepository.getList();
    }

    @Override
    public boolean update(HoaDon hoaDon) {
        return this.hoaDonRepository.update(hoaDon);
    }
}
