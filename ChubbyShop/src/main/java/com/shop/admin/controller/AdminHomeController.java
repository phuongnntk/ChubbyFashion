package com.shop.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.shop.repository.AccountsRepo;
import com.shop.repository.OrderDetailsRepo;
import com.shop.repository.OrdersRepo;
import com.shop.repository.ProductsRepo;

@Controller
public class AdminHomeController {

	@Autowired
	OrderDetailsRepo detailRepo;

	@Autowired
	OrdersRepo orderRepo;

	@Autowired
	AccountsRepo accRepo;
	
	@Autowired
	ProductsRepo prodRepo;
	
	@GetMapping("/admin/home")
	public String doGetHomeAdmin(Model model) {
		// Customer
		model.addAttribute("customer", accRepo.findByIsAdmin(false).size());
		// Total Waiting Confirm
		Pageable page = PageRequest.of(0, (int) orderRepo.count());
		model.addAttribute("totalOrderWaiting", orderRepo.findByStatus(1, page).getContent().size());
		// Total Waiting Cancel
		model.addAttribute("totalOrderCancel", orderRepo.findByStatus(0, page).getContent().size());
		// Total Waiting Success
		model.addAttribute("totalOrderSuccess", orderRepo.findByStatus(3, page).getContent().size());
		
		return "admin/admin_home";
	}
}
