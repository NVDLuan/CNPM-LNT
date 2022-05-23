/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.services.implement;

import com.cnpm.javaUtils.PersonUsing;
import com.cnpm.pojos.Account;
import com.cnpm.pojos.Comment;
import com.cnpm.pojos.MatHang;
import com.cnpm.repository.AccountRepository;
import com.cnpm.repository.CommentRepository;
import com.cnpm.repository.MatHangReponsitory;
import com.cnpm.services.CommentService;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ACER
 */
@Service
public class CommentServiceImplement implements CommentService{
    @Autowired
    private MatHangReponsitory matHangReponsitory;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private CommentRepository commentRepository;
    @Override
    public Comment addComment(String content, int MatHangId) {
        MatHang h = this.matHangReponsitory.getOne(MatHangId);
        Account a = this.accountRepository.getProfile();
        Comment c = new Comment();
        c.setContent(content);
        c.setIDMatHang(h);
        c.setIdAccount(a);
        c.setCreatedDate(new Date());
        Date d = new Date();
        System.err.println("=== DEBUG ===");
        System.err.println(d.toString());

        return this.commentRepository.addComment(c);
    }
    @Override
    public List<Comment> getComment() {
        return this.commentRepository.getComment();
    }

    @Override
    public boolean delete(int id) {
        return this.commentRepository.delete(id);
    }
    @Override
    public List<Comment> list(int matHang, int page) {
        return this.commentRepository.list(this.matHangReponsitory.getOne(matHang), page);
    }

}
