package com.shop.admin.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.repository.OrdersRepo;

@Controller
public class AdminCheckoutController {

	@Autowired
	HttpSession session;

	@Autowired
	OrdersRepo repo;


	@GetMapping("/admin/checkout")
	public String doGetCheckout(@RequestParam Optional<Integer> page, Model model) {
		int p = 0;
		if(page.isPresent()) {
			p = page.get();
		}
	    Pageable pageable = null;
	    pageable = PageRequest.of(p, 5);
		
		model.addAttribute("orders", repo.findByStatus(1,pageable));
		
		return "admin/admin_checkout";
	}

	@GetMapping("/admin/ship")
	public String doGetShip(@RequestParam Optional<Integer> page, Model model) {
		int p = 0;
		if(page.isPresent()) {
			p = page.get();
		}
	    Pageable pageable = null;
	    pageable = PageRequest.of(p, 5);
		
		model.addAttribute("orders", repo.findByStatus(2,pageable));
		
		return "admin/admin_ship";
	}

	@GetMapping("/admin/order")
	public String doGetOrdersSuccess(@RequestParam Optional<Integer> page, Model model) {
		int p = 0;
		if(page.isPresent()) {
			p = page.get();
		}
	    Pageable pageable = null;
	    pageable = PageRequest.of(p, 5);
		
		model.addAttribute("orders", repo.findByStatus(3,pageable));
		
		return "admin/admin_order";
	}

	@GetMapping("/admin/cancel")
	public String doGetOrdersCancel(@RequestParam Optional<Integer> page, Model model) {
		int p = 0;
		if(page.isPresent()) {
			p = page.get();
		}
	    Pageable pageable = null;
	    pageable = PageRequest.of(p, 5);
		
		model.addAttribute("orders", repo.findByStatus(0,pageable));
		
		return "admin/admin_cancel";
	}
	
}
