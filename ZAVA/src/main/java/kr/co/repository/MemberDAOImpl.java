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
	public void insertMember(MemberVO vo) {
		sqlSession.insert(NS + ".insertMember", vo);

	}

	@Override
	public MemberVO read(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS + ".read", userid);
	}

	@Override
	public MemberVO updateUI(String userid) {
		return sqlSession.selectOne(NS + ".updateUI", userid);
	}

	@Override
	public void update(MemberVO vo) {
		sqlSession.update(NS+".update", vo);
	}

	
	@Override
	public void delete(MemberVO vo) {
		sqlSession.delete(NS+".delete", vo);
	}
	
	
	@Override
	public List<MemberVO> list() {
		return sqlSession.selectList(NS+".list");
	}
	
	@Override
	public List<MemberVO> searchByName(String username) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".searchByName", username);
	}

	@Override
	public MemberVO idcheck(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".idcheck", userid);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".login", vo);
	}

}
