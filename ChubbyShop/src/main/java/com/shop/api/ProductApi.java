package com.shop.api;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop.entity.ProductImage;
import com.shop.repository.ProductColorRepo;

@RestController
public class ProductApi {

	@Autowired
	ProductColorRepo repo;
	
	@PostMapping("/api/product-color/{colorId}")
	public ResponseEntity<List<ProductImage>> postColor(@PathVariable Optional<Integer> colorId) {
		List<ProductImage> images = repo.findById(colorId.orElse(0)).get().getImages();
		return new ResponseEntity<List<ProductImage>>(images, HttpStatus.OK);
	}
}
