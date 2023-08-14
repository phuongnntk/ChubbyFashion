package com.shop.api;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shop.constain.PTConstain;
import com.shop.dto.CartDetailDto;
import com.shop.dto.CartDto;
import com.shop.entity.OrderDetails;
import com.shop.entity.Orders;
import com.shop.repository.AccountsRepo;
import com.shop.repository.OrderDetailsRepo;
import com.shop.repository.OrdersRepo;
import com.shop.repository.ProductsRepo;
import com.shop.service.CartService;

@RestController
@RequestMapping("/api/cart")
public class CartApi {

	@Autowired
	CartService service;

	@Autowired
	AccountsRepo accRepo;

	@Autowired
	OrdersRepo orderRepo;

	@Autowired
	OrderDetailsRepo detailRepo;
	
	@Autowired
	ProductsRepo productRepo;

	// localhost:8080/api/cart/update?productId=...&quantity=...&isReplace=...
	@PostMapping("/update")
	public ResponseEntity<?> doPostUpdate(@RequestParam Integer productId, @RequestParam Integer quantity,
										  @RequestParam boolean isReplace, HttpSession session) {
		CartDto cart = (CartDto) session.getAttribute(PTConstain.SESSION_CART);
		service.updateCart(cart, productId, quantity, isReplace);
		session.setAttribute(PTConstain.SESSION_CART, cart);
		return ResponseEntity.ok(cart);
	}

	// localhost:8080/api/cart/update?productId=...&quantity=...&isReplace=...
	@SuppressWarnings("deprecation")
	@PostMapping("/checkout")
	@Transactional
	public ResponseEntity<?> doPostCheckout(@RequestParam String username, @RequestParam String address,
			 								@RequestParam String phone, HttpSession session) {
		boolean check = true;
		CartDto cart = (CartDto) session.getAttribute(PTConstain.SESSION_CART);
		
		Orders order = new Orders();
		
		order.setAccount(accRepo.getById(username));
		order.setAddress(address);
		order.setPhone(phone);
		order.setStatus(1);
		order.setCreateDate(LocalDate.now());
		order.setTotalPrice(cart.getTotalPrice());
		
		try {
			order = orderRepo.save(order);
			
			for (CartDetailDto detail : cart.getListDetail().values()) {
				OrderDetails orderDetail = new OrderDetails();
				orderDetail.setOrder(order);
				orderDetail.setProduct(productRepo.getById(detail.getProductId()));
				orderDetail.setQuantity(detail.getQuantity());
				orderDetail.setTotalPrice(detail.getPrice());
				
				detailRepo.save(orderDetail);
			}
			
		} catch (Exception e) {
			check = false;
		}
		
		session.setAttribute(PTConstain.SESSION_CART, new CartDto());
		return ResponseEntity.ok(check);
	}
	
}
