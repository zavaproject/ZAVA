package kr.co.interceptor;

import java.lang.reflect.Method;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TestInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
							HttpServletResponse response, 
							Object handler)
			throws Exception {
		System.out.println("TestInterceptor_preHandle");
		
		
		HandlerMethod method = (HandlerMethod)handler;
		Method methodObj = method.getMethod();
		
		System.out.println(method.getBean());
		System.out.println(methodObj);
		
				
		return true;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, 
							HttpServletResponse response, 
							Object handler,
							ModelAndView modelAndView) throws Exception {
		
		System.out.println("TestInterceptor_postHandle");
		Map<String, Object> map = modelAndView.getModel();
		System.out.println(map);
		
		
		String msg = modelAndView.getModel().get("hello").toString();
		if(msg != null) {
			response.sendRedirect("/test/uploadajax");
		}
		
		
		
		
		
	}

}
