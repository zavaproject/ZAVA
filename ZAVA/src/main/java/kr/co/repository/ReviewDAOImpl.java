package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Inject 
	private SqlSession sqlSession;
	private String NS = "kr.co.review";
	
	@Override
	public void insert(ReviewVO vo) {
		sqlSession.insert(NS+".insert", vo);
		
	}
	
	@Override
	public List<ReviewVO> list(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".list", pid);
	}
	
	@Override
	public ReviewVO read(int rno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".read", rno);
	}
	
	@Override
	public List<ReviewVO> getReviews(String pid) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(NS+".getReviews", pid);
	}
	
	@Override
	public void update(ReviewVO vo) {
		// TODO Auto-generated method stub
		
		sqlSession.update(NS+".update", vo);
	}
	
	@Override
	public void delete(int rno) {
		// TODO Auto-generated method stub
		sqlSession.delete(NS+".delete", rno);
	}
}
