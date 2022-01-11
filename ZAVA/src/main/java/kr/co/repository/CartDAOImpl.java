package kr.co.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.cart";

	@Override
	public List<CartVO> list(String mid) {
		
		return sqlSession.selectList(NS+".list", mid);
	}

	@Override
	public int sumMoney(String mid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".sumMoney", mid);
	}

	@Override
	public int countCart(String pid, String mid) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pid", pid);
		map.put("userid", mid);
		map.put("mid", mid);
		
		return sqlSession.selectOne(NS+".countCart", map);
	}

	@Override
	public int updateCart(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NS+".updateCart", vo);
	}

	@Override
	public int insert(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NS+".insert", vo);
	}

	@Override
	public void delete(CartVO vo) {
		// TODO Auto-generated method stub
		sqlSession.delete(NS+".delete", vo);
	}

	@Override
	public CartVO checkCart(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".checkCart", vo);
	}


}
