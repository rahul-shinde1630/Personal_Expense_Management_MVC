package com.pem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pem.dto.lentmoney.LentMoneyRequestDto;
import com.pem.dto.lentmoney.LentMoneyResponseDto;
import com.pem.service.LentMoneyService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LentMoneyController {

	@Autowired
	private LentMoneyService lentMoneyService;

	@GetMapping("/add-lent")
	public String getPageLentMoney() {
		return "Lent/add-lentmoney";

	}

	@PostMapping("/addLentMoney")
	public String addLentMoney(@ModelAttribute LentMoneyRequestDto dto, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		dto.setUser(email);
		boolean result = lentMoneyService.save(dto);

		if (result) {
			model.addAttribute("successMsg", "Lent Money record added successfully!");
		} else {
			model.addAttribute("errMsg", "Failed to add Lent Money record. Please try again.");
		}

		return "Lent/add-lentmoney";
	}

	@GetMapping("/show-lent")
	public String listLentMoney(HttpSession session, Model model, LentMoneyResponseDto dto) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}
		List<LentMoneyResponseDto> lentList = lentMoneyService.getByEmail(email);
		System.out.println(dto.getLentId());
		model.addAttribute("lentList", lentList);
		return "Lent/showLentMoney";
	}

	@GetMapping("/editLentMoney")
	public String showForm(@RequestParam("lentId") Long lentId, Model model) {
		LentMoneyRequestDto existing = lentMoneyService.getById(lentId);
		model.addAttribute("lentMoney", existing);
		return "Lent/updateLentMoney";
	}

	@PostMapping("/updateLentMoney")
	public String updateLentMoney(@ModelAttribute LentMoneyRequestDto dto, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		dto.setUser(email);
		boolean result = lentMoneyService.update(dto);

		if (result) {
			model.addAttribute("successMsg", "Lent Money updated successfully!");
		} else {
			model.addAttribute("errMsg", "Failed to update Lent Money.");
		}

		return "redirect:/show-lent";
	}

	@GetMapping("/delete/{lentId}")
	public String delete(@PathVariable Long lentId, @RequestParam("email") String email) {
		lentMoneyService.delete(lentId);
		return "redirect:/lentmoney/list?email=" + email;
	}
}
