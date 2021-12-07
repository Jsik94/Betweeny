package com.avg12.betweeny.aops;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class Aspects {

		/*
		 * 	Author : yoonsik
		 * 	contents : 
		 * 
		 */
		@Pointcut("execution(public * com.avg12.betweeny..*(..))")
		public void advice() {}
		
		@Around("advice()")
		public Object cross_cutting_concern(ProceedingJoinPoint point) throws Throwable {
			
			String core_concern = point.getSignature().toShortString();
			System.out.println("Target Class NAME :" + core_concern + " | START");
			
			long startTime = System.currentTimeMillis();
			
			//target
			Object object = point.proceed();
			
			
			long endTime =System.currentTimeMillis();
			
			System.out.println("Target Class NAME :" + core_concern+ " | END | Latency : " + (endTime - startTime)/1000.0 + "초");
			return object;
		}
}
