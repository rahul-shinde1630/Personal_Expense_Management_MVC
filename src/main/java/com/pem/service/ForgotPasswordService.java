package com.pem.service;

import com.pem.dto.forgot.ForgotPasswordRequest;
import com.pem.dto.forgot.OtpValidationRequest;

public interface ForgotPasswordService {
	String sendOtp(ForgotPasswordRequest request);

	boolean validateOtp(OtpValidationRequest request);

	String updatePassword(OtpValidationRequest request);
}
