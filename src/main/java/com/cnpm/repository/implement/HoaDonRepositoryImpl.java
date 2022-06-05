package com.cnpm.repository.implement;

import com.cnpm.javaUtils.PersonUsing;
import com.cnpm.pojos.Account;
import com.cnpm.pojos.HoaDon;
import com.cnpm.repository.AccountRepository;
import com.cnpm.repository.HoaDonRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.*;
import java.util.List;

@Repository
@Transactional
public class HoaDonRepositoryImpl implements HoaDonRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private AccountRepository accountRepository;

    @Override
    public boolean add(HoaDon hoaDon) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            session.save(hoaDon);
            return true;
        }catch (HibernateException e){
            System.err.println(e.toString());
            return false;
        }

    }

    @Override
    public boolean delete(int idHoaDon) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        HoaDon hoaDon =this.getOne(idHoaDon);
        session.delete(hoaDon);
        return false;
    }

    @Override
    public HoaDon getOne(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(HoaDon.class,id);
    }

    @Override

    public List<HoaDon> getList() {// day la hoa don cua nguoi dung
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery query = builder.createQuery(HoaDon.class);
        Root root = query.from(HoaDon.class);
        query = query.select(root);
        List<Account> acc = this.accountRepository.getAccount(PersonUsing.getUser());
        Predicate p = builder.equal(root.get("idKhachHang").as(Account.class),acc.get(0));
        query =query.where(p);
        Order order = builder.desc(root.get("idHoaDon").as(Integer.class));
        query = query.orderBy(order);
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean update(HoaDon hoaDon) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        session.update(hoaDon);
        return true;
    }

    @Override
    public List<HoaDon> getListAdmin(int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery query = builder.createQuery(HoaDon.class);
        Root root = query.from(HoaDon.class);
        Order order = builder.desc(root.get("idHoaDon").as(Integer.class));
        query = query.select(root).orderBy(order);
        Query q = session.createQuery(query);
        q.setMaxResults(20);
        q.setFirstResult(page*20);
        return q.getResultList();
    }

    @Override
    public List<HoaDon> getnew() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery query = builder.createQuery(HoaDon.class);
        Root root = query.from(HoaDon.class);
        Predicate p = builder.equal(root.get("tinhTrang").as(String.class), "Đã đặt thành công");
        Order order = builder.desc(root.get("idHoaDon").as(Integer.class));
        query = query.where(p);
        query= query.orderBy(order);
        Query q = session.createQuery(query);
        if(q.getResultList().isEmpty()) return null;
        return q.getResultList();
    }

    @Override
    public int getcountNew() {
        List<HoaDon> list = this.getnew();
        if(list==null) return 0;
        else return list.size();
    }

    @Override
    public boolean huydonhang(int id) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            HoaDon hoaDon = session.get(HoaDon.class, id);
            hoaDon.setTinhTrang("hủy");
            session.update(hoaDon);
            return true;
        }catch (HibernateException e){
            return false;
        }
    }

    @Override
    public boolean capnhat(int id) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            HoaDon hoaDon = session.get(HoaDon.class, id);
            hoaDon.setTinhTrang("Đã giao");
            session.update(hoaDon);
            return true;
        }catch (HibernateException e){
            return false;
        }
    }
}
