package com.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shop.entity.ProductImage;

@Repository
public interface ProductImageRepo extends JpaRepository<ProductImage, Integer>{
}
