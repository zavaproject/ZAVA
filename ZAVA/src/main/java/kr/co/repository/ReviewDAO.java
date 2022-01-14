package kr.co.repository;

import java.util.List;

import kr.co.domain.ReviewVO;

public interface ReviewDAO {

	void insert(ReviewVO vo);

	List<ReviewVO> list(String pid);

	ReviewVO read(int rno);

	List<ReviewVO> getReviews(String pid);

	void update(ReviewVO vo);

	void delete(int rno);

}
