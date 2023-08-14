package com.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "orders")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Orders implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private LocalDate createDate;

    @Nationalized
    private String address;

    private String phone;

    private Integer status;

    private double totalPrice;

    @OneToMany(mappedBy = "order")
    private List<OrderDetails> orderDetails;

    @ManyToOne
    @JoinColumn(name="username")
    private Accounts account;
}
