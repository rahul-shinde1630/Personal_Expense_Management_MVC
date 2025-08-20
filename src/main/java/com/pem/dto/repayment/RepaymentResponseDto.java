package com.pem.dto.repayment;

import java.time.LocalDate;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class RepaymentResponseDto {
	private int repaymentId;
	private String transactionType;
	private String personName;
	private long referenceId;
	private double amount;
	private LocalDate repaymentDate;
	private String status;
	private double remainingAmount;
}
