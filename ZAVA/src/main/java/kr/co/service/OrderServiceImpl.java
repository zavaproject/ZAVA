package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.repository.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO oDAO;

	@Override
	public void order(OrderVO order) throws Exception {
		oDAO.order(order);
	}

	@Override
	public void orderDetail(OrderDetailVO orderDetail) throws Exception {
		oDAO.orderDetail(orderDetail);

	}


	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {

		return oDAO.orderList(order);
	}

	@Override
	public List<OrderListVO> orderRead(OrderVO order) throws Exception {
		
		return oDAO.orderRead(order);
	}

}
