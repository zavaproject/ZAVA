package kr.co.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TestAdvice {
	
	/*
	 * @Before("execution(* kr.co.service.TestService*.*(..))") public void
	 * printLog() { System.out.println("::::::::::::before 핵심코드:::::::::::::"); }
	 * 
	 * 
	 * @After("execution(* kr.co.service.TestService*.*(..))") public void
	 * printLog2() { System.out.println("::::::::::::after 핵심코드:::::::::::::"); }
	 */
	
	
	@Around("execution(* kr.co.service.TestService*.*(..))")
	public Object printLog3(ProceedingJoinPoint pjp) throws Throwable{
		long before = System.currentTimeMillis();
		
		Object result = pjp.proceed();
		
		long after = System.currentTimeMillis();
		
		System.out.println("실행시간: "+ (after-before));
		
		return result;
	}
	

}
