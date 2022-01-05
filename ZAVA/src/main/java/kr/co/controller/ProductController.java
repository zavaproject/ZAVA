package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(ProductVO vo) {
		pService.insert(vo);
		
		return "redirect:/prodect/read/"+vo.getCategory();
	}
	
}
