package com.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "accounts")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Accounts implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    private String username;

    private String password;

    @Nationalized
    private String fullname;

    private String email;

    private String phone;

    private boolean gender;

    @Nationalized
    private String address;

    private String avatar;

    private boolean isAdmin;

    private boolean isDeleted;

    @OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
    private List<Orders> orders;
}