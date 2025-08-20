package com.pem.serviceimpl;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.dto.forgot.ForgotPasswordRequest;
import com.pem.dto.forgot.OtpValidationRequest;
import com.pem.service.ForgotPasswordService;

@Service
public class ForgotPasswordServiceImpl implements ForgotPasswordService {

	private final String BASE_URL = "http://localhost:9197/api/auth";

	private RestTemplate restTemplate = new RestTemplate();

	@Override
	public String sendOtp(ForgotPasswordRequest request) {
		return restTemplate.postForObject(BASE_URL + "/send-otp", request, String.class);
	}

	@Override
	public String validateOtpAndResetPassword(OtpValidationRequest request) {
		return restTemplate.postForObject(BASE_URL + "/reset-password", request, String.class);
	}
}
