package com.pem.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.dto.budget.BudgetRequestDto;
import com.pem.dto.budget.BudgetResponseDto;
import com.pem.service.BudgetService;

@Service
public class BudgetServiceImpl implements BudgetService {
	@Autowired
	RestTemplate restTemplate;

	@Override
	public boolean saveBudget(BudgetRequestDto dto) {
		try {
			String apiUrl = "http://localhost:9197/api/budget/save";

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);

			HttpEntity<BudgetRequestDto> request = new HttpEntity<>(dto, headers);

			ResponseEntity<String> response = restTemplate.postForEntity(apiUrl, request, String.class);

			return response.getStatusCode().is2xxSuccessful();

		} catch (Exception e) {
			System.out.println("API Error: " + e.getMessage());
			return false;
		}
	}

	@Override
	public List<BudgetResponseDto> getBudgetsByUserId(String email) {
		try {
			String apiUrl = "http://localhost:9197/api/budget/user/" + email;

			ResponseEntity<BudgetResponseDto[]> response = restTemplate.getForEntity(apiUrl, BudgetResponseDto[].class);

			if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
				return List.of(response.getBody());
			} else {
				return List.of();
			}

		} catch (Exception e) {
			System.out.println("API Error (GET budgets): " + e.getMessage());
			return List.of();
		}
	}

	@Override
	public BudgetResponseDto getBudgetById(Long id) {
		try {
			String apiUrl = "http://localhost:9197/api/budget/" + id;
			ResponseEntity<BudgetResponseDto> response = restTemplate.getForEntity(apiUrl, BudgetResponseDto.class);
			return response.getBody();
		} catch (Exception e) {
			System.out.println("API Error (GET by ID): " + e.getMessage());
			return null;
		}
	}

	@Override
	public boolean updateBudget(BudgetRequestDto dto) {
		try {
			String apiUrl = "http://localhost:9197/api/budget/update";

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);

			HttpEntity<BudgetRequestDto> request = new HttpEntity<>(dto, headers);
			restTemplate.put(apiUrl, request);
			return true;
		} catch (Exception e) {
			System.out.println("API Error (UPDATE): " + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean deleteBudget(Long id) {
		try {
			String apiUrl = "http://localhost:9197/api/budget/delete/" + id;
			restTemplate.delete(apiUrl);
			return true;
		} catch (Exception e) {
			System.out.println("API Error (DELETE): " + e.getMessage());
			return false;
		}
	}

}
