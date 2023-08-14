package com.shop.filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.constain.PTConstain;
import com.shop.dto.CartDto;


@WebFilter(urlPatterns = "/*")
public class CartFilter extends HttpFilter {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(request.getSession().getAttribute(PTConstain.SESSION_CART) == null) {
			request.getSession().setAttribute(PTConstain.SESSION_CART, new CartDto());
		}
		chain.doFilter(request, response);
		
	}
}
