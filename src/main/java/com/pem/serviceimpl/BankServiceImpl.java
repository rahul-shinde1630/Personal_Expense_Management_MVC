package com.pem.serviceimpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.dto.bank.BankDto;
import com.pem.dto.bank.BankRequestDto;
import com.pem.dto.expense.ApiResponse;
import com.pem.service.BankService;

@Service
public class BankServiceImpl implements BankService {

	@Autowired
	RestTemplate restTemplate;

	@Override
	public boolean saveBank(String name, String user) {
		String url = "http://localhost:9197/api/addBank";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		BankRequestDto dto = new BankRequestDto();
		dto.setName(name);
		dto.setUser(user);

		HttpEntity<BankRequestDto> request = new HttpEntity<>(dto, headers);

		try {
			ResponseEntity<ApiResponse> response = restTemplate.postForEntity(url, request, ApiResponse.class);
			return response.getBody() != null && response.getBody().isStatus();
		} catch (Exception e) {
			System.out.println("Bank API Error: " + e.getMessage());
		}
		return false;
	}

	@Override
	public List<BankDto> getAllBanks(String user) {
		String url = "http://localhost:9197/api/banks?user=" + user;

		try {
			ResponseEntity<BankDto[]> response = restTemplate.getForEntity(url, BankDto[].class);
			return Arrays.asList(response.getBody());
		} catch (Exception e) {
			System.out.println("Bank Fetch Error: " + e.getMessage());
		}

		return List.of();
	}

	@Override
	public List<BankDto> getBanksByUser(String userEmail) {
		String url = "http://localhost:9197/api/banks?user=" + userEmail;
		ResponseEntity<BankDto[]> response = restTemplate.getForEntity(url, BankDto[].class);
		return Arrays.asList(response.getBody());
	}
}
