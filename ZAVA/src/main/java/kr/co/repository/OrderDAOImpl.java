package kr.co.repository;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.order";


	@Override
	public void order(OrderVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(NS+".order", vo);
	}


	@Override
	public void payment(OrderVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(NS+".payment", vo);
	}
	
}