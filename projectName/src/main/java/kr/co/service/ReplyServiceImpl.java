package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.PageTO;
import kr.co.domain.ReplyVO;
import kr.co.repository.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO rDao;
	
	@Override
	public void insert(Map<String, Object> map) {
		rDao.insert(map);
		
	}

	@Override
	public List<ReplyVO> getAllReplies(int bno) {
		// TODO Auto-generated method stub
		return rDao.getAllReplies(bno);
	}

	@Override
	public void updateReply(ReplyVO rvo) {
		rDao.updateReply(rvo);
		
	}

	@Override
	public void deleteReply(int rno) {
		rDao.deleteReply(rno);
		
	}

	@Override
	public PageTO<ReplyVO> getRepliesPage(PageTO<ReplyVO> pt, int bno) {
		
		int amount = rDao.getAmountReplyByBno(bno);
		pt.setAmount(amount);
		
		List<ReplyVO> list = rDao.getRepliesPage(pt, bno);
		pt.setList(list);
				
		return pt;
	}

	

}
