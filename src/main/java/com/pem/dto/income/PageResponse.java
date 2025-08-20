package com.pem.dto.income;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true) // <-- Add this line
public class PageResponse<T> {
	private List<T> content;
	private int number;
	private int size;
	private long totalElements;
	private int totalPages;
	private boolean last;
	private boolean first;
	private int numberOfElements;
	private boolean empty;

	// add these two fields 👇
	private Object pageable;
	private Object sort;
}
