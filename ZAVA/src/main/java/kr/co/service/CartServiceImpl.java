package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CartVO;
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
	public int countCart(String pid, String mid) {
		// TODO Auto-generated method stub
		return cDao.countCart(pid, mid);
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

}
