package com.avg12.betweeny.member;

import java.sql.Date;
import java.util.Map;

public interface MemberService {
	
	boolean isLogin(Map map); //로그인
	void signUp(MemberDTO MemberDTO); //회원가입
	int idCheck(String id); //id중복체크
	void certifiedCall(String call, int randomNumber); //휴대폰인증 
	void keepLogin(String id, String sessionId, Date next); //자동로그인 체크한경우 사용자 테이블에 세션과 유효시간 저장
	MemberDTO checkUserWithSessionKey(String sessionId); //이전에 로그인한적 있는지, 유효시간이 넘지 않은 세션 가지고있는지 체크
	void memberUpdate(MemberDTO MemberDTO); //회원정보수정
	void memberDelete(MemberDTO MemberDTO); //회원 탈퇴
}
