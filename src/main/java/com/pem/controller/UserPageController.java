package com.pem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserPageController {

	@GetMapping("/")
	public String loginPage() {

		return "login";
	}

	@GetMapping("/login")
	public String getLoginPage() {

		return "login";
	}

	@GetMapping("/signup")
	public String getSignUpPage() {
		return "User/signup";
	}

	@GetMapping("/reset")
	public String getResetPage() {
		return "User/reset";
	}
}