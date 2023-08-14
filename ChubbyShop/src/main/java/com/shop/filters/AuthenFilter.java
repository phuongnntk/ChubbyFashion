package com.shop.filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.entity.Accounts;

@WebFilter(urlPatterns = "/admin/*")
public class AuthenFilter extends HttpFilter {
	
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		Accounts account = (Accounts) request.getSession().getAttribute("account");
		if(account == null || !account.isAdmin()) {
			String mess = "Please login with admin role to use this function!";
			response.sendRedirect(request.getSession().getAttribute("historyURI").toString() + "?error="+mess);
		}
		chain.doFilter(request, response);
		
	}
}
