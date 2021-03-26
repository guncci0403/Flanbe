<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- START: Head-->
    <head>
        <meta charset="UTF-8">
        <title>로그인</title>
        <link rel="shortcut icon" href="${cp }/dist/images/favicon.ico" />
        <meta name="viewport" content="width=device-width,initial-scale=1"> 
		
		<%@ include file="/WEB-INF/views/common/common_css.jsp" %>
        <link rel="stylesheet" href="${cp }/dist/vendors/social-button/bootstrap-social.css"/>   
		
        <!-- START: Custom CSS-->
        <link rel="stylesheet" href="${cp }/dist/css/main.css">
        <!-- END: Custom CSS-->
        <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
        <script>
		function getCookieValue(cookieStr, cookieName) {
			console.log("getCookieValue");
			
			var cookies = cookieStr.split("; ");
			
			for(var i in cookies) {
				
				var cookie = cookies[i].split("=");
				
				if (cookieName == cookie[0]) {
					return cookie[1];
				}
			}
			return "";
		}	
		
		//cookieName : 추가하고자 하는 쿠키이름
		//cookieValue : 쿠키의 값
		//expires : 유효기간 (일수)
		function addCookie(cookieName, cookieValue, expires) {
			var dt = new Date(); 	// 현재 날짜 ==> expires 만큼 미래날짜로 변경
			dt.setDate( dt.getDate() + parseInt(expires));
			
			document.cookie = cookieName + "=" + cookieValue + "; " +
								"path=/; expires=" + dt.toGMTString();
		}
		
		function deleteCookie(cookieName) {
			addCookie(cookieName, "", -1);
		}
		
		// html 문서 로딩이 완료된 후 실행되는 코드
		$(function(){
			
			<c:if test="${msg != null }">
				<c:choose>
					<c:when test="${msg eq '로그아웃되었습니다.' || msg eq '인증 완료되었습니다.' || msg eq '가입 완료! 이메일 인증 후 로그인 가능합니다.'}">
						swal({
							title: "Success!!",
							text: "${msg}",
							type: "success",
							showCancelButton: false,
							confirmButtonClass: 'btn-success',
							confirmButtonText: '확인'
						})
					</c:when>
					<c:otherwise>
						swal({
							title: "Error",
							text: "${msg}",
							type: "error",
							showCancelButton: false,
							confirmButtonClass: 'btn-primary',
							confirmButtonText: '확인'
						});
					</c:otherwise>
				</c:choose>
			</c:if>
			
			// userid, rememberme 쿠키를 확인하여 존재할 경우 값 설정, 체크
			if (Cookies.get("rememberme") != undefined) {
				$("#remember").prop("checked", true);	
				$("#user_id").val(Cookies.get("userid"));
			}
			
			//login 아이디를 select
			$('#login').on("click", function(){
				// rememberme 체크박스의 체크 여부 확인
				// 체크되어있을 경우
				if($("#remember").is(":checked") == true){
					// userid input에 있는 값을 userid쿠키로 저장
					Cookies.set("userid" , $('#user_id').val());								
					// rememberme 쿠키로 Y 값을 저장
					Cookies.set("rememberme" , "Y");
				} 
				// 체크되어있지 않은 경우 : userid, rememberme 쿠키 삭제
				else {
					Cookies.remove("userid");
					Cookies.remove("rememberme");
				}
				// form태그를 이용하여 signin 요청
				$('#frm').submit();
				
			});
		});
	</script>
        
    </head>
    <!-- END Head-->

    <!-- START: Body-->
    <body id="main-container" class="default">
        <!-- START: Main Content-->
        <div class="container">
            <div class="row vh-100 justify-content-between align-items-center">
                <div class="col-12">
                    <form id="frm" action="${cp }/login/process" class="row row-eq-height lockscreen  mt-5 mb-5" method="post">
                        <!-- <div class="lock-image col-12 col-sm-5"> -->
                        <div class="col-12 col-sm-5"> <br><br><br><br><br>
                        	<img src="${cp }/images/FlanbeLogo.png" class="user-image img-fluid">
                        </div>
                        <div class="login-form col-12 col-sm-7">
                            <div class="form-group mb-3">
                                <label for="emailaddress">ID</label>
                                <input class="form-control" id="user_id" name="user_id"required="" placeholder="Enter your id">
                            </div>

                            <div class="form-group mb-3">
                                <label for="password">Password</label>
                                <input class="form-control" type="password" required="" id="pass" name="pass"placeholder="Enter your password">
                            </div>

                            <div class="form-group mb-3">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="remember">
                                    <label class="custom-control-label" for="remember">Remember me</label>
                                </div>
                            </div>

                            <div class="form-group mb-0">
                                <button class="btn btn-primary" type="button" id="login"> Log In </button>
                            </div><br><br>
                            <div class="mt-2"><a href="${cp }/login/idfind">아이디 찾기</a> / <a href="${cp }/login/passfind">비밀번호 찾기</a></div>
                            <div class="mt-2">계정이 없으신가요? <a href="${cp }/login/signin">회원가입</a></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- END: Content-->
        <%@ include file="/WEB-INF/views/common/common_js.jsp" %>
    </body>
    <!-- END: Body-->
</html>