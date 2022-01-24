package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CartVO;
import kr.co.domain.OptionVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ProductVO;
import kr.co.repository.CartDAO;

@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	private CartDAO cDao;
	

	@Override
	public List<CartVO> list(String mid) {
		
		return cDao.list(mid);
	}

	@Override
	public int sumMoney(String mid) {
		// TODO Auto-generated method stub
		return cDao.sumMoney(mid);
	}

	@Override
	public int countCart(String ocode, String mid) {
		// TODO Auto-generated method stub
		return cDao.countCart(ocode, mid);
	}

	@Override
	public int updateCart(CartVO vo) {
		// TODO Auto-generated method stub
		return cDao.updateCart(vo);
	}

	@Override
	public int insert(CartVO vo) {
		// TODO Auto-generated method stub
		return cDao.insert(vo);
	}

	@Override
	public void delete(CartVO vo) {
		// TODO Auto-generated method stub
		cDao.delete(vo);
	}

	@Override
	public CartVO checkCart(CartVO vo) {
		// TODO Auto-generated method stub
		return cDao.checkCart(vo);
	}

	@Override
	public OptionVO cartOcode(String ocode) {
		// TODO Auto-generated method stub
		return cDao.cartOcode(ocode);
	}

	@Override
	public ProductVO productCart(String pid) {
		// TODO Auto-generated method stub
		
		
		return cDao.productCart(pid);
	}

	@Override
	public List<String> getfile(String pid) {
		// TODO Auto-generated method stub
		return cDao.getfile(pid);
	}

		
	//order=============================>
	
	@Override
	public void order(OrderVO order) throws Exception {
		cDao.order(order);
	}

	@Override
	public void orderDetail(OrderDetailVO orderDetail) throws Exception {
		cDao.orderDetail(orderDetail);

	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {

		return cDao.orderList(order);
	}

	@Override
	public List<OrderListVO> orderRead(OrderVO order) throws Exception {
		
		return cDao.orderRead(order);
	}
	//주문 후 카트 삭제
	@Override
	public void cartDataDelete(String mid) throws Exception {
		
		cDao.cartDataDelete(mid);
	
	}
		
	//수량 조절
	@Override 
	public void updateOstock(OptionVO option) throws Exception {
		cDao.updateOstock(option); 
	}

	
}
