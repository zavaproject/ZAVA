package kr.co.repository;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.ReviewVO;

public interface ReviewDAO {

   void insert(ReviewVO vo);


   ReviewVO read(int rno);

   List<ReviewVO> getReviews(String pid);

   void update(ReviewVO vo);

   void delete(int rno);

   int getAmount(String pid);

   List<ReviewVO> list(String pid, PageTO<ReviewVO> pt);


   List<ReviewVO> getReviewsPage(PageTO<ReviewVO> pt, String pid);

}
