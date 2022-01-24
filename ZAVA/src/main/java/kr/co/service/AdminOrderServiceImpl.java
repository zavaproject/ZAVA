package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.OptionVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.repository.AdminOrderDAO;

@Service
public class AdminOrderServiceImpl implements AdminOrderService{

	@Inject
	private AdminOrderDAO adDAO;
	
	@Override
	public List<OrderVO> adOrderList() throws Exception {
		
		return adDAO.adOrderList();
	}

	@Override
	public List<OrderListVO> adOrderRead(OrderVO order) throws Exception {
		
		return adDAO.adOrderRead(order);
	}

	@Override
	public void adminOstatus(OrderVO order) throws Exception {
		adDAO.adminOstatus(order);		
	}

}
