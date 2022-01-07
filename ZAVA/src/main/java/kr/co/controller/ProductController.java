package kr.co.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.OptionVO;
import kr.co.domain.ProductVO;
import kr.co.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {

	@Inject
	private ProductService pService;
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertUI() {
		
	}
//	@RequestMapping(value = "/insert", method = RequestMethod.POST)
//	public void insert(ProductVO vo,Model model) {
//		pService.insert(vo);
//		model.addAttribute("vo", vo);
//		
//	}
	
	@RequestMapping(value = "/list/{category}", method = RequestMethod.GET)
	public String list(@PathVariable("category") int category, Model model) {
		
		List<ProductVO> list= pService.list(category);
		model.addAttribute("list", list);
		
		return "product/list";
	}
	
	@RequestMapping(value = "/read/{pid}",method = RequestMethod.GET)
	public String read(@PathVariable("pid") String pid, Model model) {
		
		ProductVO vo = pService.read(pid);
		List<OptionVO> ovo = pService.oread(pid);
		model.addAttribute("vo", vo);
		model.addAttribute("ovo", ovo);
		
		return "product/read";
	}
	
	@RequestMapping(value = "/updateui", method = RequestMethod.POST)
	public String updateui(String pid, Model model) {
		
		ProductVO vo = pService.read(pid);
		List<OptionVO> ovo = pService.oread(pid);
		model.addAttribute("vo", vo);
		model.addAttribute("ovo", ovo);
		
		return "product/update";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(String pid,String category) {
		
		pService.odelete(pid);

		return "redirect:/product/list/"+category;
	}
}
