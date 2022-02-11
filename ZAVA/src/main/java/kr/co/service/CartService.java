package kr.co.service;

import java.util.List;

import kr.co.domain.CartVO;
import kr.co.domain.OptionVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ProductVO;

public interface CartService {

	// 카트 목록
	List<CartVO> list(String mid);
	
	int sumMoney(String mid);

	int countCart(String ocode, String mid);
	
	// 카트 수량 수정
	int updateCart(CartVO vo);
	
	// 카트 추가
	int insert(CartVO vo);

	// 카트 삭제
	void delete(CartVO vo);
	
	// 카트 확인
	CartVO checkCart(CartVO vo);

	OptionVO cartOcode(String ocode);

	ProductVO productCart(String pid);

	List<String> getfile(String pid);
	
	//order=============================>
	
	void order(OrderVO order) throws Exception;

	void orderDetail(OrderDetailVO orderDetail) throws Exception;

	List<OrderVO> orderList(OrderVO order) throws Exception;

	List<OrderListVO> orderRead(OrderVO order) throws Exception;

	void cartDataDelete(String mid) throws Exception;

	int ostock(String ocode);

	int getPcnt(CartVO vo);

	void updateOstock(CartVO vo);

	void deleteOstock(CartVO vo);

//	void updateOstock(OptionVO option) throws Exception;


}
