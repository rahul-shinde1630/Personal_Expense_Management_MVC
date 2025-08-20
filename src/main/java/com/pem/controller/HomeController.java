package com.pem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/homePage")
	public String loginPage() {
		return "index";
	}

	@GetMapping("/editExpence")
	public String editExpense() {
		return "addExpense";
	}

}
