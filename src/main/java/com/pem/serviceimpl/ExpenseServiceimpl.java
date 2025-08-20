package com.pem.serviceimpl;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.dto.expense.ExpenseDto;
import com.pem.dto.expense.ExpenseRequestDto;
import com.pem.dto.expense.PageResponse;
import com.pem.dto.expense.UpdateExpenseDto;
import com.pem.service.ExpenseService;

@Service
public class ExpenseServiceimpl implements ExpenseService {

	private final RestTemplate restTemplate = new RestTemplate();
	private final String API_BASE = "http://localhost:9197/api/expenses";

	@Override
	public boolean saveExpense(ExpenseRequestDto dto) {
		String url = API_BASE + "/saveExpense";
		try {
			ResponseEntity<Boolean> response = restTemplate.postForEntity(url, dto, Boolean.class);
			return response.getBody();
		} catch (Exception e) {
			System.out.println("Error saving expense: " + e.getMessage());
			return false;
		}
	}

	@Override
	public ExpenseDto getExpenseById(int id, String userEmail) {
		String url = API_BASE + "/" + id + "?email=" + userEmail;
		try {
			return restTemplate.getForObject(url, ExpenseDto.class);
		} catch (Exception e) {
			System.out.println("Error fetching expense by ID: " + e.getMessage());
			return null;
		}
	}

	@Override
	public boolean updateExpense(UpdateExpenseDto dto) {
		String url = API_BASE + "/updateExpense";
		try {
			restTemplate.put(url, dto);
			return true;
		} catch (Exception e) {
			System.out.println("Error updating expense: " + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean deleteExpense(int id) {
		String url = API_BASE + "/delete" + id;
		try {
			restTemplate.delete(url);
			return true;
		} catch (Exception e) {
			System.out.println("Error deleting expense: " + e.getMessage());
			return false;
		}
	}

	@Override
	public Page<ExpenseDto> getFilteredExpensesFromAPI(String email, String filterType, String filterValue, int page,
			int size) {
		String url = API_BASE + "/filter?email=" + email + "&filterType=" + filterType + "&filterValue=" + filterValue
				+ "&page=" + page + "&size=" + size;

		try {
			ResponseEntity<PageResponse<ExpenseDto>> response = restTemplate.exchange(url, HttpMethod.GET, null,
					new ParameterizedTypeReference<PageResponse<ExpenseDto>>() {
					});

			PageResponse<ExpenseDto> pageResponse = response.getBody();

			return new PageImpl<>(pageResponse.getContent(), PageRequest.of(pageResponse.getNumber(), size),
					pageResponse.getTotalElements());
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			return Page.empty();
		}
	}

	@Override
	public Page<ExpenseDto> getAllExpenses(String email, int page, int size) {
		String url = API_BASE + "?email=" + email + "&page=" + page + "&size=" + size;
		try {
			ResponseEntity<PageResponse<ExpenseDto>> response = restTemplate.exchange(url, HttpMethod.GET, null,
					new ParameterizedTypeReference<PageResponse<ExpenseDto>>() {
					});

			PageResponse<ExpenseDto> pageResponse = response.getBody();

			return new PageImpl<>(pageResponse.getContent(), PageRequest.of(pageResponse.getNumber(), size),
					pageResponse.getTotalElements());
		} catch (Exception e) {
			System.out.println("Error fetching paginated all expenses: " + e.getMessage());
			return Page.empty();
		}
	}

	@Override
	public Page<ExpenseDto> getExpensesBetweenDates(String email, String startDate, String endDate, int page,
			int size) {
		String url = API_BASE + "/date-range?email=" + email + "&startDate=" + startDate + "&endDate=" + endDate
				+ "&page=" + page + "&size=" + size;

		try {
			ResponseEntity<PageResponse<ExpenseDto>> response = restTemplate.exchange(url, HttpMethod.GET, null,
					new ParameterizedTypeReference<PageResponse<ExpenseDto>>() {
					});

			PageResponse<ExpenseDto> pageResponse = response.getBody();

			return new PageImpl<>(pageResponse.getContent(), PageRequest.of(pageResponse.getNumber(), size),
					pageResponse.getTotalElements());
		} catch (Exception e) {
			System.out.println("Error fetching paginated expenses by date: " + e.getMessage());
			return Page.empty();
		}
	}

}
