/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.repository.implement;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.cnpm.pojos.LoaiSanPham;
import com.cnpm.pojos.MatHang;
import com.cnpm.repository.LoaiSanPhamReponsitory;
import com.cnpm.repository.MatHangReponsitory;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
@Repository
@Transactional
public class MatHangReponsitoryImpl implements MatHangReponsitory {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private LoaiSanPhamReponsitory loaiSanPhamReponsitory;

    @Override
    public boolean add(MatHang mh) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Map result = this.cloudinary.uploader().upload(mh.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            mh.setHinhAnh((String) result.get("secure_url"));
            session.save(mh);
            return true;
        } catch (IOException ex) {
            Logger.getLogger(MatHangReponsitoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (HibernateException e) {
            System.err.println("== add mat hang ===");

        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        try{
            Session session = this.sessionFactory.getObject().getCurrentSession();
            MatHang mh = session.get(MatHang.class, id);
            session.delete(mh);

            return true;
        } catch (HibernateException e) {
            System.err.println(e.toString());
            return false;
        }
    }

    @Override
    public MatHang getOne(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(MatHang.class, id);
    }

    @Override
    public List<MatHang> getList(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<MatHang> query = builder.createQuery(MatHang.class);
        Root root = query.from(MatHang.class);
        query = query.select(root);

        if (!kw.isEmpty() && kw != null) {
            Predicate p = builder.like(root.get("tenMH").as(String.class),
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }
        Query q = session.createQuery(query);
        int max = 10;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        return q.getResultList();
    }

    @Override
    public List<MatHang> getListInLSP(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<MatHang> query = builder.createQuery(MatHang.class);
        Root root = query.from(MatHang.class);
        query = query.select(root);

        LoaiSanPham loaiSanPham = this.loaiSanPhamReponsitory.getOne(id);
        Predicate p = builder.equal(root.get("loaiSP").as(LoaiSanPham.class), loaiSanPham);
        query = query.where(p);

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<MatHang> getList(int count, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<MatHang> query = builder.createQuery(MatHang.class);
        Root root = query.from(MatHang.class);
        query = query.select(root);

        Query q = session.createQuery(query);
        q.setMaxResults(count);
        q.setFirstResult((page-1)*count);
        return q.getResultList();
    }

    @Override
    public List<MatHang> getList(int count, int page, String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<MatHang> query = builder.createQuery(MatHang.class);
        Root root = query.from(MatHang.class);
        query = query.select(root);

        if (!kw.isEmpty() && kw != null) {
            Predicate p = builder.like(root.get("tenMH").as(String.class),
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }
        Query q = session.createQuery(query);

        q.setMaxResults(count);
        q.setFirstResult((page - 1) * count);
        return q.getResultList();
    }

    @Override
    public boolean updateProduct(MatHang matHang) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        if(!matHang.getFile().isEmpty()) {
            try {
                Map result = this.cloudinary.uploader().upload(matHang.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                matHang.setHinhAnh((String) result.get("secure_url"));
                session.update(matHang);
                return true;
            } catch (IOException ex) {
                MatHang matHang1 = this.getOne(matHang.getIdMatHang());
            } catch (HibernateException e) {
                System.err.println("== update mat hang ===");

            }
        }
        else{
            try {
                MatHang matHang1 = this.getOne(matHang.getIdMatHang());
                matHang.setHinhAnh(matHang1.getHinhAnh());
                session.update(matHang);
                return true;
            }catch (HibernateException e){
                System.err.println(e.toString());
                return false;
            }
        }
        return false;
    }
    @Override
    public boolean giamsoluong(MatHang matHang, int count) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        matHang.setSoLuong(matHang.getSoLuong()-count);
        session.update(matHang);
        return true;
    }


}
