package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardVO;
import kr.co.domain.PageTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.board";

	@Override
	public List<BoardVO> list(PageTO<BoardVO> to) {
		
		RowBounds rbs = new RowBounds(to.getStartNum()-1, to.getPerPage());
		
		return sqlSession.selectList(NS+".list", null, rbs);
	}
	
	@Override
	public void insert(BoardVO vo) {
		sqlSession.insert(NS+".insert", vo);
		
	}

	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".read", bno);
	}

	@Override
	public int increaseViewcnt(int bno) {
		return sqlSession.update(NS+".increaseViewcnt", bno);
		
	}
	
	
	@Override
	public int getAmount() {
		return sqlSession.selectOne(NS+".getAmount");
	}
	
	
	@Override
	public BoardVO updateUI(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".updateUI", bno);
	}
	
	
	
	@Override
	public void update(BoardVO vo) {
		sqlSession.update(NS+".update", vo);
		
	}
	
	
	@Override
	public void delete(int bno) {
		sqlSession.delete(NS+".delete", bno);
	}
	
	
}
