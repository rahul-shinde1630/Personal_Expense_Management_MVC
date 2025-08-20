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

@Controller
public class ForgotPasswordController {

	@Autowired
	private ForgotPasswordService forgotPasswordService;

	@GetMapping("/forgot-password")
	public String showForgotPasswordForm() {
		return "User/forgot-password";
	}

	@PostMapping("/send-otp")
	public String sendOtp(@ModelAttribute ForgotPasswordRequest request, Model model) {
		String message = forgotPasswordService.sendOtp(request);
		model.addAttribute("msg", message);
		model.addAttribute("email", request.getEmail());
		return "User/forgot-password";

	}

	@PostMapping("/reset-password")
	public String resetPassword(@ModelAttribute OtpValidationRequest request, Model model) {
		String message = forgotPasswordService.validateOtpAndResetPassword(request);
		model.addAttribute("msg", message);
		return "login";
	}
}
