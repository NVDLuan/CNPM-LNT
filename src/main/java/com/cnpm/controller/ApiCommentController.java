/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.controller;

import com.cnpm.pojos.Comment;
import com.cnpm.services.CommentService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ACER
 */
@RestController
public class ApiCommentController {
    @Autowired
    private CommentService commentService;
    
    @PostMapping(path ="/api/add-comment", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params){
        try{
            String content = params.get("content");
            int MatHangId = Integer.parseInt(params.get("idMatHang"));
            System.err.println("==fixbug===");
            System.err.println(content);
            Comment c = this.commentService.addComment(content, MatHangId);
            return new ResponseEntity<>(c, HttpStatus.CREATED);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }   
}
