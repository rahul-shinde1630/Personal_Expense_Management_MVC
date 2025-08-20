package com.pem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pem.dto.borrowedmoney.BorrowedMoneyResponseDto;
import com.pem.dto.lentmoney.LentMoneyRequestDto;
import com.pem.dto.lentmoney.LentMoneyResponseDto;
import com.pem.dto.repayment.RepaymentRequestDto;
import com.pem.dto.repayment.RepaymentResponseDto;
import com.pem.service.BorrowedMoneyService;
import com.pem.service.LentMoneyService;
import com.pem.service.RepaymentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class RepaymentController {

	@Autowired
	private RepaymentService repaymentService;

	@Autowired
	private LentMoneyService lentMoneyService;

	@Autowired
	private BorrowedMoneyService borrowedMoneyService;

	@GetMapping("/repayments")
	public String showRepaymentPage() {
		return "Repayments/repaymentsLent";
	}

	@GetMapping("/show-repaymentss")
	public String showRepaymentForm() {
		return "Repayments/show-repayments";
	}

	@PostMapping("/repaymentadd")
	public String addRepayment(@ModelAttribute RepaymentRequestDto dto, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please log in again.");
			return "login";
		}

		dto.setUser(email);
		try {
			repaymentService.addRepayment(dto);
			model.addAttribute("successMsg", "Repayment added successfully.");
		} catch (Exception e) {
			model.addAttribute("errMsg", "Error adding repayment: " + e.getMessage());
		}

		return "Repayments/show-repayments";
	}

	@GetMapping("/show-data")
	public String viewData(@RequestParam(value = "repaymentType", required = false) String repaymentType,
			@RequestParam(value = "filterValue", required = false) String filterValue, HttpSession session,
			Model model) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please log in again.");
			return "login";
		}

		// Load data based on filter
		if (repaymentType == null || repaymentType.isEmpty()) {
			// All types
			List<RepaymentResponseDto> repayments = repaymentService.getAllRepayments(email);
			List<LentMoneyResponseDto> lentList = lentMoneyService.getByEmail(email);
			List<BorrowedMoneyResponseDto> borrowedList = borrowedMoneyService.getAllByUser(email);

			model.addAttribute("repayments", repayments);
			model.addAttribute("lentList", lentList);
			model.addAttribute("borrowedList", borrowedList);

		} else if ("REPAYMENTS".equalsIgnoreCase(repaymentType)) {
			model.addAttribute("repayments", repaymentService.getAllRepayments(email));

		} else if ("LENT".equalsIgnoreCase(repaymentType)) {
			model.addAttribute("lentList", lentMoneyService.getByEmail(email));

		} else if ("BORROWED".equalsIgnoreCase(repaymentType)) {
			model.addAttribute("borrowedList", borrowedMoneyService.getAllByUser(email));
		}

		model.addAttribute("repaymentType", repaymentType);
		model.addAttribute("filterValue", filterValue);

		return "Repayments/show-repayments"; // JSP
	}

	@GetMapping("/repaymentsLent")
	public String ShowLentRepayments(@RequestParam("lentId") Long lentId, Model model) {
		LentMoneyRequestDto existing = lentMoneyService.getById(lentId);
		model.addAttribute("lentMoney", existing);
		return "Repayments/repaymentsLent";
	}

	@GetMapping("/repaymentsBorrowed")
	public String showBorrowedRepayments(@RequestParam("id") Long id, Model model) {
		BorrowedMoneyResponseDto dto = borrowedMoneyService.getById(id);
		model.addAttribute("borrowedList", dto);
		return "Repayments/repaymentBorrowed";
	}

	@PostMapping("/updateRepayment")
	public String updateRepayment(@ModelAttribute RepaymentRequestDto dto, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("errMsg", "Session expired. Please log in again.");
			return "User/login";
		}

		dto.setUser(email);
		repaymentService.updateRepayment(dto);
		return "redirect:/show-data";
	}

	@GetMapping("/deleteRepayment")
	public String deleteRepayment(@RequestParam("repaymentId") Long id) {
		repaymentService.deleteById(id);
		return "Repayments/show-repayments";
	}
}
