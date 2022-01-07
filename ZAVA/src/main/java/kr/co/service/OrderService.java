package kr.co.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderVO;

@Service
public interface OrderService {



	void order(OrderVO vo);

	void orderDetail(OrderDetailVO odVo);

	List<OrderVO> orderList(OrderVO oVO);

}
