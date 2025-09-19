package com.pem.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.service.ReportsService;

@Service
public class ReportsServiceImpl implements ReportsService {

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public double getIncome(String email, int month, int year) {
		String url = "http://localhost:9197/api/reports/income?email=" + email + "&month=" + month + "&year=" + year;
		Double result = restTemplate.getForObject(url, Double.class);
		return result != null ? result : 0.0;
	}

	@Override
	public double getExpense(String email, int month, int year) {
		String url = "http://localhost:9197/api/reports/expense?email=" + email + "&month=" + month + "&year=" + year;
		Double result = restTemplate.getForObject(url, Double.class);
		return result != null ? result : 0.0;
	}

	@Override
	public Double getBorrowedRemaining(String email, int month, int year) {
		String url = "http://localhost:9197/api/reports/borrowedRemaining?email=" + email + "&month=" + month + "&year="
				+ year;
		Double result = restTemplate.getForObject(url, Double.class);
		return result != null ? result : 0.0;
	}

}
