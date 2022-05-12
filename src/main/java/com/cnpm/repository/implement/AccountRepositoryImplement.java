/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.repository.implement;

import com.cnpm.pojos.Account;
import com.cnpm.repository.AccountRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ADMIN
 */
@Repository
@Transactional
public class AccountRepositoryImplement implements AccountRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public List<Account> getAccount(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery <Account> query= builder.createQuery(Account.class);
        Root root = query.from(Account.class);
        query= query.select(root);
        
        if(!username.isEmpty()){
            Predicate p = builder.equal(root.get("user").as(String.class), username.trim());
            query = query.where(p);
        }
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }



    @Override
    public boolean addAccount(Account acc) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(acc);
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
            Account acc = session.get(Account.class, id);
            session.delete(acc);
            return true;
        }catch (HibernateException e) {
            System.err.println(e.toString());
            return false;
        }
    }

    @Override
    public Account getUserById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        return session.get(Account.class, id);
    }


    @Override
    public List<Account> getListAccount() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Account");
        return q.getResultList();
    }
    
    
}
