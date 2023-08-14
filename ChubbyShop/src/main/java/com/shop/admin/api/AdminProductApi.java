package com.shop.admin.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shop.repository.ProductsRepo;

@RestController
public class AdminProductApi {

	@Autowired
	ProductsRepo productRepo;
	
	@DeleteMapping("/admin/delete-product")
	public ResponseEntity<?> doPostUpdate(@RequestParam Integer productId) {
		productRepo.deleteById(productId);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
