package kr.co.repository;

import java.util.List;

import kr.co.domain.OptionVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;

public interface AdminOrderDAO {

	List<OrderVO> adOrderList() throws Exception;

	List<OrderListVO> adOrderRead(OrderVO order) throws Exception;

	void adminOstatus(OrderVO order) throws Exception;

}
