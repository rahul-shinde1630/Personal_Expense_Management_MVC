package com.pem.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.pem.dto.budget.BudgetRequestDto;
import com.pem.dto.budget.BudgetResponseDto;

public interface BudgetService {
	boolean saveBudget(BudgetRequestDto dto);

	List<BudgetResponseDto> getBudgetsByUserId(String email);

	BudgetResponseDto getBudgetById(Long id);

	boolean updateBudget(BudgetRequestDto dto);

	boolean deleteBudget(Long id);

	List<String> getCategoriesByUser(String email);

	Page<BudgetResponseDto> filterBudgetsByCategory(String email, String category, int page, int size);

}
