package com.pem.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.service.ReportsService;

@Service
public class ReportsServiceImpl implements ReportsService {

	@Autowired
	private RestTemplate restTemplate;

	private final String API_URL = "http://localhost:9197/api/reports/income";

	@Override
	public double getIncome(String email, int month, int year) {
		String url = API_URL + "?email=" + email + "&month=" + month + "&year=" + year;
		return restTemplate.getForObject(url, Double.class);
	}
}
