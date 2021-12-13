<!DOCTYPE html>
<html lang="ko">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>회원가입 페이지</title>
  <!-- 탬플릿 적용 부분 -->
  <!-- Bootstrap -->
  <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
  <!-- iCheck -->
  <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
  <!-- bootstrap-wysiwyg -->
  <link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
  <!-- Select2 -->
  <link href="../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
  <!-- Switchery -->
  <link href="../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
  <!-- starrr -->
  <link href="../vendors/starrr/dist/starrr.css" rel="stylesheet">
  <!-- bootstrap-daterangepicker -->
  <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

  <!-- Custom Theme Style -->
  <link href="../build/css/custom.min.css" rel="stylesheet">
  <!--클라이언트단에서 유효성 체크 -->
  <script src="#"></script>
</head>

<body>

  <!-- page content -->
  <div class="right_col" role="main">
    <div class="">
      <div class="page-title">
        <div class="title_left">
          <h3>회원가입</h3>
        </div>
      </div>
      <div class="clearfix"></div>
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="x_panel">
            <div class="x_title">
              <h4>회원가입정보 <small>안에 필수항목을 기입해주세요.</small></h4>
              <div class="clearfix"></div>
            </div>
            <div class="x_content">
              <br />

              <form id="demo-form3" data-parsley-validate class="form-horizontal form-label-left" action=""
                method="post"><!--컨트롤러 연결해줄 곳-->

                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id">아이디 <span class="required">*</span>
                  </label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" id="id" name="id" data-parsley-length="[6, 20]" required="required"
                      class="form-control col-md-7 col-xs-12" placeholder="아이디를 입력해주세요.">
                      <input type="button" id="idcheck" value="중복체크">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pwd">비밀번호 <span
                      class="required">*</span>
                  </label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="password" id="pwd" name="pwd" required="required"
                      data-parsley-passvalidate="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
                      class="form-control col-md-7 col-xs-12" placeholder="비밀번호를 입력해주세요.">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pwd2">비밀번호 확인 <span
                      class="required">*</span>
                  </label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="password" id="pwd2" name="pwd2" required="required" data-parsley-equalto="#pwd"
                      class="form-control col-md-7 col-xs-12" placeholder="비밀번호를 한번 더 입력해주세요.">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">이름 <span class="required">*</span>
                  </label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" id="name" name="name" required="required"
                      class="form-control col-md-7 col-xs-12" placeholder="이름을 입력해주세요.">
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="call">전화번호<span class="tel"
                      required="true">*</span></label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" id="call" name="call" class="form-control call col-md-7 col-xs-12"
                      data-parsley-pattern="\d{3}-\d{4}-\d{4}" required="required" placeholder="전화번호를 입력해주세요.">
                  </div>
                  <button type="button" id="requestnumber" class="requestnumber">인증번호전송</button>
                </div>
                <div id="agree" class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                  <div class="col-md-7 col-xs-12">아래의 인증번호를 입력해주세요</div>
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">인증번호 입력란<span class=required></label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" id="agrnum" name="agrnum" data-parsley-number="" required="required"
                      class="form-control col-md-7 col-xs-12" placeholder="인증번호를 입력하세요.">    
                      <button type="button" id="sendnumber" class="sendnumber" onclick="phoneCheck();">전송</button>                
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">성별</label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                  <div class="col-md-7 col-xs-12">
                        <input type="radio" id="male" name="gender" value="male"> &nbsp; 남성 &nbsp;                    
                        <input type="radio" id="female" name="gender" value="female"> 여성
                  </div>
                </div>
                </div>
                <div class="form-group">
                  <div class="control-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">생년월일 <span class="required">*</span>
                    </label>
                    <div class="controls">
                      <div class="col-md-6 col-sm-6 col-xs-12 xdisplay_inputx form-group has-feedback">
                        <input type="text" class="form-control has-feedback-left" id="single_cal3" name="birthday" class="birthday"
                          placeholder="생년월일을 입력해주세요" aria-describedby="inputSuccess2Status3">
                        <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                        <span id="inputSuccess2Status3" class="sr-only">(success)</span>
                        <div class="col-md-3">
                          <div
                            class="daterangepicker dropdown-menu ltr single opensright show-calendar picker_3 xdisplay">
                            <div class="calendar left single" style="display: block;">
                              <div class="daterangepicker_input"><input class="input-mini form-control active"
                                  type="text" name="daterangepicker_start" value="" style="display: none;"><i
                                  class="fa fa-calendar glyphicon glyphicon-calendar" style="display: none;"></i>
                                <div class="calendar-time" style="display: none;">
                                  <div></div><i class="fa fa-clock-o glyphicon glyphicon-time"></i>
                                </div>
                              </div>
                              <div class="calendar-table">
                                <table class="table-condensed">
                                  <thead>
                                    <tr>
                                      <th class="prev available"><i
                                          class="fa fa-chevron-left glyphicon glyphicon-chevron-left"></i></th>
                                      <th colspan="5" class="month">Oct 2016</th>
                                      <th class="next available"><i
                                          class="fa fa-chevron-right glyphicon glyphicon-chevron-right"></i></th>
                                    </tr>
                                    <tr>
                                      <th>Su</th>
                                      <th>Mo</th>
                                      <th>Tu</th>
                                      <th>We</th>
                                      <th>Th</th>
                                      <th>Fr</th>
                                      <th>Sa</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="weekend off available" data-title="r0c0">25</td>
                                      <td class="off available" data-title="r0c1">26</td>
                                      <td class="off available" data-title="r0c2">27</td>
                                      <td class="off available" data-title="r0c3">28</td>
                                      <td class="off available" data-title="r0c4">29</td>
                                      <td class="off available" data-title="r0c5">30</td>
                                      <td class="weekend available" data-title="r0c6">1</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend available" data-title="r1c0">2</td>
                                      <td class="available" data-title="r1c1">3</td>
                                      <td class="available" data-title="r1c2">4</td>
                                      <td class="available" data-title="r1c3">5</td>
                                      <td class="available" data-title="r1c4">6</td>
                                      <td class="available" data-title="r1c5">7</td>
                                      <td class="weekend available" data-title="r1c6">8</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend available" data-title="r2c0">9</td>
                                      <td class="available" data-title="r2c1">10</td>
                                      <td class="available" data-title="r2c2">11</td>
                                      <td class="available" data-title="r2c3">12</td>
                                      <td class="available" data-title="r2c4">13</td>
                                      <td class="available" data-title="r2c5">14</td>
                                      <td class="weekend available" data-title="r2c6">15</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend available" data-title="r3c0">16</td>
                                      <td class="available" data-title="r3c1">17</td>
                                      <td class="today active start-date active end-date available" data-title="r3c2">18
                                      </td>
                                      <td class="available" data-title="r3c3">19</td>
                                      <td class="available" data-title="r3c4">20</td>
                                      <td class="available" data-title="r3c5">21</td>
                                      <td class="weekend available" data-title="r3c6">22</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend available" data-title="r4c0">23</td>
                                      <td class="available" data-title="r4c1">24</td>
                                      <td class="available" data-title="r4c2">25</td>
                                      <td class="available" data-title="r4c3">26</td>
                                      <td class="available" data-title="r4c4">27</td>
                                      <td class="available" data-title="r4c5">28</td>
                                      <td class="weekend available" data-title="r4c6">29</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend available" data-title="r5c0">30</td>
                                      <td class="available" data-title="r5c1">31</td>
                                      <td class="off available" data-title="r5c2">1</td>
                                      <td class="off available" data-title="r5c3">2</td>
                                      <td class="off available" data-title="r5c4">3</td>
                                      <td class="off available" data-title="r5c5">4</td>
                                      <td class="weekend off available" data-title="r5c6">5</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="calendar right" style="display: none;">
                              <div class="daterangepicker_input"><input class="input-mini form-control" type="text"
                                  name="daterangepicker_end" value="" style="display: none;"><i
                                  class="fa fa-calendar glyphicon glyphicon-calendar" style="display: none;"></i>
                                <div class="calendar-time" style="display: none;">
                                  <div></div><i class="fa fa-clock-o glyphicon glyphicon-time"></i>
                                </div>
                              </div>
                              <div class="calendar-table">
                                <table class="table-condensed">
                                  <thead>
                                    <tr>
                                      <th></th>
                                      <th colspan="5" class="month">Nov 2016</th>
                                      <th class="next available"><i
                                          class="fa fa-chevron-right glyphicon glyphicon-chevron-right"></i></th>
                                    </tr>
                                    <tr>
                                      <th>Su</th>
                                      <th>Mo</th>
                                      <th>Tu</th>
                                      <th>We</th>
                                      <th>Th</th>
                                      <th>Fr</th>
                                      <th>Sa</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="weekend off available" data-title="r0c0">30</td>
                                      <td class="off available" data-title="r0c1">31</td>
                                      <td class="available" data-title="r0c2">1</td>
                                      <td class="available" data-title="r0c3">2</td>
                                      <td class="available" data-title="r0c4">3</td>
                                      <td class="available" data-title="r0c5">4</td>
                                      <td class="weekend available" data-title="r0c6">5</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend available" data-title="r1c0">6</td>
                                      <td class="available" data-title="r1c1">7</td>
                                      <td class="available" data-title="r1c2">8</td>
                                      <td class="available" data-title="r1c3">9</td>
                                      <td class="available" data-title="r1c4">10</td>
                                      <td class="available" data-title="r1c5">11</td>
                                      <td class="weekend available" data-title="r1c6">12</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend available" data-title="r2c0">13</td>
                                      <td class="available" data-title="r2c1">14</td>
                                      <td class="available" data-title="r2c2">15</td>
                                      <td class="available" data-title="r2c3">16</td>
                                      <td class="available" data-title="r2c4">17</td>
                                      <td class="available" data-title="r2c5">18</td>
                                      <td class="weekend available" data-title="r2c6">19</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend available" data-title="r3c0">20</td>
                                      <td class="available" data-title="r3c1">21</td>
                                      <td class="available" data-title="r3c2">22</td>
                                      <td class="available" data-title="r3c3">23</td>
                                      <td class="available" data-title="r3c4">24</td>
                                      <td class="available" data-title="r3c5">25</td>
                                      <td class="weekend available" data-title="r3c6">26</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend available" data-title="r4c0">27</td>
                                      <td class="available" data-title="r4c1">28</td>
                                      <td class="available" data-title="r4c2">29</td>
                                      <td class="available" data-title="r4c3">30</td>
                                      <td class="off available" data-title="r4c4">1</td>
                                      <td class="off available" data-title="r4c5">2</td>
                                      <td class="weekend off available" data-title="r4c6">3</td>
                                    </tr>
                                    <tr>
                                      <td class="weekend off available" data-title="r5c0">4</td>
                                      <td class="off available" data-title="r5c1">5</td>
                                      <td class="off available" data-title="r5c2">6</td>
                                      <td class="off available" data-title="r5c3">7</td>
                                      <td class="off available" data-title="r5c4">8</td>
                                      <td class="off available" data-title="r5c5">9</td>
                                      <td class="weekend off available" data-title="r5c6">10</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="ranges" style="display: none;">
                              <div class="range_inputs"><button class="applyBtn btn btn-sm btn-success"
                                  type="button">Apply</button> <button class="cancelBtn btn btn-sm btn-default"
                                  type="button">Cancel</button></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email"
                    data-parsley-type="email">이메일<span class="required">*</span></label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="email" id="email" name="email" required="true" class="form-control col-md-7 col-xs-12"
                      name="email" placeholder="이메일을 입력해주세요.">
                  </div>
                </div>
                <div class="ln_solid"></div>
                <div class="form-group">
                  <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-5 col-sm-offset-5 col-xs-offset-5">
                    <!-- 회원가입 정보 확인 후 정보입력 요청 후 메인페이지로 -->
                    <button type="submit" class="addmem btn btn-success">회원가입</button>
                    </div>
                </div>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- footer content -->
  <footer>
    <div class="pull-right">
    </div>
    <div class="clearfix" style="float: right;" >(153-759) 서울시 금천구 가산동 426-5 월드메르디앙 2차 413호<a href="#">(주)한국소프트웨어아이엔씨</a></div>
  </footer>
  <!-- /footer content -->

  <!-- jQuery -->
  <script src="../vendors/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- FastClick -->
  <script src="../vendors/fastclick/lib/fastclick.js"></script>
  <!-- NProgress -->
  <script src="../vendors/nprogress/nprogress.js"></script>
  <!-- bootstrap-progressbar -->
  <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
  <!-- iCheck -->
  <script src="../vendors/iCheck/icheck.min.js"></script>
  <!-- bootstrap-daterangepicker -->
  <script src="../vendors/moment/min/moment.min.js"></script>
  <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- bootstrap-wysiwyg -->
  <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
  <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
  <script src="../vendors/google-code-prettify/src/prettify.js"></script>
  <!-- jQuery Tags Input -->
  <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
  <!-- Switchery -->
  <script src="../vendors/switchery/dist/switchery.min.js"></script>
  <!-- Select2 -->
  <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
  <!-- Parsley -->
  <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
  <!-- Autosize -->
  <script src="../vendors/autosize/dist/autosize.min.js"></script>
  <!-- jQuery autocomplete -->
  <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
  <!-- starrr -->
  <script src="../vendors/starrr/dist/starrr.js"></script>
  <!-- Custom Theme Scripts -->
  <script src="../build/js/custom.min.js"></script>

  <!--페이지 사용 스크립트-->
  <script>   
    $('#agree').hide();
  </script>
  <!--인증번호 이벤트-->
  <script>  
    $(function () {
      var tg = false;
      $(".requestnumber").attr('onclick', '').unbind('click');        
      $('.requestnumber').on('click', function () {       
        if ($('#call').val() != '') {
          var regxp = new RegExp("01[0-9]{1}-[0-9]{4}-[0-9]{4}");
          console.log("패턴 결과 : ", regxp.test($('#call').val()))
          $.ajax({
              url: "<%=request.getContextPath()%>/url",//컨트롤러입력필요.
              data: {code: regxp.test($('#call').val())},
              type: "post",
              success: function(data) {
                if (data.result == "SUCC") {
                  console.log(data.result); 
                  if (regxp.test($('#call').val())) {
                      if (!tg) {             
                        $('#agree').toggle(300,//토글링이 총 걸리는 시간 설정(천분의 1초)
                          function () {
                            console.log('토글링이 완료되었어요');
                            $('#call').attr('disabled', 'true');
                          });
                        tg = true;
                      }
                    } else {
                      alert('전화번호 형태로 눌러주세요')
                    }
                  } 
                else {
                  alert("인증번호 전송 실패"); 
                  }
                }
          });
          
        }
      });
    })
  </script>

  <script>
     
          
            function phoneCheck() {
              $.ajax({
                url:"<%=request.getContextPath()%>/url",//컨트롤러입력필요.
                type: "post",
                data: { code: $("#sendnumber").val() },
                success: function(data) {
                  if (data.result == "SUCC") {
                    alert("번호 인증 성공");
                    $('#agrnum').attr('disabled', 'true');
                  }                   
                  else {
                    alert("번호 인증 실패");
                  } 
                } 
              }); 
            }   
  </script>

  <!-- 회원가입 정보 보내기-->
  <script>
    $(function(){
      $('.addmem').attr('onclick', '').unbind('click');
      $('.addmem').click(function () {          
        var params= {
          id : $('#id').val(),
          pwd : $('#pwd').val(),
          name : $('#name').val(),
          call : $('#call').val(),
          birthday : $('#single_cal3').val()
        };
        console.log(params)
      $.ajax({  
        url:"<%=request.getContextPath()%>/url",//연동할 컨트롤러 url    
        type:'post',       
        dataType:'json',
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        data:params,             
        success:function(data){     
          console.log(data);
          if (data.result == "SUCC") {
                    alert("회원 가입 성공");
                  }                   
                  else {
                    alert("회원 가입에 실패");
                  } 
        }, 
        error:function(){  
            alert("항목에 확인을 하지않은 값이 있습니다.");  
        } 
      } )
    });  
      
    })
  </script> 
  <!-- 파슬리 유효성 추가-->
  <script type="text/javascript">
    window.Parsley
      .addValidator('passvalidate', {
        requirementType: 'string',
        validateString: function (value, requirement) {

          console.log('<!---- custom valid ------>')
          var regxp = new RegExp(requirement);
          regxp.test(value)
          console.log(regxp)
          return regxp.test(value);
        }
      });

    window.Parsley
      .addValidator('agrNum', {
        requirementType: 'string',
        validateString: function (value, requirement) {

          console.log('<!---- 인증확인 ------>')
          console.log('requirement', requirement)
          var regxp = new RegExp(requirement);
          console.log(regxp);
          regxp.test(value)
          return regxp.test(value);
        }
      });

    function init_parsley() {

      if (typeof (parsley) === 'undefined') { return; }
      console.log('init_parsley');

      $/*.listen*/('parsley:field:validate', function () {
        console.log('작동감지1');
        validateFront();
      });


      $/*.listen*/('parsley:field:validate', function () {
        console.log('작동감지2');
        validateFront();
      });

      $('#demo-form3 .btn').not('#requestnumber ,#back').on('click', function () {
        console.log('작동감지5-5');
        console.log(this);
        $('#demo-form3').parsley().validate();
        validateFront();
      });


      var validateFront = function () {
        if (true === $('#demo-form3').parsley().isValid()) {
          console.log('작동감지6');
          $('.bs-callout-info').removeClass('hidden');
          $('.bs-callout-warning').addClass('hidden');
        } else {
          console.log('작동감지7');
          $('.bs-callout-info').addClass('hidden');
          $('.bs-callout-warning').removeClass('hidden');
        }
      };

      try {
        hljs.initHighlightingOnLoad();
      } catch (err) { }

    };


    $(document).ready(function () {

      init_parsley();

      $('#gender,#male,#female').removeAttr('onClick', "");

      $('#gender,#male,#female').on('click', function () {
        
      })
     //아이디 중복체크      
     /*
      $('#check').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/idCheck.do",
				type: "GET",
				data:{
					"id":$('#id').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#id').val()) != '' ){
						idx=true;
						$('#id').attr('disabled','true');
						var html="<tr><td colspan='3' style='color: green'>사용가능한 아이디 입니다.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}else{

						var html="<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
      */
    })


    function fnGoback() {
      history.back();
    }

    var calltest = document.getElementById('call');
    calltest.addEventListener("keydown", function (e) {
      if ((this.value.length == 3 || this.value.length == 8) && e.code != "Backspace") {
        this.value = this.value + '-';
      }
    })

  //유효성 메시지 출력값
    Parsley.addMessages('ko', {
      defaultMessage: "잘못된 값 입니다.",
      type: {
        email: "이메일을 입력해주세요.",
        url: "주소를 입력해주세요.",
        number: "숫자가 아닙니다.",
        integer: "유효한 정수값이 아닙니다.",
        digits: "숫자만 입력해주세요.",
        alphanum: "영어또는 숫자만 입력해주세요."
      },
      // notblank: "빈칸을 채워주세요.",
      required: "빈칸을 채워주세요",
      pattern: "값이 잘못되었습니다.",
      min: "이 값은  %s 이상이어야합니다.",
      max: "이 값은 %s보다 작거나 같아야합니다.",
      range: "이 값은 %s 에서 %s 사이여야합니다.",
      minlength: "길이가 너무 짧습니다 %s자 이상입력하여야 합니다.",
      maxlength: "길이가 너무 깁니다. %s자 이하여야 합니다.",
      length: "값의 길이가 잘못되었습니다. 길이는 %s~%s자여야 합니다.",
      mincheck: "%s개 이상의 선택 항목을 선택해야 합니다.",
      maxcheck: "%s개 이하의 선택 항목을 선택해야 합니다.",
      check: "%s 및 %s 중에서 선택해야 합니다.",
      equalto: "비밀번호는 같아야 합니다.",
      passvalidate: "최소 8 자, 최소 하나의 문자 및 하나의 숫자를 입력하세요.",
      argeeNum:"인증번호를 맞게 입력하세요"
    });

    Parsley.setLocale('ko');
  </script>
</body>
</html>