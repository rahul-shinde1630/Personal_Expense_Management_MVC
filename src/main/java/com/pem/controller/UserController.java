package com.pem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pem.dto.user.LoginRequestDto;
import com.pem.dto.user.SignUpRequestDto;
import com.pem.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@PostMapping("/signup")
	public String signUpUser(@ModelAttribute SignUpRequestDto dto, Model model) {
		String response = userService.sendSignupData(dto);

		if (response != null) {
			model.addAttribute("successMsg", "✅ Successfully Signed up!");
		} else {
			model.addAttribute("errMsg", "❌ User already exists.");
		}

		return "User/signup";
	}

	@PostMapping("/home")
	public String loginUser(@ModelAttribute LoginRequestDto dto, Model model, HttpSession session) {

		boolean result = userService.sendLoginData(dto);

		if (result) {
			session.setAttribute("email", dto.getEmail());
			model.addAttribute("successMsg", "✅ Successfully Login !");
			return "index";
		} else {
			model.addAttribute("errMsg", "❌ Wrong Credentials..! ");
			return "login";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate(); // destroy session
		}
		return "redirect:/login?logout=true"; // optional message param
	}

}
