package kr.co.service;

import java.util.List;

import kr.co.domain.MemberVO;
import kr.co.domain.PageTO;

public interface MemberService {

	public List<MemberVO> list();

	public MemberVO read(String mid);

	public MemberVO login(MemberVO vo);

	public void insert(MemberVO vo);

	public void update(MemberVO vo);

	public MemberVO updateUI(String mid);

	public void delete(MemberVO vo);

	public void insertoperator(MemberVO vo);

	public MemberVO idcheck(String mid);

	public PageTO<MemberVO> list(PageTO<MemberVO> pt);

	public int logincheck(MemberVO vo);

	
}
