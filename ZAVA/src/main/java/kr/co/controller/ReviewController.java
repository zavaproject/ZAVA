package kr.co.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.PageTO;
import kr.co.domain.ReviewVO;
import kr.co.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
   
   @Inject
   private ReviewService rService;
   
   @RequestMapping(value = "{pid}", method = RequestMethod.GET)
   @ResponseBody
   public List<ReviewVO> getReviews(@PathVariable("pid") String pid){

      return rService.getReviews(pid);
   }
   
   @RequestMapping(value = "{pid}/{curPage}", method = RequestMethod.GET)
   @ResponseBody
   public PageTO<ReviewVO> getReviewsPage(@PathVariable("pid") String pid, @PathVariable("curPage") int curPage){
      PageTO<ReviewVO> pt = new PageTO<ReviewVO>(curPage);
      
      pt = rService.getReviewsPage(pt, pid);
      
      return pt;
   }
   
   @RequestMapping(value = "/insert/{pid}", method = RequestMethod.GET)
   public String insertui(@PathVariable("pid") String pid) {
         
      return "review/insert";
   }
   
   @RequestMapping(value = "/insert", method = RequestMethod.POST)
   public String insert(ReviewVO vo) {
      rService.insert(vo);
      
      return "redirect:/product/read/"+vo.getPid();
   }
   
   /*
    * @RequestMapping(value = "/list/{pid}", method = RequestMethod.GET) public
    * String list(@PathVariable("pid") String pid, Model model) { List<ReviewVO>
    * list = rService.list(pid); model.addAttribute("list", list);
    * 
    * return "review/list"; }
    */
   
   @RequestMapping(value = "/list/{pid}/", method = RequestMethod.GET)
   public String list(@PathVariable("pid") String pid, Model model, PageTO<ReviewVO> pt) {
      pt = rService.list(pid,pt);
      
      List<ReviewVO> rlist = new ArrayList<ReviewVO>();
      
      for(int i=0; i<pt.getList().size(); i++) {
         rlist.add(pt.getList().get(i));
      }
      
      model.addAttribute("rlist", rlist);
      model.addAttribute("pt", pt);
      
      return "review/list";      
   }
   
   @RequestMapping(value = "/list/{pid}/{curPage}", method = RequestMethod.GET)
   public String list(@PathVariable("pid") String pid, @PathVariable("curPage") int curPage, PageTO<ReviewVO> pt ,Model model) {
      pt.setCurPage(curPage);
      pt = rService.list(pid,pt);
      
      List<ReviewVO> rlist = new ArrayList<ReviewVO>();

      for (int i = 0; i < pt.getList().size(); i++) {
         rlist.add(pt.getList().get(i));
      }

      model.addAttribute("rlist", rlist);
      
      model.addAttribute("pt", pt);

      
      return "review/list";      
   }
   
   
   @RequestMapping(value = "/read/{rno}/{curPage}", method = RequestMethod.GET)
   public String read(@PathVariable("rno") int rno, @PathVariable("curPage") int curPage, Model model) {
      ReviewVO vo = rService.read(rno);
      model.addAttribute("vo", vo);
      model.addAttribute("curPage", curPage);
      
      return "review/read";
   }
   
   @RequestMapping(value = "/updateui/{curPage}", method = RequestMethod.POST)
   public String updateui(int rno, @PathVariable("curPage") int curPage, Model model) {
      ReviewVO vo = rService.updateui(rno);
      model.addAttribute("vo", vo);
      model.addAttribute("curPage", curPage);
      return "review/update";
   }
   
   @RequestMapping(value = "/update/{curPage}", method = RequestMethod.POST)
   public String update(ReviewVO vo, int rno, @PathVariable("curPage") int curPage) {
      vo.setRno(rno);
      
      rService.update(vo);
      
      return "redirect:/review/read/"+rno+"/"+curPage;
   }
   
   @RequestMapping(value = "/delete/{pid}", method = RequestMethod.POST)
   public String delete(@PathVariable("pid") String pid, int rno) {
      
      rService.delete(rno);
      
      return "redirect:/product/read/"+pid;
   }
   
   
}