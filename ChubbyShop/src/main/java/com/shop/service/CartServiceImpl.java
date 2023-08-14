package com.shop.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dto.CartDetailDto;
import com.shop.dto.CartDto;
import com.shop.entity.Products;
import com.shop.repository.ProductsRepo;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	ProductsRepo repo;
	
	@Override
	public CartDto updateCart(CartDto cart, Integer productId, Integer quantity, boolean isReplace) {
		Products product = repo.findById(productId).get();
		
		HashMap<Integer, CartDetailDto> listDetail = cart.getListDetail();
		
		// Add new product
		if(!listDetail.containsKey(productId)) {
			
			CartDetailDto detail = new CartDetailDto();
			detail.setProductId(product.getId());
			detail.setCateId(product.getCategory().getId());
			detail.setName(product.getName());
			detail.setSlug(product.getSlug());
			detail.setQuantity(quantity);
			detail.setImage(product.getThumbnail());
			detail.setPrice(quantity * product.getPrice());
			
			listDetail.put(productId, detail);
		}else if(quantity > 0) {
			if(isReplace) { // Replace quantity cart
				listDetail.get(productId).setQuantity(quantity);
				listDetail.get(productId).setPrice(quantity*product.getPrice());
			}else { // Add 1 quantity into productQuantity
				Integer oldQuantity = listDetail.get(productId).getQuantity();
				Integer newQuantity = oldQuantity + quantity;
				Double newPrice = newQuantity * product.getPrice();
				listDetail.get(productId).setQuantity(newQuantity);
				listDetail.get(productId).setPrice(newPrice);
			}
		}else {
			listDetail.remove(productId);
		}

		cart.setTotalQuantity(getTotalQuantity(cart));
		cart.setTotalPrice(getTotalPrice(cart));
		return cart;
	}

	@Override
	public Integer getTotalQuantity(CartDto cart) {
		Integer totalQuantity = 0;
		HashMap<Integer, CartDetailDto> listDetail = cart.getListDetail();
		for (CartDetailDto detail : listDetail.values()) {
			totalQuantity += detail.getQuantity();
		}
		return totalQuantity;
	}

	@Override
	public Double getTotalPrice(CartDto cart) {
		Double totalPrice = 0D;
		HashMap<Integer, CartDetailDto> listDetail = cart.getListDetail();
		for (CartDetailDto detail : listDetail.values()) {
			totalPrice += detail.getPrice();
		}
		return totalPrice;
	}

}
