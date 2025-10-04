package com.pem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pem.dto.bank.BankDto;
import com.pem.dto.category.CategoryDto;
import com.pem.dto.income.IncomeForecastResponseDto;
import com.pem.dto.income.IncomeRequestDto;
import com.pem.dto.income.IncomeResponseDto;
import com.pem.service.BankService;
import com.pem.service.CategoryService;
import com.pem.service.IncomeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class IncomeController {

	@Autowired
	private IncomeService incomeService;
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private BankService bankService;

	@GetMapping("/income")
	public String getAddBudgetPage(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "login";
		}
		model.addAttribute("categories", categoryService.getCategoriesByType(email, "Income"));
		model.addAttribute("banks", bankService.getAllBanks(email));

		return "Income/addIncome";
	}

	@PostMapping("/addIncomes")
	public String addIncome(@ModelAttribute IncomeRequestDto dto, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");

		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		dto.setUser(email);
		if (dto.getNewCategory() != null && !dto.getNewCategory().isBlank()) {
			categoryService.saveIncomeCategory(dto.getNewCategory(), email);
			dto.setCategory(dto.getNewCategory());
		}

		if (dto.getNewAccount() != null && !dto.getNewAccount().isBlank()) {
			bankService.saveBank(dto.getNewAccount(), email);
			dto.setAccount(dto.getNewAccount());
		}

		boolean isSaved = incomeService.saveIncome(dto);
		model.addAttribute(isSaved ? "successMsg" : "errMsg", isSaved ? "Successfully Added!" : "Fill All Info");

		model.addAttribute("categoryList", categoryService.getCategoriesByType(email, "Income"));
		model.addAttribute("bankList", bankService.getAllBanks(email));

		return "redirect:/income";
	}

	@GetMapping("/incomes")
	public String showIncome(@RequestParam(value = "filterType", required = false) String filterType,
			@RequestParam(value = "filterValue", required = false) String filterValue,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size, HttpSession session, Model model) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		Page<IncomeResponseDto> incomePage;

		if ("date-ranges".equalsIgnoreCase(filterType) && filterValue != null && !filterValue.isEmpty()) {
			String[] parts = filterValue.split("_");
			String start = parts[0];
			String end = parts[1];
			incomePage = incomeService.getIncomesBetweenDates(email, start, end, page, size);

		} else if (filterType != null && !filterType.isEmpty()) {
			incomePage = incomeService.getFilteredIncomesFromAPI(email, filterType, filterValue, page, size);

		} else {
			incomePage = incomeService.getAllIncome(email, page, size);
		}

		model.addAttribute("incomes", incomePage.getContent());
		model.addAttribute("currentPage", incomePage.getNumber());
		model.addAttribute("totalPages", incomePage.getTotalPages());
		model.addAttribute("size", incomePage.getSize());

		model.addAttribute("filterType", filterType);
		model.addAttribute("filterValue", filterValue);
		model.addAttribute("email", email);

		return "Income/incomeList";
	}

	@GetMapping("/editIncome")
	public String editIncome(@RequestParam Long id, Model model, HttpSession session) {
		String userEmail = (String) session.getAttribute("email");

		if (userEmail == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		IncomeResponseDto income = incomeService.getById(id);

		List<BankDto> banks = bankService.getBanksByUser(userEmail);
		List<CategoryDto> categories = categoryService.getCategoriesByUser(userEmail);

		model.addAttribute("income", income);
		model.addAttribute("banks", banks);
		model.addAttribute("categories", categories);

		return "Income/update-income";
	}

	@PostMapping("/updateIncome")
	public String updateIncome(@ModelAttribute IncomeRequestDto dto, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");

		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		dto.setUser(email);
		boolean updated = incomeService.updateIncome(dto);

		if (updated) {
			model.addAttribute("msg", "Income updated successfully!");
			return "redirect:/incomes";
		} else {
			model.addAttribute("msg", "Update failed!");
			return "redirect:/incomes";
		}
	}

	@GetMapping("/deleteIncome")
	public String deleteIncome(@RequestParam Long id, HttpSession session) {
		incomeService.delete(id);
		return "redirect:/incomes";
	}

	@GetMapping("/forecast")
	public String showIncomeForecast(Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");

		IncomeForecastResponseDto forecast = incomeService.forecastIncome(email, 6);

		model.addAttribute("incomeForecast", forecast);
		return "Income/incomeForecast"; // JSP page
	}

}
