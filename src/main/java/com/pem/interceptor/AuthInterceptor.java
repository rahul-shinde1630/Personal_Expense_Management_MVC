package com.pem.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String uri = request.getRequestURI();

		// Allow public pages and resources
		if (uri.contains("/login") || uri.contains("/signup") || uri.contains("/resources/")) {
			return true;
		}

		// Check session
		Object email = request.getSession().getAttribute("email");
		if (email != null) {
			// Prevent caching of secured pages
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
			response.setHeader("Pragma", "no-cache"); // HTTP 1.0
			response.setDateHeader("Expires", 0); // Proxies
			return true;
		}

		// Session missing → redirect to login
		response.sendRedirect(request.getContextPath() + "/login?logout=true");
		return false;
	}
}
