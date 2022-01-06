package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/tgc")
public class TestGeneralController {
	
	@RequestMapping(value = "{test100, test200, test300}", method = RequestMethod.GET)
	public String test() {
		
		return "board/test2";
	}

}
