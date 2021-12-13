<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="login.css" rel="stylesheet">
  <title>로그인</title>
</head>
<body>
 <div class="login-form">
    <div class="login">
      <h2>로그인</h2>

      <div class="login_id">
        <input type="text" placeholder="아이디를 입력하세요.">
      </div>
      <div class="login_pw">
        <input type="password" placeholder="비밀번호를 입력하세요.">
      </div>
      
      <form action="#" class="submit">
        
        <input type="submit" value="로그인">
      
      </form>

      <div class="login_etc">
        <div>
          <input type="checkbox"> 자동로그인
        </div>
        <div>
          <a href="Member.html">회원가입</a>
        </div>
      </div>


        <ul>
			<li>
		      <!-- 아래와같이 아이디를 꼭 써준다. -->
		      <a id="naverIdLogin" >
		          <span>네이버 로그인</span>
		      </a>
      </li>
			<li>
        <a href="javascript:kakaoLogin();"><img src="../img/kakao.png" style="width: 277px; height: 60px;" alt="카카오 로그인"/></a>
      </li>
      <!-- 
      <li>
        <a href="#"><img src="../img/google.png" alt="구글 로그인"/></a>
        </li>
         -->
      </ul>
    </div>
  </div>
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
  //0d80279da770afdfb1ada7019771b737
  window.Kakao.init("0d80279da770afdfb1ada7019771b737");

  function kakaoLogin() {
    window.Kakao.Auth.login({
      scope:'profile_nickname,account_email,gender,age_range,birthday',
      success: function(authObj){
        console.log(authObj);
        window.Kakao.API.request({
          url:'/v2/user/me',
          success: res=> {
            const kakao_account = res.kakao_account;
            console.log(kakao_account);
          }
        });
      }
    });
  }
</script>

<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "IDTJqfsvpsBdWUOIxuQ6",
			callbackUrl: "http://127.0.0.1:5500/Login/Naver_callback.html",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>

</body>
</html>