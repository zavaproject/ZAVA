package kr.co.repository;

import org.springframework.stereotype.Repository;

import kr.co.domain.OrderVO;

@Repository
public interface OrderDAO {


	void order(OrderVO vo);

	void payment(OrderVO vo);
	
}
