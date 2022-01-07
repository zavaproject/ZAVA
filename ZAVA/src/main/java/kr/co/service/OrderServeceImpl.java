package kr.co.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderVO;
import kr.co.repository.OrderDAO;

@Service
public class OrderServeceImpl implements OrderService {
	
	@Inject
	private OrderDAO oDao;
	
	
	
	@Override
	public void order(OrderVO vo) {
		oDao.order(vo);
		
		
	}


	@Override
	public void orderDetail(OrderDetailVO odVo) {
		oDao.orderDetail(odVo);
		
	}






	@Override
	public List<OrderVO> orderList(OrderVO oVo) {
		
		
		return oDao.orderList(oVo);
	}
}