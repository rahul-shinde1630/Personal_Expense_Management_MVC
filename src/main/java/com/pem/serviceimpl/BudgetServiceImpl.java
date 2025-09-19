package com.pem.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
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

	@Override
	public List<String> getCategoriesByUser(String email) {
		try {
			String apiUrl = "http://localhost:9197/api/budget/user/" + email + "/categories";

			ResponseEntity<String[]> response = restTemplate.getForEntity(apiUrl, String[].class);

			if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
				return List.of(response.getBody());
			} else {
				return List.of();
			}

		} catch (Exception e) {
			System.out.println("API Error (GET categories): " + e.getMessage());
			return List.of();
		}
	}

	@Override
	public Page<BudgetResponseDto> filterBudgetsByCategory(String email, String category, int page, int size) {
		try {
			StringBuilder apiUrl = new StringBuilder("http://localhost:9197/api/budget/filter?email=" + email);

			if (category != null && !category.isEmpty()) {
				apiUrl.append("&category=").append(category);
			}

			// Call API
			ResponseEntity<BudgetResponseDto[]> response = restTemplate.getForEntity(apiUrl.toString(),
					BudgetResponseDto[].class);

			if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
				List<BudgetResponseDto> budgetList = List.of(response.getBody());

				// ✅ Safe pagination
				int safePage = Math.max(page, 1); // ensure at least 1
				int safeSize = Math.max(size, 1); // ensure at least 1

				int start = (safePage - 1) * safeSize;
				int end = Math.min(start + safeSize, budgetList.size());

				List<BudgetResponseDto> pagedList = (start < end) ? budgetList.subList(start, end) : List.of();

				return new PageImpl<>(pagedList, PageRequest.of(safePage - 1, safeSize), budgetList.size());
			} else {
				return Page.empty();
			}

		} catch (Exception e) {
			System.out.println("API Error (FILTER budgets): " + e.getMessage());
			return Page.empty();
		}
	}

}
