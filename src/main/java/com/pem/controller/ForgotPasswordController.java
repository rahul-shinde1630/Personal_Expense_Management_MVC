package com.pem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.pem.dto.forgot.ForgotPasswordRequest;
import com.pem.dto.forgot.OtpValidationRequest;
import com.pem.service.ForgotPasswordService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ForgotPasswordController {

	@Autowired
	private ForgotPasswordService forgotPasswordService;

	@GetMapping("/forgot-password")
	public String showForgotPasswordForm() {
		return "User/forgot-password";
	}

	@PostMapping("/send-otp")
	public String sendOtp(@ModelAttribute ForgotPasswordRequest request, Model model, HttpSession session) {
		try {
			String message = forgotPasswordService.sendOtp(request);

			// ✅ Store email in session
			session.setAttribute("email", request.getEmail());
			System.out.println(request.getOtp());
			// ✅ Success message
			model.addAttribute("msg", message);
			model.addAttribute("email", request.getEmail());

			return "User/otp-verify";
		} catch (RuntimeException ex) {
			model.addAttribute("error", "Invalid Users");
			model.addAttribute("email", request.getEmail());

			return "User/forgot-password";
		}
	}

	@PostMapping("/verify-otp")
	public String verifyOtp(@ModelAttribute OtpValidationRequest request, Model model, HttpSession session) {
		try {
			// ✅ If email not present in request, fetch from session
			if (request.getEmail() == null || request.getEmail().isEmpty()) {
				request.setEmail((String) session.getAttribute("email"));
			}

			boolean isValid = forgotPasswordService.validateOtp(request);

			if (isValid) {
				model.addAttribute("msg", "OTP verified successfully!");
				model.addAttribute("email", request.getEmail());
				return "User/reset-password";
			} else {
				model.addAttribute("error", "Invalid OTP. Please try again!");
				model.addAttribute("email", request.getEmail());
				return "User/otp-verify";
			}

		} catch (RuntimeException ex) {
			model.addAttribute("error", "Invalid OTP");
			model.addAttribute("email", request.getEmail());
			return "User/otp-verify"; // stay on same page with error
		} catch (Exception ex) {
			model.addAttribute("error", "Something went wrong. Please try again later.");
			model.addAttribute("email", request.getEmail());
			return "User/otp-verify";
		}
	}

	@PostMapping("/update-password")
	public String updatePassword(@ModelAttribute OtpValidationRequest request, Model model, HttpSession session) {

		// ✅ Retrieve email again if not in request
		if (request.getEmail() == null || request.getEmail().isEmpty()) {
			request.setEmail((String) session.getAttribute("email"));
		}

		String message = forgotPasswordService.updatePassword(request);

		// ✅ Clear email from session after success
		session.removeAttribute("email");

		model.addAttribute("msg", message);
		return "login";
	}
}
