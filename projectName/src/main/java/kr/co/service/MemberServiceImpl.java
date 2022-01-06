package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO mDAO;

	@Override
	public void insertMember(MemberVO vo) {
		mDAO.insertMember(vo);
		
	}

	@Override
	public MemberVO read(String userid) {
		return mDAO.read(userid);
	}

	@Override
	public MemberVO updateUI(String userid) {
		return mDAO.updateUI(userid);
	}

	@Override
	public void update(MemberVO vo) {
		// TODO Auto-generated method stub
		mDAO.update(vo);
	}

	@Override
	public void delete(MemberVO vo) {
		mDAO.delete(vo);
	}
	
	
	
	@Override
	public List<MemberVO> list() {
		
		return mDAO.list();
	}
	
	
	@Override
	public List<MemberVO> searchByName(String username) {
		// TODO Auto-generated method stub
		return mDAO.searchByName(username);
	}

	@Override
	public MemberVO idcheck(String userid) {
		// TODO Auto-generated method stub
		return mDAO.idcheck(userid);
	}
	
	

}
