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

import com.pem.dto.budget.BudgetRequestDto;
import com.pem.dto.budget.BudgetResponseDto;
import com.pem.service.BudgetService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BudgetController {

	@Autowired
	private BudgetService budgetService;

	@GetMapping("/addBudget")
	public String getAddBudgetPage() {
		return "Budget/budget";
	}

	@PostMapping("/addBudgets")
	public String addBudget(@ModelAttribute BudgetRequestDto dto, HttpSession session, Model model) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		dto.setUser(email);
		boolean result = budgetService.saveBudget(dto);

		if (result) {
			model.addAttribute("successMsg", "Budget created successfully!");
		} else {
			model.addAttribute("errMsg", " Failed to create budget. Please check the input.");
		}

		return "Budget/budget";
	}

	@GetMapping("/viewBudget")
	public String viewBudgets(@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size, HttpSession session, Model model) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		int pageIndex = Math.max(page - 1, 0);
		int pageSize = Math.max(size, 1);

		// Only filter by category now
		Page<BudgetResponseDto> budgetsPage = budgetService.filterBudgetsByCategory(email, category, pageIndex,
				pageSize);

		List<String> categories = budgetService.getCategoriesByUser(email);

		model.addAttribute("budgets", budgetsPage.getContent());
		model.addAttribute("categories", categories);
		model.addAttribute("currentPage", page); // 1-based for UI
		model.addAttribute("totalPages", budgetsPage.getTotalPages());
		model.addAttribute("pageSize", pageSize);

		return "Budget/budget_list";
	}

	@GetMapping("/editBudget")
	public String editBudget(@RequestParam("id") Long id, Model model) {
		BudgetResponseDto dto = budgetService.getBudgetById(id);
		model.addAttribute("budgetDto", dto);
		return "Budget/edit_budget";
	}

	@PostMapping("/updateBudget")
	public String updateBudget(@ModelAttribute BudgetRequestDto dto, Model model, HttpSession session) {
		dto.setUser((String) session.getAttribute("email"));
		boolean result = budgetService.updateBudget(dto);

		if (result) {
			model.addAttribute("successMsg", "Budget updated successfully!");
		} else {
			model.addAttribute("errMsg", "Failed to update budget.");
		}

		return "redirect:/viewBudget";
	}

	@GetMapping("/deleteBudget")
	public String deleteBudget(@RequestParam("id") Long id, Model model) {
		boolean result = budgetService.deleteBudget(id);
		if (result) {
			model.addAttribute("successMsg", "Deleted!");
		} else {
			model.addAttribute("errMsg", "Delete failed.");
		}
		return "redirect:/viewBudget";
	}

}
