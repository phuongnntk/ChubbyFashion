package com.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shop.entity.ProductColor;

@Repository
public interface ProductColorRepo extends JpaRepository<ProductColor, Integer>{

}
