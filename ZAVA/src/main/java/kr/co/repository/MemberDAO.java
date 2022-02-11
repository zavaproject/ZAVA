package kr.co.repository;

import java.util.List;

import kr.co.domain.MemberVO;
import kr.co.domain.OrderVO;
import kr.co.domain.PageTO;

public interface MemberDAO {
	
	public List<MemberVO> list();

	public List<MemberVO> list(PageTO<MemberVO> pt);

	public MemberVO read(String mid);

	public MemberVO login(MemberVO vo);

	public void insert(MemberVO vo);

	public void update(MemberVO vo);

	public MemberVO updateUI(String mid);

	public void delete(MemberVO vo);

	public void insertoperator(MemberVO vo);

	public MemberVO idcheck(String mid);

	public int getAmount();

	public int logincheck(MemberVO vo);

	public int dailysales1();

	public int dailysales2();

	public int dailysales3();

	public int dailysales4();

	public int dailysales5();

	public int monthlysales1();

	public int monthlysales2();

	public int monthlysales3();

	public int monthlysales4();

	public int monthlysales5();

}
