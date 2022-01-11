package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private String NS = "kr.co.member";
	
	@Override
	public List<MemberVO> list() {
		return sqlSession.selectList(NS+".list");
	}

	@Override
	public MemberVO read(String mid) {
		return sqlSession.selectOne(NS + ".read", mid);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return sqlSession.selectOne(NS+".login", vo);
	}

	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert(NS + ".insertmember", vo);
	}

	@Override
	public void update(MemberVO vo) {
		sqlSession.update(NS+".update", vo);
	}

	@Override
	public MemberVO updateUI(String mid) {
		return sqlSession.selectOne(NS + ".updateUI", mid);
	}

	@Override
	public void delete(MemberVO vo) {
		sqlSession.delete(NS+".delete", vo);
	}

	@Override
	public void insertoperator(MemberVO vo) {
		sqlSession.insert(NS + ".insertoperator", vo);
		
	}

	@Override
	public MemberVO idcheck(String mid) {
		return sqlSession.selectOne(NS+".idcheck", mid);
	}

}
