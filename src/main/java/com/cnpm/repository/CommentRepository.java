/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.repository;

import com.cnpm.pojos.Comment;

import com.cnpm.pojos.MatHang;

import java.util.List;

/**
 *
 * @author ACER
 */
public interface CommentRepository {
    Comment addComment(Comment c);
    List<Comment> getComment();
    boolean delete(int id);
    List<Comment> list(MatHang matHang, int page);
}
