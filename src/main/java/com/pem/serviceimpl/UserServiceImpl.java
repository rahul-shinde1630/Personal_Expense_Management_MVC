package com.pem.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.dto.user.LoginRequestDto;
import com.pem.dto.user.SignUpRequestDto;
import com.pem.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public String sendSignupData(SignUpRequestDto dto) {
		String url = "http://localhost:9197/api/signup";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<SignUpRequestDto> request = new HttpEntity<>(dto, headers);

		try {
			ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);

			if (response.getStatusCode() == HttpStatus.OK) {
				return response.getBody();
			}
		} catch (Exception e) {
			System.out.println("API Error: " + e.getMessage());
		}

		return null;
	}

	@Override
	public boolean sendLoginData(LoginRequestDto dto) {
		String url = "http://localhost:9197/api/login";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<LoginRequestDto> request = new HttpEntity<>(dto, headers);

		try {
			ResponseEntity<Boolean> response = restTemplate.postForEntity(url, request, Boolean.class);
			return Boolean.TRUE.equals(response.getBody());
		} catch (Exception e) {
			System.out.println("API Error: " + e.getMessage());
		}

		return false;
	}

}
