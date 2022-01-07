package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.domain.MemberVO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Inject
	private MemberService mService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		List<MemberVO> list = mService.list();

		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/read/{member}", method = RequestMethod.GET)
	public String read(@PathVariable("member") String mid, Model model) {

		MemberVO vo = mService.read(mid);

		model.addAttribute("vo", vo);

		return "member/read";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(MemberVO vo, Model model, HttpServletRequest request) {
		
		MemberVO login = mService.login(vo);
		
        HttpSession session = request.getSession();
        System.out.println(login.getMcode());
        
        session.setAttribute("login", login);
        
		return "/zava";
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
		
		return "redirect:/member/read/" + vo.getMid();
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
}
