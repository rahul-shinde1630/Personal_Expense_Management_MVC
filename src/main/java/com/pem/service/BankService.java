package com.pem.service;

import java.util.List;

import com.pem.dto.bank.BankDto;

public interface BankService {
	boolean saveBank(String name, String user);

	List<BankDto> getAllBanks(String user);

	List<BankDto> getBanksByUser(String userEmail);
}
