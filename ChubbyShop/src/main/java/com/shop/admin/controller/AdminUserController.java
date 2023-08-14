package com.shop.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.repository.AccountsRepo;

@Controller
public class AdminUserController {

	@Autowired
	HttpSession session;

	@Autowired
	AccountsRepo repo;

	@GetMapping("/admin/users-list")
	public String doGetUsersList(Model model) {
		model.addAttribute("users", repo.findAll());
		return "admin/admin_user_list";
	}

	@GetMapping("/admin/add-user")
	public String doGetAddUser(Model model) {
		return "admin/admin_add_user";
	}

	@GetMapping("/admin/edit-user")
	public String doGetEditUser(@RequestParam Integer productId, Model model) {
		return "admin/admin_edit_product";
	}
	
	@SuppressWarnings("resource")
	@PostMapping("/admin/add-user")
	public String doPostAddUser(Model model, HttpServletRequest req) {
		
		return "admin/admin_add_product";
	}
}
