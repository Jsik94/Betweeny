package com.avg12.betweeny.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Service("coolservice")
@PropertySource("classpath:defaultConfig/application-com.properties")
public class CoolsmsServiceImpl implements CoolsmsService {

	/*
	 * 	Author : yoonsik
	 * 	contents : coolsms sdk로 SMS 전송 
	 * 
	 */

	
	@Value("${coolsms.apikey}")
	private String api_key;
	@Value("${coolsms.secretkey}")
	private String api_secret;
	@Value("${coolsms.agency.phone}")
	private String agency;
	
	private Coolsms sms;
	private Message coolms;
	

	
	/**
	 * 	키값을 주입받지 않았을 때는 테스트를 위해 result를 SUCC으로 강제 반환합니다. 테스트에 참고하십시오.
	 *	@author yoonsic
	 *	@param data Map으로 된 Data를 받으며, 해당 data에는 반드시 phone 이라는 키값으로 사용자 번호가 들어와야한다
	 *	@return Map<String,String> 결과값을 새 map에 담아 리턴합니다. result라는 키값으로 성공시 SUCC 실패시 FAIL을 반환합니다.
	 *
	 */
	public Map<String, String> certifiedPhoneNumber(Map<String,String> data) {
		
		Map<String, String> result =  new HashMap();
		System.out.println("키값확인");
		System.out.println("keys:"+api_key);
		System.out.println("keys:"+api_secret);
		System.out.println("agency:"+agency);
		
		//실제 배포에서는 빠질 부분
		if(api_key.isBlank() || api_secret.isBlank()) {
			System.out.println("테스트용 입니다. 사용자가 받았다고 생각하고 진행하십시오.");
			System.out.println("서버에서 발급한 인증번호는 " + data.get("authCode"));
			result.put("result","SUCC");
			return result;
		}
		
		sms = new Coolsms(api_key, api_secret);
		coolms = new Message(api_key, api_secret);
	
		
		String phoneNumber,authCode;
		phoneNumber = data.get("phone");
		authCode = data.get("authCode");
        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    // 수신전화번호
        params.put("from", agency);    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "[WEB] \n Betweeny 인증번호는" + "["+authCode+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version
        
        

        try {
            JSONObject obj = (JSONObject) coolms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
            result.put("result","FAIL");
            return result;
        }
        result.put("result","SUCC");
        return result;
    }
	
	
	
	
}
