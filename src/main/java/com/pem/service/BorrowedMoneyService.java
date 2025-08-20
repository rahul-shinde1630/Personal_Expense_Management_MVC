package com.pem.service;

import java.util.List;

import com.pem.dto.borrowedmoney.BorrowedMoneyRequestDto;
import com.pem.dto.borrowedmoney.BorrowedMoneyResponseDto;

public interface BorrowedMoneyService {
	boolean saveBorrowedMoney(BorrowedMoneyRequestDto dto);

	List<BorrowedMoneyResponseDto> getAllByUser(String email);

	BorrowedMoneyResponseDto getById(Long id);

	boolean updateBorrowedMoney(BorrowedMoneyRequestDto dto);

	boolean deleteById(Long id);
}
