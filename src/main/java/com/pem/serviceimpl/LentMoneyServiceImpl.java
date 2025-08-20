package com.pem.serviceimpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.pem.dto.lentmoney.LentMoneyRequestDto;
import com.pem.dto.lentmoney.LentMoneyResponseDto;
import com.pem.service.LentMoneyService;

@Service
public class LentMoneyServiceImpl implements LentMoneyService {
	@Autowired
	RestTemplate restTemplate;
	private final String BASE_URL = "http://localhost:9197/api/lentmoney";

	@Override
	public boolean save(LentMoneyRequestDto dto) {
		return restTemplate.postForObject(BASE_URL + "/save", dto, Boolean.class);
	}

	@Override
	public List<LentMoneyResponseDto> getByEmail(String email) {
		LentMoneyResponseDto[] response = restTemplate.getForObject(BASE_URL + "/user?email=" + email,
				LentMoneyResponseDto[].class);
		return Arrays.asList(response);
	}

	@Override
	public boolean delete(Long lentId) {
		restTemplate.delete(BASE_URL + "/" + lentId);
		return true;
	}

	@Override
	public LentMoneyRequestDto getById(Long lentId) {
		if (lentId == null) {
			throw new IllegalArgumentException("lentId must not be null");
		}
		try {
			return restTemplate.getForObject(BASE_URL + "/" + lentId, LentMoneyRequestDto.class);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean update(LentMoneyRequestDto dto) {
		try {
			restTemplate.put(BASE_URL + "/update", dto);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
