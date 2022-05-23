/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.repository.implement;

import com.cnpm.pojos.Comment;
import com.cnpm.pojos.MatHang;
import com.cnpm.repository.CommentRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.*;
import java.util.List;

/**
 *
 * @author ACER
 */
@Repository
@Transactional
public class CommentRepositoryImplement implements CommentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public Comment addComment(Comment c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(c);
            
            return c;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Comment> getComment() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Comment");
        return q.getResultList();
    }


    @Override
    public boolean delete(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Comment comment = session.get(Comment.class, id);
            session.delete(comment);
            return true;
        } catch (HibernateException e) {
            System.err.println(e.toString());
            return false;
        }
    }

    public List<Comment> list(MatHang matHang, int page) {
        Session session= this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Comment> query = builder.createQuery(Comment.class);
        Root root = query.from(Comment.class);
        query = query.select(root);
        Predicate p = builder.equal(root.get("iDMatHang").as(MatHang.class), matHang);
        query=query.where(p);
        Order order = builder.desc(root.get("idComment").as(Integer.class));
        query = query.orderBy(order);
        Query q =session.createQuery(query);

        q.setMaxResults(5);
        q.setFirstResult((page)*5);

        if(!q.getResultList().isEmpty()) return q.getResultList();

        return null;
    }

}
