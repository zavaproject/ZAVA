package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.domain.MemberVO;
import kr.co.domain.OrderVO;
import kr.co.domain.PageTO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Inject
	private MemberService mService;

	@RequestMapping(value = "/list/", method = RequestMethod.GET)
	public void list(PageTO<MemberVO> pt, Model model) {
		pt = mService.list(pt);

		model.addAttribute("pt", pt);
	}
	
	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public String list(@PathVariable("curPage") int curPage, PageTO<MemberVO> pt, Model model) {
		
		pt.setCurPage(curPage);
			
		pt = mService.list(pt);

		model.addAttribute("pt", pt);
		
		return "member/list";
	}

	@RequestMapping(value = "/read/{member}", method = RequestMethod.GET)
	public String read(@PathVariable("member") String mid, Model model) {

		MemberVO vo = mService.read(mid);

		model.addAttribute("vo", vo);

		return "member/read";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(MemberVO vo, Model model, HttpServletRequest request) {
		try {
			MemberVO login = mService.login(vo);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("login", login);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/zava";
	}
	
	@RequestMapping(value = "/logincheck/{id}/{pw}", method = RequestMethod.GET)
	public ResponseEntity<Integer> logincheck(@PathVariable("id") String id, @PathVariable("pw") String pw) {
		MemberVO vo = new MemberVO(id, pw, null, null);
		ResponseEntity<Integer> res = null;
		try {
			int logincheck = mService.logincheck(vo);
			
			res = new ResponseEntity<Integer>(logincheck, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			res = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		return res;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "member/login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("redirect:/zava");
		return mav;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertUI() {

	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberVO vo) {

		mService.insert(vo);

		return "redirect:/zava";
	}

	@RequestMapping(value = "/update/{mid}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("mid") String mid, Model model) {

		MemberVO vo = mService.updateUI(mid);

		model.addAttribute("vo", vo);

		return "/member/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberVO vo) {
		mService.update(vo);

		return "redirect:/member/read/" + vo.getMid();
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(MemberVO vo, HttpSession session) {
		session.invalidate();

		mService.delete(vo);

		return "redirect:/zava";
	}

	@RequestMapping(value = "/mkoperator", method = RequestMethod.GET)
	public void insertoperatorUI() {

	}

	@RequestMapping(value = "/mkoperator", method = RequestMethod.POST)
	public String insertoperator(MemberVO vo) {

		mService.insertoperator(vo);

		return "redirect:/zava";
	}

	@RequestMapping(value = "/idcheck", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String idcheck(String mid) {
		MemberVO vo = mService.idcheck(mid);

		if (vo == null) {
			return "사용 가능한 아이디 입니다.";
		} else {
			return "이미 사용되고 있는 아이디 입니다. 다른 아이디를 이용하여 주세요.";
		}

	}

	@RequestMapping(value = "/dailysales", method = RequestMethod.GET)
	public void dailysales(Model model) 	{

		int dailysales1 = mService.dailysales1();
		model.addAttribute("dailysales1", dailysales1);
		
		int dailysales2 = mService.dailysales2();
		model.addAttribute("dailysales2", dailysales2);
		
		int dailysales3 = mService.dailysales3();
		model.addAttribute("dailysales3", dailysales3);
		
		int dailysales4 = mService.dailysales4();
		model.addAttribute("dailysales4", dailysales4);
		
		int dailysales5 = mService.dailysales5();
		model.addAttribute("dailysales5", dailysales5);
	}

	@RequestMapping(value = "/monthlysales", method = RequestMethod.GET)
	public void monthlysales(Model model) {

		int monthlysales1 = mService.monthlysales1();
		model.addAttribute("monthlysales1", monthlysales1);

		int monthlysales2 = mService.monthlysales2();
		model.addAttribute("monthlysales2", monthlysales2);

		int monthlysales3 = mService.monthlysales3();
		model.addAttribute("monthlysales3", monthlysales3);

		int monthlysales4 = mService.monthlysales4();
		model.addAttribute("monthlysales4", monthlysales4);

		int monthlysales5 = mService.monthlysales5();
		model.addAttribute("monthlysales5", monthlysales5);
	}

}
