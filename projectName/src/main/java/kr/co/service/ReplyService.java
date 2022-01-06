package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.domain.PageTO;
import kr.co.domain.ReplyVO;

public interface ReplyService {

	void insert(Map<String, Object> map);

	List<ReplyVO> getAllReplies(int bno);

	void updateReply(ReplyVO rvo);

	void deleteReply(int rno);

	PageTO<ReplyVO> getRepliesPage(PageTO<ReplyVO> pt, int bno);

	

}
