package kr.co.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CartVO;
import kr.co.domain.OptionVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ProductVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	private SqlSession sqlSession;

	private final String NS = "kr.co.cart";

	@Override
	public List<CartVO> list(String mid) {

		return sqlSession.selectList(NS + ".list", mid);
	}

	@Override
	public int sumMoney(String mid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS + ".sumMoney", mid);
	}

	@Override
	public int countCart(String ocode, String mid) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("ocode", ocode);
		map.put("mid", mid);

		return sqlSession.selectOne(NS + ".countCart", map);
	}

	@Override
	public int updateCart(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NS + ".updateCart", vo);
	}

	@Override
	public int insert(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NS + ".insert", vo);
	}

	@Override
	public void delete(CartVO vo) {
		// TODO Auto-generated method stub
		sqlSession.delete(NS + ".delete", vo);
	}

	@Override
	public CartVO checkCart(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS + ".checkCart", vo);
	}

	@Override
	public OptionVO cartOcode(String ocode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS + ".cartOcode", ocode);
	}

	@Override
	public ProductVO productCart(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS + ".productCart", pid);
	}

	@Override
	public List<String> getfile(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS + ".getfile", pid);
	}

	/* order======================================> */

	@Override
	public void order(OrderVO order) throws Exception {
		sqlSession.insert(NS + ".order", order);

	}

	@Override
	public void orderDetail(OrderDetailVO orderDetail) throws Exception {
		sqlSession.insert(NS + ".orderDetail", orderDetail);

	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {

		return sqlSession.selectList(NS + ".orderList", order);
	}

	@Override
	public List<OrderListVO> orderRead(OrderVO order) throws Exception {

		return sqlSession.selectList(NS + ".orderRead", order);
	}

	@Override
	public void cartDataDelete(String mid) throws Exception {
		sqlSession.delete(NS + ".cartDataDelete", mid);
	}

	// ==================>재고 수량


	@Override
	public void updateOstock(CartVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(NS + ".updateOstock", vo);
	}
	@Override
	public int ostock(String ocode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".ostock",ocode);
	}

	@Override
	public CartVO cidcart(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".cidcart", vo);
	}
	@Override
	public void deleteOstock(CartVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(NS + ".deleteOstock", vo);
	}

	@Override
	public int getPcnt(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".getPcnt", vo);
	}
}
