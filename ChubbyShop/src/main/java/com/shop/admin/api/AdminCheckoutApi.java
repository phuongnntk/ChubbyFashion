package com.shop.admin.api;

import com.shop.repository.OrdersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shop.entity.OrderDetails;
import com.shop.entity.Orders;
import com.shop.entity.Products;
import com.shop.repository.OrdersRepo;
import com.shop.repository.ProductsRepo;

@RestController
public class AdminCheckoutApi {

	@Autowired
	OrdersRepo repo;

	@Autowired
	ProductsRepo repo1;

	@PostMapping("/admin/confirm-order")
	@SuppressWarnings("deprecation")
	public ResponseEntity<?> doPostUpdate(@RequestParam Integer orderId) {

		if (orderId != null) {
			Orders order = repo.getById(orderId);
			for (OrderDetails detail : order.getOrderDetails()) {
				Products prod = detail.getProduct();
				prod.setQuantity(prod.getQuantity() - detail.getQuantity());
				repo1.save(prod);
			}
			order.setStatus(2);
			repo.save(order);
			return new ResponseEntity<>(HttpStatus.OK);
		} else
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@SuppressWarnings("deprecation")
	@PostMapping("/admin/confirm-ship")
	public ResponseEntity<?> doPostShipConfirm(@RequestParam Integer orderId) {

		if (orderId != null) {
			Orders order = repo.getById(orderId);
			order.setStatus(3);
			repo.save(order);
			return new ResponseEntity<>(HttpStatus.OK);
		} else
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	@SuppressWarnings("deprecation")
	@PostMapping("/admin/delete-order")
	public ResponseEntity<?> doDeleteOrder(@RequestParam Integer orderId) {
		if (orderId != null) {
			Orders order = repo.getById(orderId);
			order.setStatus(0);
			repo.save(order);
			return new ResponseEntity<>(HttpStatus.OK);
		} else
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
