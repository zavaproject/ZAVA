package kr.co.service;

import java.util.List;

<<<<<<< HEAD
=======
import kr.co.domain.PageTO;
>>>>>>> 5e8cb62 (product 90%)
import kr.co.domain.ReviewVO;

public interface ReviewService {

<<<<<<< HEAD
	void insert(ReviewVO vo);

	List<ReviewVO> list(String pid);

	ReviewVO read(int rno);

	List<ReviewVO> getReviews(String pid);

	ReviewVO updateui(int rno);

	void update(ReviewVO vo);

	void delete(int rno);


}
=======
   void insert(ReviewVO vo);

   ReviewVO read(int rno);

   List<ReviewVO> getReviews(String pid);

   ReviewVO updateui(int rno);

   void update(ReviewVO vo);

   void delete(int rno);

   PageTO<ReviewVO> list(String pid, PageTO<ReviewVO> pt);

   PageTO<ReviewVO> getReviewsPage(PageTO<ReviewVO> pt, String pid);


}
>>>>>>> 5e8cb62 (product 90%)
