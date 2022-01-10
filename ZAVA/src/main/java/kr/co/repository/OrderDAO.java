package kr.co.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderVO;

public interface OrderDAO {


	void order(OrderVO vo);


	void orderDetail(OrderDetailVO odVo);


	List<OrderVO> orderList(OrderVO oVo);
	
}
