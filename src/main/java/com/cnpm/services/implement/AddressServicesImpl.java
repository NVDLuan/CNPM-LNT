package com.cnpm.services.implement;

import com.cnpm.pojos.DiaChi;
import com.cnpm.repository.AddressRepository;
import com.cnpm.services.AddressServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServicesImpl implements AddressServices {
    @Autowired
    private AddressRepository addressRepository;

    @Override
    public List<DiaChi> listDiaChi() {
        try {
            List<DiaChi> list = this.addressRepository.listDiaChi();
            if (list == null) return null;
            return this.addressRepository.listDiaChi();
        }
        catch (Exception e){
            return null;
        }
    }

    @Override
    public DiaChi getOne(int id) {
        return  this.addressRepository.getOne(id);
    }

    @Override
    public boolean create(DiaChi diaChi) {
        return this.addressRepository.create(diaChi);
    }

    @Override
    public boolean update(DiaChi diaChi) {
        return this.addressRepository.update(diaChi);
    }

    @Override
    public boolean delete(int id) {
        return this.addressRepository.delete(id);
    }
}
