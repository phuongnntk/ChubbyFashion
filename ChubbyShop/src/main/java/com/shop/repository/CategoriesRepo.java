package com.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shop.entity.Categories;

@Repository
public interface CategoriesRepo extends JpaRepository<Categories, Integer>{
	Categories findByName(String name);
	
	List<Categories> findByIsMale(boolean gender);
}
