package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.OrderDetailVO;
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
	public void orderDetail(OrderDetailVO odVo) {
		sqlSession.insert(NS+".orderDetail", odVo);
		
	}



	@Override
	public List<OrderVO> orderList(OrderVO oVo){
		
		return sqlSession.selectList(NS+".orderList", oVo);
	}
	
}