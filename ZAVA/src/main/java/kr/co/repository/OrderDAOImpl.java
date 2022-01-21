package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession sqlSession;

	private String NS = "kr.co.cart";

	@Override
	public void order(OrderVO order) throws Exception {
		sqlSession.insert(NS + ".order", order);

	}

	@Override
	public void orderDetail(OrderDetailVO orderDetail) throws Exception {
		sqlSession.insert(NS + ".orderDetail", orderDetail);

	}

	@Override
	public void cartDelete(String mid) throws Exception {
		sqlSession.delete(NS + ".cartDelete", mid);

	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {

		return sqlSession.selectList(NS + ".orderList", order);
	}

	@Override
	public List<OrderListVO> orderRead(OrderVO order) throws Exception {

		return sqlSession.selectList(NS + ".orderRead", order);
	}

}
