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
    @JoinColumn(name="IdAccount")
    @ManyToOne(fetch = FetchType.LAZY)
    private Account account;
    private String name;
    private String phone;
    private String Tinh;
    private String Quan;
    private String Diachinha;

    public void setTinh(String Tinh) {
        this.Tinh = Tinh;
    }

    public void setQuan(String Quan) {
        this.Quan = Quan;
    }

    public void setDiachinha(String Diachinha) {
        this.Diachinha = Diachinha;
    }

    public String getTinh() {
        return Tinh;
    }

    public String getQuan() {
        return Quan;
    }

    public String getDiachinha() {
        return Diachinha;
    }

    public DiaChi(String Tinh, String Quan, String Diachinha) {
        this.Tinh = Tinh;
        this.Quan = Quan;
        this.Diachinha = Diachinha;
    }

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
