<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- START: Head-->
    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
        <link rel="shortcut icon" href="${cp }dist/images/favicon.ico" />
        <meta name="viewport" content="width=device-width,initial-scale=1"> 
		
		<%@ include file="/WEB-INF/views/common/common_css.jsp" %>
        <link rel="stylesheet" href="${cp }/dist/vendors/social-button/bootstrap-social.css"/>   
		
        <!-- START: Custom CSS-->
        <link rel="stylesheet" href="${cp }/dist/css/main.css">
        <!-- END: Custom CSS-->
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
			$(function(){
				// 주소 검색API 호출 버튼
				$('#addrBtn').on('click',function(){
				    new daum.Postcode({
				        oncomplete: function(data) {
				            $('#base_addr').val(data.roadAddress);
				            $('#zipcode').val(data.zonecode);
				            
				            // 사용자 편의성을 위해 상세주소 입력 input 태그로 focus 설정
				            $('#detail_addr').focus();
				        }
				    }).open();
				})
				
				// 그룹명 입력 인풋 활성화
				$("input:radio[name=u_div]").on("click", function() {
					if($("#r1").is(':checked')){
						$("#group_nm").val("");
						$('#group_nm').attr("disabled", true)
					} else if($("#r2").is(':checked')){
						$('#group_nm').attr("disabled", false)
					}					
				})
				
				//////////// 정규식 /////////////
				var a = false;
				var b = false;
				var d = false;
				var e = false;
				var f = false;
				// 아이디 정규식 체크
				$('#user_id').focus(function(){
					a = false;
				});
				
				$('#user_id').blur(function(){
					if(!idcheck()) {
						$('#user_id').addClass("form-control is-invalid");
						$('#idchecklb').text("");
						return false;
					}
				});
				// 아이디 중복체크
				$("#idcheck").on('click', function(){
					if(!idcheck()) {
						$('#user_id').addClass("form-control is-invalid");
						$('#idchecklb').text("");
						return false;
					}
					var user_id = $("#user_id").val();
					
					$.ajax({
						url : "${cp }/login/idcheck",
						data : { "user_id" : user_id },
						type : 'post',
						dataType : 'json',
						success : function(res) {
							if(res.msg == "사용가능한 아이디입니다."){
								$('#idchecklb').text(res.msg).css('color','green');
								$('#user_id').removeClass("form-control is-invalid").addClass("form-control is-valid");
								$('#idspan').html("");
								a=true;
							}else{
								$('#idchecklb').text(res.msg).css('color','red');
								$('#user_id').addClass("form-control is-invalid");
								$('#idspan').html("");
							}
						},
						error : function(xhr) {
							swal({
								title: "Error",
								text: "상태 :" + xhr.status,
								type: "error",
								showCancelButton: false,
								/* cancelButtonClass: 'btn-danger', */
								confirmButtonClass: 'btn-danger',
								confirmButtonText: '확인'
							});
						}
					});
				})
				
				// 비밀번호 정규식 체크
				$('#pass').focus(function(){
					b = false;
				});
				$('#pass').blur(function(){
					if(!passcheck()) {
						$('#pass').addClass("form-control is-invalid");
						return false;
					}
					$('#pass').removeClass("form-control is-invalid").addClass("form-control is-valid");
					$('#psspan').html("");
					b = true;
				});
				
				// 비밀번호 확인 일치 체크
				$('#pass1').blur(function(){
					psvalue1 = $('#pass1').val().trim();
					if (psvalue1.length < 1) {
						$('#psspan1').html("비밀번호를 입력하시오.").css('color','red');
						$('#pass1').addClass("form-control is-invalid");
					} else if(psvalue != psvalue1) {
						$('#psspan1').html("비밀번호가 일치하지 않습니다.").css('color','red');
						$('#pass1').addClass("form-control is-invalid");
					} else {
						$('#pass1').removeClass("form-control is-invalid").addClass("form-control is-valid");
						$('#psspan1').html("");
					}
				});
				
				// 이름 정규식 체크
				$('#user_nm').focus(function(){
					d = false;
				});
				$('#user_nm').blur(function(){
					if(!namecheck()) {
						$('#user_nm').addClass("form-control is-invalid");
						return false;
					}
					$('#user_nm').removeClass("form-control is-invalid").addClass("form-control is-valid");
					$('#nmspan').html("");
					d = true;
				});
				
				// 전화번호 정규식 체크
				$('#phone').focus(function(){
					e = false;
				});
				$('#phone').blur(function(){
					if(!phonecheck()) {
						$('#phone').addClass("form-control is-invalid");
						return false;
					}
					$('#phone').removeClass("form-control is-invalid").addClass("form-control is-valid");
					$('#phspan').html("");
					e = true;
				});

				// 이메일 정규식 체크
				$('#email').focus(function(){
					f = false;
				});
				$('#email').blur(function(){
					if(!emailcheck()) {
						$('#email').addClass("form-control is-invalid");
						return false;
					}
					$('#email').removeClass("form-control is-invalid").addClass("form-control is-valid");
					$('#emspan').html("");
					f = true;
				});
				
				// 가입하기 버튼
				$('#signup').on('click', function() {
					//null 체크
					if($("#r2").prop('checked') == true && $("#group_nm").val() == "" || $("#base_addr").val() == "" || $("#detail_addr").val() == "" || $("#zipcode").val() == ""){
						swal({
							title: "Info",
							text: "입력항목을 모두 입력해주세요",
							type: "info",
							showCancelButton: false,
							confirmButtonClass: 'btn-info',
							confirmButtonText: '확인',	
							closeOnConfirm: false
						});
						return false;
					}
					if(!$("#consent").is(':checked')) {
						swal({
							title: "Info",
							text: "이용약관 및 개인정보 처리방침에 동의해야 합니다.",
							type: "info",
							showCancelButton: false,
							confirmButtonClass: 'btn-info',
							confirmButtonText: '확인',	
							closeOnConfirm: false
						});
						return false;
					}
					// 비밀번호
					var pass = $("#pass").val();
					// 비밀번호 확인
					var pass1 = $("#pass1").val();
					
					if(pass != pass1) {
						swal({
							title: "Error",
							text: "비밀번호가 일치하지 않습니다.",
							type: "error",
							showCancelButton: false,
							/* cancelButtonClass: 'btn-danger', */
							confirmButtonClass: 'btn-primary',
							confirmButtonText: '확인'
						});
						return false;
					}
					//정규식 통과 체크
					if(a==false||b==false||d==false||e==false||f==false) {
						swal({
							title: "Info",
							text: "모든 항목을 형식에 맞춰서 입력해주세요",
							type: "info",
							showCancelButton: false,
							confirmButtonClass: 'btn-info',
							confirmButtonText: '확인',	
							closeOnConfirm: false
						});
						return false;
					}
					
					swal({
						title: "Success!!",
						text: "가입 성공",
						type: "success",
						showCancelButton: false,
						/* cancelButtonClass: 'btn-danger', */
						confirmButtonClass: 'btn-success',
						confirmButtonText: '확인'
					});
					$("#frm").submit();
				})
			})
		</script>
		<script>
			//아이디 정규식 검사
			function idcheck() {
				// 아이디 - 공백, 길이, 정규식
				idvalue = $('#user_id').val().trim();
				// 아이디 정규식 - 소문자로 시작하고 대문자와 숫자를 조합가능
				idreg = /^[a-z][a-zA-Z0-9]{3,7}$/;
				
				if (idvalue.length < 1) {
					$('#idspan').html("아이디를 입력해주세요").css('color','red');
					return false;
				}
				//아이디 길이  4~8
				if(idvalue.length < 4 || idvalue.length > 8 ) {
					$('#idspan').html("아이디는 소문자로 시작, 4~8글자").css('color','red');
					return false;
				}
				if(!(idreg.test(idvalue))) {
					$('#idspan').html("아이디는 소문자로 시작, 4~8글자").css('color','red');
					return false;
				}
				return true;
			}
			
			//패스워드 정규식 검사
			function passcheck() {
				// 비밀번호 - 공백, 길이, 정규식
				psvalue = $('#pass').val().trim();
				psvalue1 = $('#pass1').val().trim();
				// 비밀번호 정규식 - 대소문자와 숫자를 조합가능
				psreg = /^([A-Z+a-z+0-9+]{8,12})$/;
				
				if(psvalue != psvalue1) {
					$('#psspan1').html("비밀번호가 일치하지 않습니다.").css('color','red');
					$('#pass1').addClass("form-control is-invalid");
				}
				else if(psvalue == psvalue1){
					if (psvalue.length < 1) {
						$('#psspan1').html("비밀번호를 입력하시오.").css('color','red');
						$('#pass1').addClass("form-control is-invalid");
					}
					else{
						$('#psspan1').html("");
						$('#pass1').removeClass("form-control is-invalid").addClass("form-control is-valid");
					}
				}
				
				if (psvalue.length < 1) {
					$('#psspan').html("비밀번호를 입력하시오.").css('color','red');
					return false;
				}
				else if(psvalue.length < 8 || psvalue.length > 12 ) {
					$('#psspan').html("비밀번호는 대소문자와 숫자를 조합한 8~12 글자").css('color','red');
					return false;
				}
				else if(!(psreg.test(psvalue))) {
					$('#psspan').html("비밀번호는 대소문자와 숫자를 조합한 8~12 글자").css('color','red');
					return false;
				}
				return true;
			}
			
			// 이름 정규식 검사
			function namecheck() {
				// 이름 - 공백, 길이, 정규식
				nmvalue = $('#user_nm').val().trim();
				// 이름 정규식 - 한글만 2 ~ 5를 입력
				nmreg = /^[가-힣]{2,5}$/;
				
				if (nmvalue.length < 1) {
					$('#nmspan').html("이름을 입력하시오.").css('color','red');
					return false;
				} else if(nmvalue.length < 2 || nmvalue.length > 5 ){			// 이름 길이 2 ~ 5 
					$('#nmspan').html("이름은 한글 2~5 글자").css('color','red');
					return false;
				} else if(!(nmreg.test(nmvalue)))  {
					$('#nmspan').html("이름은 한글 2~5 글자").css('color','red');
					return false;
				}
				return true;
			}
			
			// 전화번호 정규식 검사
			function phonecheck() {
				// 전화번호 - 공백, 정규식
				phvalue = $('#phone').val().trim();
				// 전화번호 정규식 
				phreg = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
				if (phvalue.length < 1) {
					$('#phspan').html("전화번호를 입력하시오.").css('color','red');
					return false;
				} else if(!(phreg.test(phvalue))) {
					$('#phspan').html("전화번호는 '-'를 포함하여 입력").css('color','red');
					return false;
				}
				return true;
				
			}
			
			// 이메일 정규식 검사
			function emailcheck() {
				// 이메일 - 공백, 정규식
				emvalue = $('#email').val().trim();
				// 이메일 정규식 
				emreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
				if (emvalue.length < 1) {
					$('#emspan').html("이메일을 입력하시오.").css('color','red');
					return false;
				} else if(!(emreg.test(emvalue))) {
					$('#emspan').html("이메일을 형식에 맞게 입력하시오.").css('color','red');
					return false;
				}
				return true;
			}
		</script>
    </head>
    <!-- END Head-->

    <!-- START: Body-->
    <body id="main-container" class="default">
        <!-- START: Main Content-->
        <div class="container">
            <div class="container-fluid site-width">
                <!-- START: Breadcrumbs-->
                <div class="row ">
                    <div class="col-12  align-self-center">
                        <div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
                            <div class="w-sm-100 mr-auto"><h4 class="mb-0">회원가입</h4></div>
                        </div>
                    </div>
                </div>
                <!-- END: Breadcrumbs-->

                <!-- START: Card Data-->
                <div class="row">
                    <div class="col-12 mt-4">
                        <div class="card">
                            <div class="card-header">                               
                                <h6 class="card-title">회원가입</h6>                                
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="row">                                           
                                        <div class="col-12"><br>
                                            <form id="frm" action="${cp }/login/signin" method="post">
                                            	<div class="form-group">
                                                   	<label><span style="color: red; font-weight: bold;">*</span> 이용목적</label><br>
                                                   	&nbsp; &nbsp; <input type="radio" name="purpose" value="P" checked="checked">  파트너스  &nbsp; &nbsp; &nbsp; &nbsp;   
                                                   	<input type="radio" name="purpose" value="C"> 클라이언트 &nbsp; &nbsp;   
                                                   	
                                               	</div><br>
                                            	<div class="form-row">
	                                                <div class="form-group col-md-4">
	                                                    <label><span style="color: red; font-weight: bold;">*</span> 아이디</label>
	                                                    &nbsp; &nbsp;<span id="idspan"></span>
	                                                    <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디는 소문자로 시작, 대문자와 숫자를 조합한 4~8글자">
	                                                </div>
	                                                <div class="form-group col-md-1">
	                                                	<label>&nbsp;</label>
	                                                    <input type="button" id="idcheck" class="form-control btn btn-default" value="중복확인">
	                                                </div>
	                                                <div class="form-group col-md-2">
	                                                	<br><br>
	                                                	<label id="idchecklb" style=""></label>
	                                                </div>
                                                </div>
                                                <div class="form-group">
                                                    <label><span style="color: red; font-weight: bold;">*</span> 비밀번호</label>
	                                                    &nbsp; &nbsp;<span id="psspan"></span>
                                                    <input type="password" class="form-control col-md-4" id="pass" name="pass" placeholder="비밀번호는 대소문자와 숫자를 조합한 8~12 글자">
                                                </div>
                                                <div class="form-group">
                                                    <label><span style="color: red; font-weight: bold;">*</span> 비밀번호 확인</label>
	                                                    &nbsp; &nbsp;<span id="psspan1"></span>
                                                    <input type="password" class="form-control col-md-4" id="pass1" placeholder="비밀번호는 대소문자와 숫자를 조합한 8~12 글자">
                                                </div>
                                                <div class="form-group">
                                                    <label><span style="color: red; font-weight: bold;">*</span> 이름</label>
                                                    	 &nbsp; &nbsp;<span id="nmspan"></span>
                                                    <input type="text" class="form-control col-4" id="user_nm" name="user_nm" placeholder="이름은 한글 2~5 글자">
                                                </div>
                                                <div class="form-group">
                                                   	<label><span style="color: red; font-weight: bold;">*</span> 그룹여부</label><br>
                                                   	&nbsp; &nbsp; <input type="radio" id="r1" name="u_div" value="S" checked="checked"> 개인 &nbsp; &nbsp; &nbsp; &nbsp;   
                                                   	<input type="radio" id="r2" name="u_div" value="T"> 팀 &nbsp; &nbsp;   
                                                   	<label><input type="text" class="form-control col-12" id="group_nm" name="group_nm" placeholder="그룹 이름" disabled="disabled"></label>
                                               	</div>
                                                <div class="form-group">
                                                    <label><span style="color: red; font-weight: bold;">*</span> 전화번호</label>
                                                    &nbsp; &nbsp;<span id="phspan"></span>
                                                    <input type="text" class="form-control col-4" id="phone" name="phone" placeholder="전화번호는 '-'를 포함하여 입력 (예: 010-1234-5678)">
                                                </div>
                                                <div class="form-group">
                                                    <label><span style="color: red; font-weight: bold;">*</span> 이메일</label>
                                                    &nbsp; &nbsp;<span id="emspan"></span>
                                                    <input type="text" class="form-control col-4" id="email" name="email" placeholder="email@mail.com">
                                                </div><br>
                                                <div class="form-group">
													<button type="button" id="addrBtn" class="btn btn-default">주소검색</button> 
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="inputCity"><span style="color: red; font-weight: bold;">*</span> 기본주소</label>
                                                        <input type="text" class="form-control" id="base_addr" name="base_addr">
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label for="inputState"><span style="color: red; font-weight: bold;">*</span> 상세주소</label>
                                                        <input type="text" class="form-control" id="detail_addr" name="detail_addr">
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputZip"><span style="color: red; font-weight: bold;">*</span> 우편번호</label>
                                                        <input type="text" class="form-control" id="zipcode" name="zipcode">
                                                    </div>
                                                </div><br>
                                                <div class="form-group">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="consent">
                                                        <label class="custom-control-label" for="consent">이용약관 및 개인정보 처리방침에 동의합니다. </label>
                                                    </div>
                                                </div>
                                                <button type="button" id="signup" class="btn btn-primary">가입하기</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END: Card DATA-->
            </div>
        </div>
        <!-- END: Content-->
        <%@ include file="/WEB-INF/views/common/common_js.jsp" %>
    </body>
    <!-- END: Body-->
</html>