package com.shop.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.Accounts;
import com.shop.entity.Orders;
import com.shop.repository.OrdersRepo;

@Controller
public class CartController {

	@Autowired
	OrdersRepo repo;
	
	
	@GetMapping("/cart")
	public String getCart() {
		return "cart";
	}
	
	@GetMapping("/checkout")
	public String getCheckout() {
		return "checkout";
	}

	@GetMapping("/order_status")
	public String getStatusOrder(@RequestParam Optional<Integer> page, Model model, HttpSession session) {
		
		int p = 0;
		if(page.isPresent()) {
			p = page.get();
		}
	    Pageable pageable = null;
	    pageable = PageRequest.of(p, 5, Sort.by("status").ascending());
	    
		Accounts account = (Accounts) session.getAttribute("account");
		Page<Orders> order = repo.findByAccountUsername(account.getUsername(), pageable);
		
		model.addAttribute("order",order);
		
		return "order_status";
	}
}
