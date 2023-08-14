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

@WebFilter(urlPatterns = {"/checkout"})
public class CheckoutFilter extends HttpFilter {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		CartDto cart = (CartDto) request.getSession().getAttribute(PTConstain.SESSION_CART);
		if(cart.getListDetail().size() == 0) {
			String mess = "Please add 1 product into cart to check out!";
			response.sendRedirect(request.getSession().getAttribute("historyURI").toString() + "?error="+mess);
		}else chain.doFilter(request, response);
	}
}
