package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.MemberVO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Inject
	private MemberService mService;
	
	
	@RequestMapping(value = "/idcheck", 
			method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String idcheck(String userid) {
		MemberVO vo = mService.idcheck(userid);
		
		if(vo == null) {
			return "사용 가능";
		}else {
			return "사용불가";
		}
		
		
	}
	
	
	@RequestMapping(value = "/searchByName/{username}", method = RequestMethod.GET)
	public String searchByName(@PathVariable("username") String username, Model model) {
		List<MemberVO> list = mService.searchByName(username);
		
		model.addAttribute("list", list);
		
		return "/member/searchByName";
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		List<MemberVO> list = mService.list();
		
		model.addAttribute("list", list);
	}
	
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(MemberVO vo) {
		System.out.println(vo.getUserpw());
		mService.delete(vo);
		
		return "redirect:/member/";
	}
	
	
	
	@RequestMapping("/")
	public String main() {
		
		
		return "member/main";
	}
	
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberVO vo) {
		mService.update(vo);
		
		return "redirect:/member/read/"+vo.getUserid();
	}
	
	
	@RequestMapping(value = "/update/{userid}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("userid") String userid, Model model) {
		
		MemberVO vo = mService.updateUI(userid);
		
		model.addAttribute("vo", vo);
		
		return "/member/update";
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertUI() {
		
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberVO vo) {
		mService.insertMember(vo);
		
		return "redirect:/member/read/"+vo.getUserid();
	}
	

	@RequestMapping(value = "/read/{userid}", method = RequestMethod.GET)
	public String read(@PathVariable("userid") String userid, Model model) {
		
		MemberVO vo = mService.read(userid);
		
		model.addAttribute("vo", vo);
		
		return "member/read";
		
	}
	
	
	
	
	
	
}
