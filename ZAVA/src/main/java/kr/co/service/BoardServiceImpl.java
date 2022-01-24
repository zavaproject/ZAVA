package kr.co.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.BoardVO;
import kr.co.domain.PageTO;
import kr.co.repository.AttachDAO;
import kr.co.repository.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO bDao;
	
	@Autowired
	private AttachDAO aDao; 

	@Override
	public PageTO<BoardVO> list(PageTO<BoardVO> pt) {
		
		int amount = bDao.getAmount();
		pt.setAmount(amount);
		
		List<BoardVO> list = bDao.list(pt);
		pt.setList(list);

		return pt;
	}

	@Transactional
	@Override
	public void insert(BoardVO vo) {
		bDao.insert(vo);
		
	}

	@Transactional
	@Override
	public BoardVO read(int bno) {
		
		
		
		return bDao.read(bno);
	}
	@Override
	public int increaseViewcnt(int bno) {
		// TODO Auto-generated method stub
		return bDao.increaseViewcnt(bno);
	}

	@Override
	public BoardVO updateUI(int bno) {
		// TODO Auto-generated method stub
		return bDao.updateUI(bno);
	}
	
	@Override
	public void update(BoardVO vo) {
		bDao.update(vo);
		
	}
	
	
	@Override
	public void delete(int bno) {
		bDao.delete(bno);
		
	}
	
	
	
	
	
	
	
	
	
}
