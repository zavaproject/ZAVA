package kr.co.service;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.ReviewVO;

public interface ReviewService {

   void insert(ReviewVO vo);

   ReviewVO read(int rno);

   List<ReviewVO> getReviews(String pid);

   ReviewVO updateui(int rno);

   void update(ReviewVO vo);

   void delete(int rno);

   PageTO<ReviewVO> list(String pid, PageTO<ReviewVO> pt);

   PageTO<ReviewVO> getReviewsPage(PageTO<ReviewVO> pt, String pid);


}