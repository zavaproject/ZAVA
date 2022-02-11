package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.domain.OrderVO;
import kr.co.domain.PageTO;
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

	@Override
	public PageTO<MemberVO> list(PageTO<MemberVO> pt) {
		int amount = mDAO.getAmount();
		pt.setAmount(amount);
		
		List<MemberVO> list = mDAO.list(pt);
		pt.setList(list);

		return pt;
	}

	@Override
	public int logincheck(MemberVO vo) {
		return  mDAO.logincheck(vo);
	}

	@Override
	public int dailysales1() {
		return mDAO.dailysales1();
	}

	@Override
	public int dailysales2() {
		return mDAO.dailysales2();
	}

	@Override
	public int dailysales3() {
		return mDAO.dailysales3();
	}

	@Override
	public int dailysales4() {
		return mDAO.dailysales4();
	}

	@Override
	public int dailysales5() {
		return mDAO.dailysales5();
	}

	@Override
	public int monthlysales1() {
		return mDAO.monthlysales1();
	}

	@Override
	public int monthlysales2() {
		return mDAO.monthlysales2();
	}

	@Override
	public int monthlysales3() {
		return mDAO.monthlysales3();
	}

	@Override
	public int monthlysales4() {
		return mDAO.monthlysales4();
	}

	@Override
	public int monthlysales5() {
		return mDAO.monthlysales5();
	}
	
}
