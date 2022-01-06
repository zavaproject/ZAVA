package kr.co.repository;

import java.util.List;
import java.util.Map;

import kr.co.domain.PageTO;
import kr.co.domain.ReplyVO;

public interface ReplyDAO {

	void insert(Map<String, Object> map);

	List<ReplyVO> getAllReplies(int bno);

	void updateReply(ReplyVO rvo);

	void deleteReply(int rno);

	List<ReplyVO> getRepliesPage(PageTO<ReplyVO> pt, int bno);
	
	int getAmountReplyByBno(int bno);

	
	


}
