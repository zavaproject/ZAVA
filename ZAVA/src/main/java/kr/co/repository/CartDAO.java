package kr.co.repository;

import java.util.List;

import kr.co.domain.CartVO;
import kr.co.domain.OptionVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ProductVO;

public interface CartDAO {

	List<CartVO> list(String mid);

	int sumMoney(String mid);

	int countCart(String ocode, String mid);

	int updateCart(CartVO vo);

	int insert(CartVO vo);

	void delete(CartVO vo);

	CartVO checkCart(CartVO vo);

	OptionVO cartOcode(String ocode);

	ProductVO productCart(String pid);

	List<String> getfile(String pid);
	
	//order==================>
	
	void order(OrderVO order) throws Exception;

	void orderDetail(OrderDetailVO orderDetail) throws Exception;

	List<OrderVO> orderList(OrderVO order) throws Exception;

	List<OrderListVO> orderRead(OrderVO order) throws Exception;

	void cartDataDelete(String mid) throws Exception;

	void updateOstock(CartVO vo);

	int ostock(String ocode);

	CartVO cidcart(CartVO vo);

	void deleteOstock(CartVO vo);

	int getPcnt(CartVO vo);

}
