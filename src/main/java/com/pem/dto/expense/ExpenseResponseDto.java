package com.pem.dto.expense;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExpenseResponseDto {
	private int id;
	private String title;
	private double amount;
	private String category;
	private String paymentMode;
	private LocalDate expenseDate;
	private String expenseTime;
	private String account;
	private String user;

}
