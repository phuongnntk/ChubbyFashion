package com.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

	@GetMapping("/about")
	public String getAbout() {
		return "about";
	}

	@GetMapping("/contact")
	public String getContact() {
		return "contact";
	}
}
