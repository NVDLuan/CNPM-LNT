package com.cnpm.repository.implement;

import com.cnpm.javaUtils.PersonUsing;
import com.cnpm.pojos.Account;
import com.cnpm.pojos.GioHang;
import com.cnpm.pojos.MatHang;
import com.cnpm.repository.AccountRepository;
import com.cnpm.repository.GioHangRepository;
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
import java.util.List;

@Repository
@Transactional
public class GioHangRepositoryImpl implements GioHangRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private AccountRepository accountRepository;


    @Override
    public boolean add(GioHang gioHang) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String username = PersonUsing.getUser();
        List<Account> acc = this.accountRepository.getAccount(username);
        gioHang.setIdKhachHang(acc.get(0));
        if(this.isEmptyMatHang(gioHang.getIdMatHang())==null){
            gioHang.setSoLuong(1);
            session.save(gioHang);

        }
        else{
            GioHang g = this.isEmptyMatHang(gioHang.getIdMatHang());
            g.setSoLuong(g.getSoLuong()+1);
            session.update(g);
        }
        return true;
    }

    @Override
    public boolean update(GioHang gioHang) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        session.update(gioHang);
        return true;
    }

    @Override
    public boolean delete(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        GioHang gioHang = session.get(GioHang.class,id);
        session.delete(gioHang);
        return true;
    }

    @Override
    public List<GioHang> get() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder criteriaBuilder =session.getCriteriaBuilder();
        CriteriaQuery<GioHang> query = criteriaBuilder.createQuery(GioHang.class);
        Root root = query.from(GioHang.class);
        query = query.select(root);
        String username= PersonUsing.getUser();
        List<Account> accs = this.accountRepository.getAccount(username);
        Predicate p = criteriaBuilder.equal(root.get("idKhachHang").as(Account.class),accs.get(0) );
        query = query.where(p);
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public int count() {
        List<GioHang> gioHangs = this.get();
        if(gioHangs.isEmpty())return 0;
        //return gioHangs.size();
        int count =0;
        for(GioHang cart:gioHangs){
            count+=cart.getSoLuong();
        }
        return count;
    }

    @Override
    public GioHang isEmptyMatHang(MatHang matHang) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder criteriaBuilder =session.getCriteriaBuilder();
        CriteriaQuery<GioHang> query = criteriaBuilder.createQuery(GioHang.class);
        Root root = query.from(GioHang.class);
        query = query.select(root);
        String username= PersonUsing.getUser();
        List<Account> accs = this.accountRepository.getAccount(username);
        Predicate p = criteriaBuilder.equal(root.get("idKhachHang").as(Account.class),accs.get(0));
        Predicate p2 = criteriaBuilder.equal(root.get("idMatHang").as(MatHang.class),matHang);
        query = query.where(p);
        query = query.where(p2);
        Query q = session.createQuery(query);
        List<GioHang> gioHangs = q.getResultList();
        if(gioHangs.isEmpty()) return null;
        return gioHangs.get(0);
    }

    @Override
    public boolean addCountCart(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        GioHang gioHang = session.get(GioHang.class, id);
        gioHang.setSoLuong(gioHang.getSoLuong()+1);
        session.update(gioHang);
        return true;
    }

    @Override
    public boolean truCountCart(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        GioHang gioHang = session.get(GioHang.class, id);
        gioHang.setSoLuong(gioHang.getSoLuong()-1);
        session.update(gioHang);
        return true;
    }
}
