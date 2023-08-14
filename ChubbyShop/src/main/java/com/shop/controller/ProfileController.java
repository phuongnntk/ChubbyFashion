package com.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.entity.Accounts;
import com.shop.repository.AccountsRepo;

@Controller
public class ProfileController {

	@Autowired
	HttpSession session;

	@Autowired
	AccountsRepo repo;

	@GetMapping("/profile")
	public String doGetProfile() {
		return "profile";
	}

	@GetMapping("/edit_profile")
	public String doGetEditProfile() {
		return "edit_profile";
	}

	@SuppressWarnings("resource")
	@PostMapping("/edit_profile")
	public String doPostEditProfile(@RequestParam MultipartFile avatar, Model model, HttpServletRequest req)
			throws IOException, IllegalAccessException, InvocationTargetException {
		Accounts account = (Accounts) session.getAttribute("account");
		BeanUtils.populate(account, req.getParameterMap());
		if (!avatar.isEmpty()) {
			String path = "src/main/resources/static/avatar/" + account.getUsername() + ".jpg";
			File file = new File(path);
			FileOutputStream fileOutput = new FileOutputStream(file);
			fileOutput.write(avatar.getBytes());
		}
		try {
			account = repo.save(account);
			session.setAttribute("account", account);
			model.addAttribute("success", "Cập nhật thành công");
		} catch (Exception e) {
			model.addAttribute("error", "Cập nhật thất bại");
		}
		return "redirect:/profile";
	}

	@GetMapping("/change_password")
	public String doGetChangePass() {
		return "change_password";
	}

	@PostMapping("/change_password")
	public String doPostChangePass(@RequestParam String password, @RequestParam String newpassword,@RequestParam String newconfirm, Model model)
			throws IllegalAccessException, InvocationTargetException {
		Accounts account = (Accounts) session.getAttribute("account");
		if (!account.getPassword().equals(password)) {
			model.addAttribute("error", "Mật khẩu không đúng");
		} else if (password.equals(newpassword)) {
			model.addAttribute("error", "Mật khẩu mới không được trùng!");
		} else if (!newpassword.equals(newconfirm)) {
			model.addAttribute("error", "Xác nhận mật khẩu mới không trùng khớp!");
		} else {
			account.setPassword(newpassword);
		}
		try {
			account = repo.save(account);
			model.addAttribute("message", "Đổi mật khẩu thành công");
			session.setAttribute("account", account);
		} catch (Exception e) {
			model.addAttribute("message", "Đổi mật khẩu thất bại");
		}
		return "redirect:/profile";
	}
}
