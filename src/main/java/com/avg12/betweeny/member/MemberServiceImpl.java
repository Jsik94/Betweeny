package com.avg12.betweeny.member;

import java.sql.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name="memberDAO")
	private MemberDAO dao;

	@Override
	public boolean isLogin(Map map) {
		return dao.isLogin(map);
	}

	@Override
	public void signUp(MemberDTO MemberDTO) {
		dao.signUp(MemberDTO);
	}

	@Override
	public int idCheck(String id) {		
		return dao.idCheck(id);
		//return null; 
	}

	@Override
	public void certifiedCall(String call, int randomNumber) {
		/*
		String api_key = "coolsms 본인 API키 입력"; 
		String api_secret = "coolsms 본인 API_secret키 입력"; 
		Message coolsms = new Message(api_key, api_secret); 
		HashMap<String, String> params = new HashMap<String, String>(); 
		params.put("to", userPhoneNumber); // 수신전화번호 params.put("from", "자신의 번호"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		params.put("type", "SMS"); params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력 
		params.put("app_version", "test app 1.2");

		try { 
			JSONObject obj = (JSONObject) coolsms.send(params); 
			System.out.println(obj.toString());
		}catch (CoolsmsException e) { 
			System.out.println(e.getMessage()); 
			System.out.println(e.getCode()); 
			}
		
		String saveCode;
		if(code.equals(saveCode)) {
			return "ok";
		}
		else {
			return "no";
		}
		*/
	}

	@Override
	public void keepLogin(String id, String sessionId, Date next) {
		dao.keepLogin(id, sessionId, next);
		
	}

	@Override
	public MemberDTO checkUserWithSessionKey(String sessionId) {
		return dao.checkUserWithSessionKey(sessionId);
	}

	
	//회원정보 수정
	@Override
	public void memberUpdate(MemberDTO MemberDTO) {
		dao.memberUpdate(MemberDTO);		
	}

	//회원 탈퇴
	@Override
	public void memberDelete(MemberDTO MemberDTO) {
		dao.memberDelete(MemberDTO);
		
	}

	
}
