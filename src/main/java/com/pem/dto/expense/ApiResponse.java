package com.pem.dto.expense;

public class ApiResponse {
	private boolean status;

	public ApiResponse() {
	}

	public ApiResponse(boolean status) {
		this.status = status;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}
