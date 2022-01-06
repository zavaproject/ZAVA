package kr.co.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.OrderVO;
import kr.co.repository.OrderDAO;

@Service
public class OrderServeceImpl implements OrderService {
	
	@Inject
	private OrderDAO oDAO;
	
	
	
	@Override
	public void order(OrderVO vo) {
		oDAO.order(vo);
		
		
	}



	@Override
	public void payment(OrderVO vo) {
		// TODO Auto-generated method stub
		oDAO.payment(vo);
	}
}