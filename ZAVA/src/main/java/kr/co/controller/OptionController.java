package kr.co.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.OptionVO;
import kr.co.domain.ProductVO;
import kr.co.service.ProductService;

@RestController
@RequestMapping("/options")
public class OptionController {
	
	@Inject
	private ProductService pService;
	
	@RequestMapping(value = "",method = RequestMethod.POST)
	public ResponseEntity<String> oinsert(@RequestBody OptionVO ovo){
	 ResponseEntity<String> entity = null;
		try {
			
			pService.oinsert(ovo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
	 
	return entity;	
 }
	@RequestMapping(value = "/pinsert",method = RequestMethod.POST)
	public ResponseEntity<String> pinsert(@RequestBody ProductVO pvo){
	 ResponseEntity<String> entity = null;
		try {
			
			pService.insert(pvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
	 
	return entity;	
 }
	
	@RequestMapping(value = "/pupdate",method = RequestMethod.POST)
	public ResponseEntity<String> pupdate(@RequestBody ProductVO pvo){
		
		ResponseEntity<String> entity = null;
		try {
			
			pService.pupdate(pvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
	 
	return entity;
	}
	
	@RequestMapping(value = "/oupdate",method = RequestMethod.POST)
	public ResponseEntity<String> oupdate(@RequestBody OptionVO ovo){
	 ResponseEntity<String> entity = null;
		try {
			
			pService.oupdate(ovo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
	 
	return entity;	
 }
}
