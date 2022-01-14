package kr.co.service;

import java.util.List;

import kr.co.domain.ReviewVO;

public interface ReviewService {

	void insert(ReviewVO vo);

	List<ReviewVO> list(String pid);

	ReviewVO read(int rno);

	List<ReviewVO> getReviews(String pid);

	ReviewVO updateui(int rno);

	void update(ReviewVO vo);

	void delete(int rno);


}
