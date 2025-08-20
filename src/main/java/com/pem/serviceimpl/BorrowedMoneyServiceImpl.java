package com.pem.serviceimpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.dto.borrowedmoney.BorrowedMoneyRequestDto;
import com.pem.dto.borrowedmoney.BorrowedMoneyResponseDto;
import com.pem.service.BorrowedMoneyService;

@Service
public class BorrowedMoneyServiceImpl implements BorrowedMoneyService {
	@Autowired
	private RestTemplate restTemplate;

	private final String url = "http://localhost:9197/api/borrow";

	@Override
	public boolean saveBorrowedMoney(BorrowedMoneyRequestDto dto) {
		try {
			restTemplate.postForObject(url + "/add", dto, String.class);
			return true;
		} catch (Exception e) {
			System.out.println("Save Error: " + e.getMessage());
			return false;
		}
	}

	@Override
	public List<BorrowedMoneyResponseDto> getAllByUser(String email) {
		try {
			BorrowedMoneyResponseDto[] arr = restTemplate.getForObject(url + "/user/" + email,
					BorrowedMoneyResponseDto[].class);
			return Arrays.asList(arr);
		} catch (Exception e) {
			System.out.println("Fetch Error: " + e.getMessage());
			return List.of();
		}
	}

	@Override
	public BorrowedMoneyResponseDto getById(Long id) {
		try {
			return restTemplate.getForObject(url + "/" + id, BorrowedMoneyResponseDto.class);
		} catch (Exception e) {
			System.out.println("GetById Error: " + e.getMessage());
			return null;
		}
	}

	@Override
	public boolean updateBorrowedMoney(BorrowedMoneyRequestDto dto) {
		try {
			restTemplate.put(url + "/update", dto);
			return true;
		} catch (Exception e) {
			System.out.println("Update Error: " + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean deleteById(Long id) {
		try {
			restTemplate.delete(url + "/delete/" + id);
			return true;
		} catch (Exception e) {
			System.out.println("Delete Error: " + e.getMessage());
			return false;
		}
	}
}
