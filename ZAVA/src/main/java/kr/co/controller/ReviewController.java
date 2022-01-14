package kr.co.controller;

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
	
	@RequestMapping(value = "/insert/{pid}", method = RequestMethod.GET)
	public String insertui(@PathVariable("pid") String pid) {
			
		return "review/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(ReviewVO vo) {
		rService.insert(vo);
		
		return "redirect:/product/read/"+vo.getPid();
	}
	
	@RequestMapping(value = "/list/{pid}", method = RequestMethod.GET)
	public String list(@PathVariable("pid") String pid, Model model) {
		List<ReviewVO> list = rService.list(pid);
		model.addAttribute("list", list);
		
		return "review/list";		
	}
	
	@RequestMapping(value = "/read/{rno}", method = RequestMethod.GET)
	public String read(@PathVariable("rno") int rno, Model model) {
		ReviewVO vo = rService.read(rno);
		model.addAttribute("vo", vo);
		
		return "review/read";
	}
	
	@RequestMapping(value = "/updateui", method = RequestMethod.POST)
	public String updateui(int rno, Model model) {
		ReviewVO vo = rService.updateui(rno);
		model.addAttribute("vo", vo);
		
		return "review/update";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ReviewVO vo, int rno) {
		vo.setRno(rno);
		
		rService.update(vo);
		
		return "redirect:/review/read/"+rno;
	}
	
	@RequestMapping(value = "/delete/{pid}", method = RequestMethod.POST)
	public String delete(@PathVariable("pid") String pid, int rno) {
		
		rService.delete(rno);
		
		return "redirect:/product/read/"+pid;
	}
	
	
}
