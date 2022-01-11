package kr.co.service;

import java.util.List;

import kr.co.domain.CartVO;

public interface CartService {

	// 카트 목록
	List<CartVO> list(String mid);
	
	int sumMoney(String mid);

	int countCart(String pid, String mid);
	
	// 카트 수량 수정
	int updateCart(CartVO vo);
	
	// 카트 추가
	int insert(CartVO vo);

	// 카트 삭제
	void delete(CartVO vo);
	
	// 카트 확인
	CartVO checkCart(CartVO vo);

}
