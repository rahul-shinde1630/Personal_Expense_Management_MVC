package com.pem.service;

public interface ReportsService {
	double getIncome(String email, int month, int year);

	double getExpense(String email, int month, int year);

	Double getBorrowedRemaining(String email, int month, int year);
}
