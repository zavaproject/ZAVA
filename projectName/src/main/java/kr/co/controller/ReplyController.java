package kr.co.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.xml.ws.RequestWrapper;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.PageTO;
import kr.co.domain.ReplyVO;
import kr.co.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	private ReplyService rService;
	
	
	@RequestMapping(value = "{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("rno") int rno){
		ResponseEntity<String> entity = null;
		try {
			
			rService.deleteReply(rno);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "{rno}", method = RequestMethod.PUT)
	public ResponseEntity<String> updateReply(@PathVariable("rno") int rno, 
								@RequestBody Map<String, Object> map) {
		
		 ResponseEntity<String> entity = null;
		
		try {
			  String reply = (String) map.get("reply");
			  ReplyVO rvo = new ReplyVO(rno, 0, null, reply, null, null);
			
			rService.updateReply(rvo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "{bno}", method = RequestMethod.GET)
	public List<ReplyVO> getAllReplies(@PathVariable("bno") int bno){
		
		return rService.getAllReplies(bno);
	}
	
	@RequestMapping(value = "{bno}/{curPage}", method = RequestMethod.GET)
	public PageTO<ReplyVO> getRepliesPage(@PathVariable("bno") int bno, 
										@PathVariable("curPage") int curPage){

		PageTO<ReplyVO> pt = new PageTO<ReplyVO>(curPage);
		
		pt = rService.getRepliesPage(pt, bno);
		
		
		
		return pt;
	}
	
	
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity = null;
		
		try {
			rService.insert(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
		
	}

}
