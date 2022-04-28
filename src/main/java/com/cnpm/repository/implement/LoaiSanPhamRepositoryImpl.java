/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.repository.implement;

import com.cnpm.pojos.LoaiSanPham;
import com.cnpm.repository.LoaiSanPhamReponsitory;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

/**
 *
 * @author ADMIN
 */

@Repository
@Transactional
public class LoaiSanPhamRepositoryImpl implements LoaiSanPhamReponsitory{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<LoaiSanPham> getList() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From LoaiSanPham");
        return q.getResultList();
    }

    @Override
    public boolean add(LoaiSanPham lsp) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            
            session.save(lsp);
            return true;
        }
        catch( HibernateException e){
            System.err.println(e.toString());
            return false;
        }
        
    }

    @Override
    public boolean delete(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            LoaiSanPham lsp = session.get(LoaiSanPham.class, id);
            session.delete(lsp);
            return true;
        } catch (HibernateException e) {
            System.err.println(e.toString());
            return false;
        }
    }
    

    @Override
    public LoaiSanPham getOne(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(LoaiSanPham.class, id);
    }

}
