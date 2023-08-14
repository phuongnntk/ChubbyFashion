package com.shop.dto;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDetailDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer orderId;

	private Integer productId;
	
	private Integer cateId;
	
	private Double price;

	private Integer quantity;
	
	private String name;
	
	private String slug;
	
	private String image;
}
