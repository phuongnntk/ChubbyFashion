package com.shop.filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.entity.Accounts;

@WebFilter(urlPatterns = {"/profile", "/change_password", "/edit_profile"})
public class AdminFilter extends HttpFilter {
	
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		Accounts account = (Accounts) request.getSession().getAttribute("account");
		if(account == null) {
			String mess = "Please login to use this function!";
			response.sendRedirect(request.getSession().getAttribute("historyURI").toString() + "?error="+mess);
		}
		chain.doFilter(request, response);
		
	}
}
