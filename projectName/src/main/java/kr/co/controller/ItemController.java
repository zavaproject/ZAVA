package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.service.ItemService;

@Controller
@RequestMapping("item")
public class ItemController {
	
	@Inject
	private ItemService iService;

}
