package com.cnpm.services.implement;

import com.cnpm.pojos.GioHang;
import com.cnpm.pojos.HoaDon;
import com.cnpm.pojos.MatHang;
import com.cnpm.repository.HoaDonRepository;
import com.cnpm.services.*;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service
public class HoaDonServicesImpl implements HoaDonServices {
    @Autowired
    private HoaDonRepository hoaDonRepository;
    @Autowired
    AddressServices addressServices;
    @Autowired
    private AccountService accountService;
    @Autowired
    private GioHangServices gioHangServices;
    @Autowired
    private MatHangService matHangService;
    @Override
    public boolean add(HoaDon hoaDon) {
        hoaDon.setDiaChi(this.addressServices.getOne(hoaDon.getIdAddress()));
        hoaDon.setIdKhachHang(this.accountService.getProfile());
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

    @Override
    public boolean thanhtoan(List<GioHang> gioHangList, HoaDon hoaDon) {
        try {
            for (GioHang e : gioHangList) {
                hoaDon.setSoLuong(e.getSoLuong());
                hoaDon.setTongTien(e.getIdMatHang().getGiaKhuyenMai() * hoaDon.getSoLuong());
                hoaDon.setTinhTrang("Đã đặt thành công");
                hoaDon.setIdMatHang(e.getIdMatHang());
                hoaDon.setGia(e.getIdMatHang().getGiaKhuyenMai());
                hoaDon.setDateDatHang(new Date());
                if(!this.add(hoaDon)){
                    return false;
                }
                this.gioHangServices.delete(e.getIdGioHang());
                this.matHangService.giamsoluong(hoaDon.getIdMatHang(), hoaDon.getSoLuong());

            }
            return true;
        }catch (HibernateException e){
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean thanhtoan(MatHang matHang, HoaDon hoaDon) {
        hoaDon.setSoLuong(1);
        hoaDon.setTinhTrang("Đã đặt thành công");
        hoaDon.setIdMatHang(matHang);
        hoaDon.setGia(matHang.getGiaKhuyenMai());
        hoaDon.setTongTien(matHang.getGiaKhuyenMai());
        hoaDon.setDateDatHang(new Date());
        if(this.add(hoaDon)) return true;
        return false;
    }

    @Override
    public List<HoaDon> getListAdmin(int page) {
        return this.hoaDonRepository.getListAdmin(page);
    }

    @Override
    public List<HoaDon> getnew() {
        return this.hoaDonRepository.getnew();
    }

    @Override
    public int getcountNew() {
        return this.hoaDonRepository.getcountNew();
    }

    @Override
    public boolean huydonhang(int id) {
        return this.hoaDonRepository.huydonhang(id);
    }

    @Override
    public boolean capnhat(int id) {
        return this.hoaDonRepository.capnhat(id);
    }
}
