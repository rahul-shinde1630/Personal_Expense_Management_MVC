package com.pem.service;

import java.util.List;

import com.pem.dto.category.CategoryDto;

public interface CategoryService {
	void saveExpenseCategory(String name, String user);

	List<CategoryDto> getCategoriesByType(String user, String type);

	List<CategoryDto> getCategoriesByUser(String userEmail);

	void saveIncomeCategory(String name, String email);
}
