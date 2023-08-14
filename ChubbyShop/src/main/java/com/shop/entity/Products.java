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
@Table(name = "products")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Products implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Nationalized
    private String name;

    private String slug;

    @Nationalized
    private String description;

    private Double price;

    private Integer quantity;

    private LocalDate createDate;

    private String thumbnail;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Categories category;
//
//	@OneToMany(mappedBy = "product")
//	private List<OrderDetails> orderDetails;

    @OneToMany(mappedBy = "product")
    private List<ProductColor> colors;

}
