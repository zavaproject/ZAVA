package kr.co.repository;

import java.util.List;

import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;

public interface OrderDAO {

	void order(OrderVO order) throws Exception;

	void orderDetail(OrderDetailVO orderDetail) throws Exception;

	void cartDelete(String mid) throws Exception;

	List<OrderVO> orderList(OrderVO order) throws Exception;

	List<OrderListVO> orderRead(OrderVO order) throws Exception;

}
