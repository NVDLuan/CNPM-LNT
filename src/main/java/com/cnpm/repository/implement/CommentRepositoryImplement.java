/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.repository.implement;

import com.cnpm.pojos.Comment;
import com.cnpm.repository.CommentRepository;
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
    
}
