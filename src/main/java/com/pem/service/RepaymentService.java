package com.pem.service;

import java.util.List;

import com.pem.dto.repayment.RepaymentRequestDto;
import com.pem.dto.repayment.RepaymentResponseDto;

public interface RepaymentService {

	void addRepayment(RepaymentRequestDto dto);

	List<RepaymentResponseDto> getFilteredRepayments(String email, String repaymentType, String filterValue);

	RepaymentResponseDto getRepaymentById(Long id);

	void updateRepayment(RepaymentRequestDto dto);

	boolean deleteById(Long id);

	List<RepaymentResponseDto> getAllRepayments(String email);
}
