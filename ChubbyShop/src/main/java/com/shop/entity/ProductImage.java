package com.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "product_image")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductImage implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String image;

    private Integer colorId;
}
