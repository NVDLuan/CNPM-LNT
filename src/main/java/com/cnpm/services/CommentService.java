/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.services;

import com.cnpm.pojos.Comment;
import com.cnpm.pojos.MatHang;

import java.util.List;

/**
 *
 * @author ACER
 */
public interface CommentService {
    Comment addComment(String content, int MatHangId);
    List<Comment> list(int matHang, int page);
}
