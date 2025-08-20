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

import com.pem.dto.category.CategoryDto;
import com.pem.dto.category.CategoryRequestDto;
import com.pem.dto.expense.ApiResponse;
import com.pem.enums.CategoryType;
import com.pem.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private RestTemplate restTemplate;

	private static final String BASE_URL = "http://localhost:9197/api";

	@Override
	public void saveExpenseCategory(String name, String user) {
		String url = BASE_URL + "/addCategory";

		CategoryRequestDto dto = new CategoryRequestDto();
		dto.setName(name);
		dto.setUser(user);
		dto.setType(CategoryType.EXPENSE);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<CategoryRequestDto> request = new HttpEntity<>(dto, headers);

		try {
			restTemplate.postForEntity(url, request, ApiResponse.class);
		} catch (Exception e) {
			System.out.println("Category API Error: " + e.getMessage());
		}
	}

	@Override
	public List<CategoryDto> getCategoriesByType(String user, String type) {
		String url = BASE_URL + "/categories?user=" + user + "&type=" + type;

		try {
			ResponseEntity<CategoryDto[]> response = restTemplate.getForEntity(url, CategoryDto[].class);
			return Arrays.asList(response.getBody());
		} catch (Exception e) {
			System.out.println("Get Category API Error: " + e.getMessage());
		}

		return List.of();
	}

	@Override
	public List<CategoryDto> getCategoriesByUser(String userEmail) {
		String url = "http://localhost:9197/api/categoriess?email=" + userEmail;
		ResponseEntity<CategoryDto[]> response = restTemplate.getForEntity(url, CategoryDto[].class);
		return Arrays.asList(response.getBody());
	}

	@Override
	public void saveIncomeCategory(String name, String email) {
		String url = BASE_URL + "/addCategory";

		CategoryRequestDto dto = new CategoryRequestDto();
		dto.setName(name);
		dto.setUser(email);
		dto.setType(CategoryType.INCOME);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<CategoryRequestDto> request = new HttpEntity<>(dto, headers);

		try {
			restTemplate.postForEntity(url, request, ApiResponse.class);
		} catch (Exception e) {
			System.out.println("Category API Error: " + e.getMessage());
		}
	}

}
