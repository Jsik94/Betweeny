package com.avg12.betweeny.member;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAO {
	
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;//static 필드 지원 안함

	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	//회원가입
	public void signUp(MemberDTO MemberDTO) {
		template.insert("memberInsert", MemberDTO);			
	}
	
	//아이디 중복확인
	public int idCheck(String id) {
		int result = template.selectOne("idCheck", id);
		return result; //아이디 존재하면 1, 없으면 0반환
	}
	
	//로그인
	public boolean isLogin(Map map) {
		int count = template.selectOne("memberLogin", map);
		return count == 1? true : false;
	}
	
    // 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
    public void keepLogin(String id, String sessionId, Date next){
         
        Map<String, Object> map = new HashMap<String,Object>();
        map.put("userId", id);
        map.put("sessionId", sessionId);
        map.put("next", next);
         
        // Mapper.xml로 데이터를 전달할 때 한 객체밖에 전달 못함으로 map으로 묶어서 보내줌 단... 주의할 점은
        // Mapper.xml 안에서 #{} 이 안에 지정한 이름이랑 같아야함.. 자동으로 매핑될 수 있도록
        // 아래가 수행되면서, 사용자 테이블에 세션id와 유효시간이 저장됨
        template.update("keepLogin",map); 
        // betweeny.mybatis.mapper.memberMapping.keepLogin 풀경로 사용해야하나?
         
    }
 
    // 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
    public MemberDTO checkUserWithSessionKey(String sessionId){
        // 유효시간이 남아있고(>now()) 전달받은 세션 id와 일치하는 사용자 정보를 꺼낸다.
        return template.selectOne("checkUserWithSessionKey",sessionId);
     
    }
    
    //회원정보 수정
    public void memberUpdate(MemberDTO MemberDTO) {
    	template.update("memberUpdate", MemberDTO);
    }
    
    //회원 탈퇴
    public void memberDelete(MemberDTO MemberDTO) {
    	template.delete("memberDelete", MemberDTO);
    }

}
