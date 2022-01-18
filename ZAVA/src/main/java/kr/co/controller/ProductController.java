package kr.co.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.OptionVO;
import kr.co.domain.PageTO;
import kr.co.domain.ProductVO;
import kr.co.service.AttachService;
import kr.co.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {

	@Inject
	private ProductService pService;
	
	@Inject
	private AttachService aService;
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertUI() {
		
	}
//	@RequestMapping(value = "/insert", method = RequestMethod.POST)
//	public void insert(ProductVO vo,Model model) {
//		pService.insert(vo);
//		model.addAttribute("vo", vo);
//		
//	}
	

<<<<<<< HEAD
	@RequestMapping(value = "/list/{category}", method = RequestMethod.GET)
	public String list(@PathVariable("category") int category, Model model) {
		
		List<ProductVO> list= pService.list(category);
		List<String> pidlist = new ArrayList<String>();
		List<String> pnamelist = new ArrayList<String>();
		
		for(int i = 0; i < list.size(); i++) {
			pidlist.add(list.get(i).getPid());
		}
		for(int i = 0; i < list.size(); i++) {
			pnamelist.add(list.get(i).getPname());
		}
		
		
		model.addAttribute("pidlist", pidlist);
		model.addAttribute("pnamelist", pnamelist);
		
		model.addAttribute("list", list);
=======
	@RequestMapping(value = "/list/{category}/{curPage}", method = RequestMethod.GET)
	public String list(@PathVariable("category") int category, @PathVariable("curPage") int curPage, PageTO<ProductVO> pt,Model model) {
		pt.setCurPage(curPage);
		pt= pService.list(category,pt);
		List<String> pidlist = new ArrayList<String>();
		List<String> pnamelist = new ArrayList<String>();
		
		for(int i = 0; i <pt.getList().size();  i++) {
			pidlist.add(pt.getList().get(i).getPid());
			pnamelist.add(pt.getList().get(i).getPname());
		}
		
		
		
		model.addAttribute("pidlist", pidlist);
		model.addAttribute("pnamelist", pnamelist);
		
		model.addAttribute("pt", pt);
		
		
		return "product/list";
	}
	@RequestMapping(value = "/list/{category}/", method = RequestMethod.GET)
	public String list(@PathVariable("category") int category, Model model,PageTO<ProductVO> pt) {
		
		
		pt = pService.list(category,pt);
		
		List<String> pidlist = new ArrayList<String>();
		List<String> pnamelist = new ArrayList<String>();
		
		for(int i = 0; i <pt.getList().size();  i++) {
			pidlist.add(pt.getList().get(i).getPid());
			pnamelist.add(pt.getList().get(i).getPname());
		}
		
		
		model.addAttribute("pidlist", pidlist);
		model.addAttribute("pnamelist", pnamelist);
		
		model.addAttribute("pt", pt);
		
>>>>>>> 5e8cb62 (product 90%)
		
		
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

		return "redirect:/product/list/"+category+"/";
	}
}
