package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.BoardVO;
import kr.co.domain.PageTO;
import kr.co.service.AttachService;
import kr.co.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Inject
	private BoardService bService;
	
	@Autowired
	private AttachService aService;
	
	
	@RequestMapping(value = "/delete/{bno}/{curPage}", method = RequestMethod.POST)
	public String delete(@PathVariable("bno") int bno, @PathVariable("curPage") int curPage) {
		
		bService.delete(bno);
		
		
		return "redirect:/board/list/"+curPage;
		
	}
	
	
	@RequestMapping(value = "/update/{bno}/{curPage}", method = RequestMethod.POST)
	public String update(@PathVariable("bno") int bno, 
						@PathVariable("curPage") int curPage, 
						BoardVO vo) {
		vo.setBno(bno);
		
		bService.update(vo);
		
		return "redirect:/board/read/"+bno+"/"+curPage;
	}
	
	@RequestMapping(value = "/updateui/{bno}/{curPage}", method = RequestMethod.GET)
	public String updateui(@PathVariable("bno") int bno, 
							@PathVariable("curPage") int curPage, 
							Model model) {
		
		BoardVO vo = bService.updateUI(bno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("curPage", curPage);
		
		
		return "board/update";
	}
	
	
	@RequestMapping(value = "/read/{bno}/{curPage}", method = RequestMethod.GET)
	public String read(@PathVariable("bno") int bno, 
						@PathVariable("curPage") int curPage, Model model) {
		BoardVO vo = bService.read(bno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("curPage", curPage);
				
		
		return "board/read";
	}
	
	@RequestMapping(value = "/read/{bno}", method = RequestMethod.GET)
	public String read(@PathVariable("bno") int bno, Model model) {
		BoardVO vo = bService.read(bno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("curPage", 1);
		
		return "board/read";
	}
	
	
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(BoardVO vo) {
		
		bService.insert(vo);
			
		
		return "redirect:/board/read/"+vo.getBno();
	}
	
	@RequestMapping(value = "/insertui", method = RequestMethod.GET)
	public String insertui() {
		
		return "board/insert";
	}
	
	
	
	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public String list(@PathVariable("curPage") int curPage, PageTO<BoardVO> pt, Model model) {
		pt.setCurPage(curPage);
		
		pt = bService.list(pt);
		
		model.addAttribute("pt", pt);
		
		return "board/list";
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(PageTO<BoardVO> pt, Model model) {
		pt = bService.list(pt);
		
		model.addAttribute("pt", pt);
	}
	
	

}
