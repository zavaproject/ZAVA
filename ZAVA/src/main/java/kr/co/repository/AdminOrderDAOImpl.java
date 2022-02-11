package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.OptionVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;

@Repository
public class AdminOrderDAOImpl implements AdminOrderDAO {

	@Inject
	private SqlSession sqlSession;

	private final String NS = "kr.co.admin";

	@Override
	public List<OrderVO> adOrderList() throws Exception {

		return sqlSession.selectList(NS + ".adOrderList");
	}

	@Override
	public List<OrderListVO> adOrderRead(OrderVO order) throws Exception {

		return sqlSession.selectList(NS + ".adOrderRead", order);
	}

	@Override
	public void adminOstatus(OrderVO order) throws Exception {
		sqlSession.update(NS + ".adminOstatus", order);
	}


}
