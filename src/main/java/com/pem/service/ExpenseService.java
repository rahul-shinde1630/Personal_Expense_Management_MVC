package com.pem.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.domain.Page;

import com.pem.dto.expense.ExpenseAnalysisResponseDto;
import com.pem.dto.expense.ExpenseDto;
import com.pem.dto.expense.ExpenseRequestDto;
import com.pem.dto.expense.ExpenseResponseDto;
import com.pem.dto.expense.UpdateExpenseDto;

public interface ExpenseService {
	boolean saveExpense(ExpenseRequestDto dto);

	ExpenseDto getExpenseById(int id, String userEmail);

	List<ExpenseResponseDto> getExpensesByDate(LocalDate date);

	boolean updateExpense(UpdateExpenseDto dto);

	boolean deleteExpense(int id);

	Page<ExpenseDto> getFilteredExpensesFromAPI(String email, String filterType, String filterValue, int page,
			int size);

	Page<ExpenseDto> getAllExpenses(String email, int page, int size);

	Page<ExpenseDto> getExpensesBetweenDates(String email, String startDate, String endDate, int page, int size);

	ExpenseAnalysisResponseDto getSpendingAnalysis(String email, int monthValue, int year);

}
