package com.pem.service;

public interface ReportsService {

	// Total income between two years
	double getIncome(String email, int fromYear, int toYear);

	// Total expense between two years
	double getExpense(String email, int fromYear, int toYear);

	// Total borrowed remaining between two years
	Double getBorrowedRemaining(String email, int fromYear, int toYear);
}
