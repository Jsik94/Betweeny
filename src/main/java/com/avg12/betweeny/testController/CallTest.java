package com.avg12.betweeny.testController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.avg12.betweeny.service.CoolsmsServiceImpl;
import com.avg12.betweeny.utils.NumberGen;

import net.nurigo.java_sdk.Coolsms;


//Coolsms 사용예제클래스 입니다. 보고 활용하세요.
@RestController
public class CallTest {

	Map<String, String> authManager;
	
	@Autowired
	CoolsmsServiceImpl coolservice;
	
	public CallTest() {
		// TODO Auto-generated constructor stub
		
		
		/*
		 * 	authManager 역활
		 * 	- 여러사용자들의 인증번호를 저장하기 위한 역활
		 * 	- 인증번호 발송 후, 사용자가 인증번호를 입력했을 때, 일치를 확인하기 위해 저장
		 *  - 인증확인시, 키값은 반드시 지워줘야함!
		 * 
		 */
		authManager = new HashMap<String, String>();
	}
	
	
	
	
	@RequestMapping(value = "/callsms/sendData", produces = "application/json; charset=UTF-8")
	public Map sendSMS(@RequestBody Map<String,String> map) {
		String phone = map.get("phone").toString();
		String authCode = NumberGen.getNum(4);
		map.put("authCode",authCode);
		
		//해당 번호로 인증번호를 저장
		authManager.put("phone",authCode);
		
		map = coolservice.certifiedPhoneNumber(map);
		
		//결과 전송 
		return map;
	}
}
