package com.pem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pem.service.ReportsService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/reports")
public class ReportsController {

	@Autowired
	private ReportsService reportsService;

	@GetMapping("/income")
	@ResponseBody
	public double getIncome(HttpSession session, @RequestParam int month, @RequestParam int year) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			throw new RuntimeException("User not logged in");
		}
		return reportsService.getIncome(email, month, year);
	}

	@GetMapping("/expense")
	@ResponseBody
	public double getExpense(HttpSession session, @RequestParam int month, @RequestParam int year) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			throw new RuntimeException("User not logged in");
		}
		return reportsService.getExpense(email, month, year);
	}

	@GetMapping("/borrowedRemaining")
	@ResponseBody
	public Double getBorrowedRemaining(HttpSession session, @RequestParam int month, @RequestParam int year) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			throw new RuntimeException("User not logged in");
		}
		return reportsService.getBorrowedRemaining(email, month, year);
	}

}
