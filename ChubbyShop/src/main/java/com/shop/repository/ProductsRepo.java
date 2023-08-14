package com.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.shop.entity.Products;

@Repository
public interface ProductsRepo extends JpaRepository<Products, Integer>{
	Products findBySlug(String slug);

	List<Products> findByCategoryIsMale(boolean gender);

	List<Products> findByCategoryId(Integer categoryId , Sort sort);


	Page<Products> findAll(Pageable pageable);

	Page<Products> findByCategoryId(Integer categoryId, Pageable pageable);
	
}
