package kr.co.controller;

import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String pname, Model model) {
		List<ProductVO> pList = pService.search(pname);
		if(pList.size()!=0) {
		for(int i=0; i<pList.size(); i++) {
			String pid = pList.get(i).getPid();
			List<String> files = pService.getFile(pid);
			if(files.size()!=0) {
			String file = files.get(0);
			pList.get(i).setFilename(file);
			}
		}
		}
		
		model.addAttribute("pList", pList);
		
		return "product/search";
	}
	
	
	  @RequestMapping(value = "/searchui", method = RequestMethod.GET) 
	  public void searchUI() {
	  
	  }
	 
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insertUI() {
		
	}
//	@RequestMapping(value = "/insert", method = RequestMethod.POST)
//	public void insert(ProductVO vo,Model model) {
//		pService.insert(vo);
//		model.addAttribute("vo", vo);
//		
//	}
	
	@RequestMapping(value = "/pidcheck", 
			method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String pidcheck(String pid) {
		ProductVO vo = pService.idcheck(pid);
		
		if(vo == null) {
			return "?????? ??????";
		}else {
			return "????????????";
		}

	}

	
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
		
		
		return "product/list";
	}
	
	@RequestMapping(value = "/read/{pid}",method = RequestMethod.GET)
	public String read(@PathVariable("pid") String pid, Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		
		ProductVO vo = pService.read(pid);
		List<OptionVO> ovo = pService.oread(pid);
		model.addAttribute("vo", vo);
		model.addAttribute("ovo", ovo);
		
		
		
        Cookie[] cookies = request.getCookies();
        
        // ???????????? ?????? ????????? ??????
        Cookie viewCookie = null;
 
        // ????????? ?????? ?????? 
        if (cookies != null && cookies.length > 0) 
        {
            for (int i = 0; i < cookies.length; i++)
            {
                // Cookie??? name??? cookie + reviewNo??? ???????????? ????????? viewCookie??? ????????? 
                if (cookies[i].getName().equals("cookie"+pid))
                { 
                    viewCookie = cookies[i];
                }
            }
        }
        
        if (pid != null) {
            // ?????? viewCookie??? null??? ?????? ????????? ???????????? ????????? ?????? ????????? ?????????.
            if (viewCookie == null) {

                // ?????? ??????(??????, ???)
                Cookie newCookie = new Cookie("cookie"+pid, "|" + pid + "|");
                                
                // ?????? ??????
                response.addCookie(newCookie);
 
                // ????????? ?????? ????????? ????????? ????????????
                int result = pService.productcnt(pid);
                
                if(result>0) {
                   
                }else {
                    System.out.println("????????? ?????? ??????");
                }
            }
 
            return "product/read";
        }
		

		
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
