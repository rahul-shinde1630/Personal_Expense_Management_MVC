package com.pem.service;

import org.springframework.data.domain.Page;

import com.pem.dto.income.IncomeRequestDto;
import com.pem.dto.income.IncomeResponseDto;

public interface IncomeService {
	boolean saveIncome(IncomeRequestDto dto);

	IncomeResponseDto getById(Long id);

	void delete(Long id);

	boolean updateIncome(IncomeRequestDto dto);

	Page<IncomeResponseDto> getIncomesBetweenDates(String email, String startDate, String endDate, int page, int size);

	Page<IncomeResponseDto> getFilteredIncomesFromAPI(String email, String filterType, String filterValue, int page,
			int size);

	Page<IncomeResponseDto> getAllIncome(String email, int page, int size);

}
