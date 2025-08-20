package com.pem.service;

import com.pem.dto.user.LoginRequestDto;
import com.pem.dto.user.SignUpRequestDto;

public interface UserService {
	String sendSignupData(SignUpRequestDto signupDTO);

	boolean sendLoginData(LoginRequestDto dto);

}
