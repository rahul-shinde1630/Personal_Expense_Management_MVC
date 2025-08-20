package com.pem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pem.dto.borrowedmoney.BorrowedMoneyRequestDto;
import com.pem.dto.borrowedmoney.BorrowedMoneyResponseDto;
import com.pem.service.BorrowedMoneyService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BorrowController {

	@Autowired
	private BorrowedMoneyService borrowedMoneyService;

	// Show form
	@GetMapping("/moneyTransaction")
	public String showborrowlentIndex() {
		return "Borrow/borrow&lentIndex";
	}

	@GetMapping("/add-borrowed")
	public String showBorrowForm() {
		return "Borrow/borrowForm";
	}

	// Save Borrow Entry
	@PostMapping("/addBorrow")
	public String addBorrow(@ModelAttribute BorrowedMoneyRequestDto dto, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		dto.setUser(email);
		boolean result = borrowedMoneyService.saveBorrowedMoney(dto);

		if (result) {
			model.addAttribute("successMsg", "Borrowed entry added successfully!");
		} else {
			model.addAttribute("errMsg", "Failed to add entry. Please try again.");
		}

		return "Borrow/borrowForm";
	}

	// View all borrowed entries
	@GetMapping("/show-borrowed")
	public String viewBorrowList(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please login again.");
			return "login";
		}

		List<BorrowedMoneyResponseDto> list = borrowedMoneyService.getAllByUser(email);
		model.addAttribute("borrowedList", list);
		return "Borrow/borrow_list";
	}

	// Edit borrow entry
	@GetMapping("/editBorrowed{id}")
	public String editBorrow(@RequestParam("id") Long id, Model model) {
		BorrowedMoneyResponseDto dto = borrowedMoneyService.getById(id);
		model.addAttribute("borrow", dto);
		return "Borrow/edit_borrow";
	}

	// Update borrow entry
	@PostMapping("/updateBorrowed")
	public String updateBorrow(@ModelAttribute BorrowedMoneyRequestDto dto, HttpSession session, Model model) {
		dto.setUser((String) session.getAttribute("email"));
		boolean result = borrowedMoneyService.updateBorrowedMoney(dto);
		if (result) {
			model.addAttribute("successMsg", "Updated successfully!");
		} else {
			model.addAttribute("errMsg", "Failed to update.");
		}

		return "redirect:/show-borrowed";
	}

	// Delete borrow entry
	@GetMapping("/deleteBorrowed{id}")
	public String deleteBorrow(@RequestParam("id") Long id, Model model) {
		boolean result = borrowedMoneyService.deleteById(id);

		if (result) {
			model.addAttribute("successMsg", "Deleted successfully!");
		} else {
			model.addAttribute("errMsg", "Delete failed.");
		}

		return "redirect:viewBorrow";
	}
}
