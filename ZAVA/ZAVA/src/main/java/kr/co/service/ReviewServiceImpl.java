package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.PageTO;
import kr.co.domain.ReviewVO;
import kr.co.repository.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
   @Inject
   private ReviewDAO rDao;
   
   @Override
   public void insert(ReviewVO vo) {
      rDao.insert(vo);
   }
   
   
   @Override
   public ReviewVO read(int rno) {
      // TODO Auto-generated method stub
      return rDao.read(rno);
   }
   
   @Override
   public List<ReviewVO> getReviews(String pid) {
      // TODO Auto-generated method stub
      
      
      return rDao.getReviews(pid);
   }
   
   @Override
   public ReviewVO updateui(int rno) {
      // TODO Auto-generated method stub
      return rDao.read(rno);
   }
   
   @Override
   public void update(ReviewVO vo) {
      // TODO Auto-generated method stub
      rDao.update(vo);
   }
   
   @Override
   public void delete(int rno) {
      // TODO Auto-generated method stub
      rDao.delete(rno);
   }
   
   @Override
   public PageTO<ReviewVO> list(String pid, PageTO<ReviewVO> pt) {
      // TODO Auto-generated method stub
      
      int amount = rDao.getAmount(pid);
      pt.setAmount(amount);
      
      List<ReviewVO> list = rDao.list(pid,pt);
      pt.setList(list);
      
      
      
      return pt;
   }
   
   @Override
   public PageTO<ReviewVO> getReviewsPage(PageTO<ReviewVO> pt, String pid) {
      // TODO Auto-generated method stub
      int amount = rDao.getAmount(pid);
      pt.setAmount(amount);
      
      List<ReviewVO> list = rDao.getReviewsPage(pt,pid);
      pt.setList(list);
      
      
      
      return pt;
   }
   
   
}
