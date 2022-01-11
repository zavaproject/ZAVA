package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO mDAO;
	
	@Override
	public List<MemberVO> list() {
		
		return mDAO.list();
	}

	@Override
	public MemberVO read(String mid) {
		return mDAO.read(mid);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return mDAO.login(vo);
	}

	@Override
	public void insert(MemberVO vo) {
		mDAO.insert(vo);
	}

	@Override
	public void update(MemberVO vo) {
		mDAO.update(vo);
	}

	@Override
	public MemberVO updateUI(String mid) {
		return mDAO.updateUI(mid);
	}

	@Override
	public void delete(MemberVO vo) {
		mDAO.delete(vo);
	}

	@Override
	public void insertoperator(MemberVO vo) {
		mDAO.insertoperator(vo);
	}

	@Override
	public MemberVO idcheck(String mid) {
		return mDAO.idcheck(mid);
	}
	
}
