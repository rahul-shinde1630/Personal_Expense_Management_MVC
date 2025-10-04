package com.pem.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.dto.income.IncomeForecastResponseDto;
import com.pem.dto.income.IncomeRequestDto;
import com.pem.dto.income.IncomeResponseDto;
import com.pem.dto.income.PageResponse;
import com.pem.service.IncomeService;

@Service
public class IncomeServiceImpl implements IncomeService {

	private final String BASE_API_URL = "http://localhost:9197/api/income";

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public boolean saveIncome(IncomeRequestDto dto) {
		try {
			String url = BASE_API_URL + "/addIncome";
			String response = restTemplate.postForObject(url, dto, String.class);
			return response != null && response.contains("success");
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Page<IncomeResponseDto> getIncomesBetweenDates(String email, String startDate, String endDate, int page,
			int size) {

		String url = BASE_API_URL + "/date-range?email=" + email + "&startDate=" + startDate + "&endDate=" + endDate
				+ "&page=" + page + "&size=" + size;

		try {
			ResponseEntity<PageResponse<IncomeResponseDto>> response = restTemplate.exchange(url, HttpMethod.GET, null,
					new ParameterizedTypeReference<PageResponse<IncomeResponseDto>>() {
					});

			PageResponse<IncomeResponseDto> pageResponse = response.getBody();

			return new PageImpl<>(pageResponse.getContent(), PageRequest.of(pageResponse.getNumber(), size),
					pageResponse.getTotalElements());
		} catch (Exception e) {
			System.out.println("Error fetching paginated expenses by date: " + e.getMessage());
			return Page.empty();
		}
	}

	@Override
	public Page<IncomeResponseDto> getFilteredIncomesFromAPI(String email, String filterType, String filterValue,
			int page, int size) {
		String url = BASE_API_URL + "/filter?email=" + email + "&filterType=" + filterType + "&filterValue="
				+ filterValue + "&page=" + page + "&size=" + size;

		try {
			ResponseEntity<com.pem.dto.income.PageResponse<IncomeResponseDto>> response = restTemplate.exchange(url,
					HttpMethod.GET, null, new ParameterizedTypeReference<PageResponse<IncomeResponseDto>>() {
					});

			PageResponse<IncomeResponseDto> pageResponse = response.getBody();

			return new PageImpl<>(pageResponse.getContent(), PageRequest.of(pageResponse.getNumber(), size),
					pageResponse.getTotalElements());
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			return Page.empty();
		}
	}

	@Override
	public Page<IncomeResponseDto> getAllIncome(String email, int page, int size) {
		try {
			String url = BASE_API_URL + "/allIncomes?email=" + email + "&page=" + page + "&size=" + size;

			ResponseEntity<PageResponse<IncomeResponseDto>> response = restTemplate.exchange(url, HttpMethod.GET, null,
					new ParameterizedTypeReference<PageResponse<IncomeResponseDto>>() {
					});

			PageResponse<IncomeResponseDto> pageResponse = response.getBody();

			return new PageImpl<>(pageResponse.getContent(), PageRequest.of(pageResponse.getNumber(), size),
					pageResponse.getTotalElements());
		} catch (Exception e) {
			System.out.println("Error fetching paginated all incomes: " + e.getMessage());
			return Page.empty();
		}
	}

	@Override
	public IncomeResponseDto getById(Long id) {
		try {
			return restTemplate.getForObject(BASE_API_URL + "/get/" + id, IncomeResponseDto.class);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void delete(Long id) {
		try {
			restTemplate.delete(BASE_API_URL + "/" + id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean updateIncome(IncomeRequestDto dto) {
		try {
			restTemplate.put(BASE_API_URL + "/updateIncome", dto);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public IncomeForecastResponseDto forecastIncome(String email, int months) {
		IncomeForecastResponseDto dto = restTemplate.getForObject(
				BASE_API_URL + "/forecast?email=" + email + "&months=" + months, IncomeForecastResponseDto.class);

		return dto;
	}

}
