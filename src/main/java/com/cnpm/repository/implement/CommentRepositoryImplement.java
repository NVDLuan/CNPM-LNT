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
    
}
