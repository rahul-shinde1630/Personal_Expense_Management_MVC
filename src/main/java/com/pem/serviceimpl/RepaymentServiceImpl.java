package com.pem.serviceimpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.dto.repayment.RepaymentRequestDto;
import com.pem.dto.repayment.RepaymentResponseDto;
import com.pem.service.RepaymentService;

@Service
public class RepaymentServiceImpl implements RepaymentService {

	private final String BASE_URL = "http://localhost:9197/api/repayments";

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public void addRepayment(RepaymentRequestDto dto) {
		String url = BASE_URL + "/add";
		restTemplate.postForObject(url, dto, String.class);
	}

	@Override
	public List<RepaymentResponseDto> getFilteredRepayments(String email, String repaymentType, String filterValue) {
		String url = BASE_URL + "/filter" + "?email=" + email + "&repaymentType=" + repaymentType + "&filterValue="
				+ filterValue;

		try {
			RepaymentResponseDto[] response = restTemplate.getForObject(url, RepaymentResponseDto[].class);
			return Arrays.asList(response != null ? response : new RepaymentResponseDto[0]);
		} catch (Exception e) {
			System.out.println("Error calling repayment filter API: " + e.getMessage());
			return new ArrayList<>();
		}
	}

	@Override
	public RepaymentResponseDto getRepaymentById(Long id) {
		String url = BASE_URL + "/" + id;
		return restTemplate.getForObject(url, RepaymentResponseDto.class);
	}

	@Override
	public void updateRepayment(RepaymentRequestDto dto) {
		restTemplate.put(BASE_URL, dto);
	}

	@Override
	public boolean deleteById(Long id) {
		String url = BASE_URL + "/" + id;
		restTemplate.delete(url);
		return true;
	}

	@Override
	public List<RepaymentResponseDto> getAllRepayments(String email) {
		String url = BASE_URL + "/data/" + email;

		RepaymentResponseDto[] response = restTemplate.getForObject(url, RepaymentResponseDto[].class);

		if (response != null) {
			return Arrays.asList(response);
		}
		return Collections.emptyList();
	}

}
