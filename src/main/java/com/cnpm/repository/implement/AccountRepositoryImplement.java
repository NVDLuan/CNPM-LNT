/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.repository.implement;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.cnpm.javaUtils.PersonUsing;
import com.cnpm.pojos.Account;
import com.cnpm.repository.AccountRepository;

import java.io.IOException;
import java.util.List;
import java.util.Map;
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
    @Autowired
    private Cloudinary cloudinary;
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
            acc.setAvatar("");
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

    @Override
    public Account getProfile() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String user = PersonUsing.getUser();
        List<Account> accounts = this.getAccount(user);
        return accounts.get(0);
    }

    @Override
    public boolean updateAvatar(Account acc) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            Map result = null;
            result = this.cloudinary.uploader().upload(acc.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            acc.setAvatar((String) result.get("secure_url"));
            session.update(acc);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return false;
    }
    @Override
    public boolean updatepass(Account acc) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            session.update(acc);
            return true;
        }
        catch (HibernateException e){
            return false;
        }
    }
}
