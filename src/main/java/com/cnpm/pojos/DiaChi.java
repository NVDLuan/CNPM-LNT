package com.cnpm.pojos;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "diachi")
public class DiaChi implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IdAddress")
    private int id;
    @Column(name="Address")
    private String address;
    @JoinColumn(name="IdAccount")
    @ManyToOne(fetch = FetchType.LAZY)
    private Account account;
    private String name;
    private String phone;


    public DiaChi() {
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
