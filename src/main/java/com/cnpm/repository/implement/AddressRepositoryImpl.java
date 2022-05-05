package com.cnpm.repository.implement;

import com.cnpm.javaUtils.PersonUsing;
import com.cnpm.pojos.Account;

import com.cnpm.pojos.DiaChi;
import com.cnpm.repository.AccountRepository;
import com.cnpm.repository.AddressRepository;
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
import java.util.List;

@Repository
@Transactional
public class AddressRepositoryImpl implements AddressRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private AccountRepository accountRepository;

    @Override
    public List<DiaChi> listDiaChi() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder criteriaBuilder =session.getCriteriaBuilder();
        CriteriaQuery<DiaChi> query = criteriaBuilder.createQuery(DiaChi.class);
        Root root = query.from(DiaChi.class);
        query = query.select(root);
        String username= PersonUsing.getUser();
        List<Account> accs = this.accountRepository.getAccount(username);
        Predicate p = criteriaBuilder.equal(root.get("account").as(Account.class),accs.get(0) );
        query = query.where(p);
        Query q = session.createQuery(query);
        List<DiaChi>list= q.getResultList();
        if(list.size()==0)return null;
        return list;
    }

    @Override
    public DiaChi getOne(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(DiaChi.class,id);
    }

    @Override
    public boolean create(DiaChi diaChi) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            String user = PersonUsing.getUser();
            List<Account> list = this.accountRepository.getAccount(user);
            diaChi.setAccount(list.get(0));
            session.save(diaChi);
            return true;
        }
        catch (HibernateException e){
            System.err.println("===Exception===" + e.toString() );
            return false;
        }
    }

    @Override
    public boolean update(DiaChi diaChi) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.update(diaChi);
            return true;
        }
        catch (HibernateException e){
            System.err.println("===Exception===" + e.toString() );
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            DiaChi diaChi = this.getOne(id);
            session.delete(diaChi);
            return true;
        }
        catch (HibernateException e){
            System.err.println("===Exception===" + e.toString() );
            return false;
        }
    }
}
