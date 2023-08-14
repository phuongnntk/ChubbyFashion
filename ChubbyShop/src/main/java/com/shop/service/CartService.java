package com.shop.service;

import com.shop.dto.CartDto;

public interface CartService {

	public CartDto updateCart(CartDto cart, Integer productId, Integer quantity, boolean isReplace);
	
	public Integer getTotalQuantity(CartDto cart);
	
	public Double getTotalPrice(CartDto cart);
	
}
