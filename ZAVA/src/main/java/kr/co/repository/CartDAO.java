package kr.co.repository;

import java.util.List;

import kr.co.domain.CartVO;
import kr.co.domain.OptionVO;
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

}
