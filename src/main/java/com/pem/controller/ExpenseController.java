package com.pem.controller;

import java.time.LocalDate;
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
import com.pem.dto.expense.ExpenseAnalysisResponseDto;
import com.pem.dto.expense.ExpenseDto;
import com.pem.dto.expense.ExpenseRequestDto;
import com.pem.dto.expense.ExpenseResponseDto;
import com.pem.dto.expense.UpdateExpenseDto;
import com.pem.service.BankService;
import com.pem.service.CategoryService;
import com.pem.service.ExpenseService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ExpenseController {

	@Autowired
	private ExpenseService expenseService;
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private BankService bankService;

	@GetMapping("/expense")
	public String loadAddExpenseForm(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "login";
		}

		model.addAttribute("categories", categoryService.getCategoriesByType(email, "Expense"));
		model.addAttribute("banks", bankService.getAllBanks(email));
		return "Expense/addExpense";
	}

	// ADD Logic
	@PostMapping("/addExpense")
	public String addExpense(@ModelAttribute ExpenseRequestDto expenseRequestDto, Model model, HttpSession session) {
		String userEmail = (String) session.getAttribute("email");

		if (userEmail == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		expenseRequestDto.setUser(userEmail);

		if (expenseRequestDto.getNewCategory() != null && !expenseRequestDto.getNewCategory().isBlank()) {
			categoryService.saveExpenseCategory(expenseRequestDto.getNewCategory(), userEmail);
			expenseRequestDto.setCategory(expenseRequestDto.getNewCategory());
		}

		if (expenseRequestDto.getNewAccount() != null && !expenseRequestDto.getNewAccount().isBlank()) {
			bankService.saveBank(expenseRequestDto.getNewAccount(), userEmail);
			expenseRequestDto.setAccount(expenseRequestDto.getNewAccount());
		}

		boolean isSaved = expenseService.saveExpense(expenseRequestDto);
		model.addAttribute(isSaved ? "successMsg" : "errMsg", isSaved ? "Successfully Added!" : "Fill All Info");

		model.addAttribute("categories", categoryService.getCategoriesByType(userEmail, "Expense"));
		model.addAttribute("banks", bankService.getAllBanks(userEmail));

		return "Expense/addExpense";
	}

	@GetMapping("/transactionss")
	public String getTodayExpenses(Model model) {
		LocalDate today = LocalDate.now(); // gets current date
		List<ExpenseResponseDto> expenses = expenseService.getExpensesByDate(today);
		model.addAttribute("expenses", expenses);
		return "Expense/showExpense";
	}

	@GetMapping("/transactions")
	public String showFilteredExpenses(@RequestParam(value = "filterType", required = false) String filterType,
			@RequestParam(value = "filterValue", required = false) String filterValue,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size, HttpSession session, Model model) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		Page<ExpenseDto> expensePage;

		if ("date-range".equalsIgnoreCase(filterType) && startDate != null && endDate != null) {
			expensePage = expenseService.getExpensesBetweenDates(email, startDate, endDate, page, size);
		} else if (filterType != null && !filterType.isEmpty()) {
			expensePage = expenseService.getFilteredExpensesFromAPI(email, filterType, filterValue, page, size);
		} else {
			expensePage = expenseService.getAllExpenses(email, page, size);
		}

		model.addAttribute("expenses", expensePage.getContent());
		model.addAttribute("currentPage", expensePage.getNumber());
		model.addAttribute("totalPages", expensePage.getTotalPages());
		model.addAttribute("size", expensePage.getSize());

		model.addAttribute("filterType", filterType);
		model.addAttribute("filterValue", filterValue);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("email", email);

		return "Expense/showExpense";
	}

	@GetMapping("/editExpense")
	public String editExpense(@RequestParam("id") int id, Model model, HttpSession session) {
		String userEmail = (String) session.getAttribute("email");
		if (userEmail == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		List<BankDto> banks = bankService.getBanksByUser(userEmail);
		List<CategoryDto> categories = categoryService.getCategoriesByUser(userEmail);
		ExpenseDto expense = expenseService.getExpenseById(id, userEmail);
		model.addAttribute("expense", expense);
		model.addAttribute("bankList", banks);
		model.addAttribute("categoryList", categories);

		return "Expense/editExpenseForm";
	}

	@PostMapping("/updateExpense")
	public String updateExpense(@ModelAttribute UpdateExpenseDto dto, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");

		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		dto.setUser(email);
		boolean updated = expenseService.updateExpense(dto);

		if (updated) {
			model.addAttribute("msg", "Expense updated successfully!");
			return "Expense/showExpense";
		} else {
			model.addAttribute("msg", "Update failed!");
			return "redirect:/editExpense?id=" + dto.getId();
		}
	}

	@GetMapping("/deleteExpense")
	public String deleteExpense(@RequestParam("id") int id, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");

		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		boolean deleted = expenseService.deleteExpense(id);
		if (deleted) {
			model.addAttribute("successMsg", "Expense deleted successfully.");
		} else {
			model.addAttribute("errMsg", "Failed to delete expense.");
		}

		return "redirect:/transactions";
	}

	@GetMapping("/analysis")
	public String showAnalysis(Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");
		LocalDate today = LocalDate.now();

		ExpenseAnalysisResponseDto analysis = expenseService.getSpendingAnalysis(email, today.getMonthValue(),
				today.getYear());

		model.addAttribute("analysis", analysis);
		return "Expense/analysis";
	}

}
