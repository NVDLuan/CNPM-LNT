/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cnpm.pojos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ACER
 */
@Entity
@Table(name = "comment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comment.findAll", query = "SELECT c FROM Comment c"),
    @NamedQuery(name = "Comment.findByIdComment", query = "SELECT c FROM Comment c WHERE c.idComment = :idComment"),
    @NamedQuery(name = "Comment.findByContent", query = "SELECT c FROM Comment c WHERE c.content = :content")})
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdComment")
    private Integer idComment;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "content")
    private String content;
    @JoinColumn(name = "IdAccount", referencedColumnName = "IdAccount")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Account idAccount;
    @JoinColumn(name = "IDMatHang", referencedColumnName = "IDMatHang")
    @ManyToOne(optional = false)
    @JsonIgnore
    private MatHang iDMatHang;
    @Column(name = "created_date")
    private Date createdDate;

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public Comment() {
    }

    public Comment(Integer idComment) {
        this.idComment = idComment;
    }

    public Comment(Integer idComment, String content) {
        this.idComment = idComment;
        this.content = content;
    }

    public Integer getIdComment() {
        return idComment;
    }

    public void setIdComment(Integer idComment) {
        this.idComment = idComment;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Account getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(Account idAccount) {
        this.idAccount = idAccount;
    }

    public MatHang getIDMatHang() {
        return iDMatHang;
    }

    public void setIDMatHang(MatHang iDMatHang) {
        this.iDMatHang = iDMatHang;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idComment != null ? idComment.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.idComment == null && other.idComment != null) || (this.idComment != null && !this.idComment.equals(other.idComment))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.cnpm.pojos.Comment[ idComment=" + idComment + " ]";
    }

    public void getCreatedDate(Date date) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
