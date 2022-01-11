package kr.co.repository;

import java.util.List;

import kr.co.domain.CartVO;

public interface CartDAO {

	List<CartVO> list(String mid);

	int sumMoney(String mid);

	int countCart(String pid, String mid);

	int updateCart(CartVO vo);

	int insert(CartVO vo);

	void delete(CartVO vo);

	CartVO checkCart(CartVO vo);

}
