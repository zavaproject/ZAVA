package kr.co.service;

import org.springframework.stereotype.Service;

import kr.co.domain.OrderVO;

@Service
public interface OrderService {



	void order(OrderVO vo);

}
