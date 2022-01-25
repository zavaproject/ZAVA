package kr.co.service;

import java.util.List;

import kr.co.domain.OptionVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;

public interface AdminOrderService {

	List<OrderVO> adOrderList() throws Exception;

	List<OrderListVO> adOrderRead(OrderVO order) throws Exception;

	void adminOstatus(OrderVO order) throws Exception;

}
