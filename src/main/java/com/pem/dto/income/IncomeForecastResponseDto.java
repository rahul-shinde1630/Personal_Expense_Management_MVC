package com.pem.dto.income;

import java.util.Map;

public class IncomeForecastResponseDto {

	// Category-wise forecasted income
	private Map<String, Double> forecastByCategory;

	// Total expected income
	private Double totalExpectedIncome;

	public Map<String, Double> getForecastByCategory() {
		return forecastByCategory;
	}

	public void setForecastByCategory(Map<String, Double> forecastByCategory) {
		this.forecastByCategory = forecastByCategory;
	}

	public Double getTotalExpectedIncome() {
		return totalExpectedIncome;
	}

	public void setTotalExpectedIncome(Double totalExpectedIncome) {
		this.totalExpectedIncome = totalExpectedIncome;
	}
}
