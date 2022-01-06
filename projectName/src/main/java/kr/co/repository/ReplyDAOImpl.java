package kr.co.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.PageTO;
import kr.co.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.reply";
	
	@Override
	public void insert(Map<String, Object> map) {
		sqlSession.insert(NS+".insert", map);
		
	}

	@Override
	public List<ReplyVO> getAllReplies(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".getAllReplies", bno);
	}

	@Override
	public void updateReply(ReplyVO rvo) {
		sqlSession.update(NS+".updateReply", rvo);
		
	}

	@Override
	public void deleteReply(int rno) {
		sqlSession.delete(NS+".deleteReply", rno);
		
	}

	@Override
	public List<ReplyVO> getRepliesPage(PageTO<ReplyVO> pt, int bno) {
		
		RowBounds rbs = new RowBounds(pt.getStartNum()-1, pt.getPerPage());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pt", pt);
		map.put("bno", bno);
		
		return sqlSession.selectList(NS+".getRepliesPage", map, rbs);
	}
	
	
	@Override
	public int getAmountReplyByBno(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".getAmountReplyByBno", bno);
	}
}
