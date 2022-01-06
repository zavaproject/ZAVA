package kr.co.service;

import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {

	@Override
	public void test1() {
		System.out.println("파일 복사입니다.");

	}

}
