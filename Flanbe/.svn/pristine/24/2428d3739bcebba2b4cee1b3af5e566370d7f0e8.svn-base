<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<!-- END: Main Menu-->
<script>
$(function(){
	var a = false;
	var b = false;
	// 비밀번호 정규식 체크
	$('#pass').focus(function(){
		a = false;
	});
	$('#pass').blur(function(){
		if(!passcheck()) {
			$('#pass').addClass("form-control is-invalid");
			return false;
		}
		$('#pass').removeClass("form-control is-invalid").addClass("form-control is-valid");
		$('#psspan').html("");
		a = true;
	});
	
	// 비밀번호 확인 일치 체크
	$('#pass1').focus(function(){
	});
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
	
	$('#changePass').on('click', function() {
		if(a==false) {
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
		swal({
			title: "Success!!",
			text: "변경 성공",
			type: "success",
			showCancelButton: false,
			/* cancelButtonClass: 'btn-danger', */
			confirmButtonClass: 'btn-success',
			confirmButtonText: '확인'
		});
		setTimeout(function() {
			$('#changeFrm').submit();
        	}, 2000);
	})
})
</script>
<script>
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
</script>
<style>
</style>
<!-- START: Main Content-->
<main>
	<div class="content">


		<!-- END: Card DATA-->
		<div class="profile_frame">

			<div class="col-11 mt-4">
				<div class="card border  h-mail-list-section">
					<form id="changeFrm" action="${cp }/user/changePassComplete" method="post">
						<input type="hidden" id="user_id" name="user_id" value="${user.user_id }">
						<section>
							<div class="p5-profile-head" style="margin-top: 25px; padding-bottom: 20px; height: 52px; font-size: 28px; line-height: 1.3;">
								<h3>비밀 번호 변경</h3>
							</div>
							<br>
						</section>

						<section class="p5-partition">
							<div class="p5-2spanInfo" style="height: auto;">
								<br> <br> <br> <br>
								<div class="form-row">
									<span style="margin-top: 6px; margin-left: 33.2%">새 비밀번호</span> &nbsp; &nbsp; &nbsp; &nbsp; 
									<input type="password" class="form-control col-3" id="pass"> &nbsp; &nbsp;<span id="psspan"></span>
								</div>
								<br>
								<div class="form-row">
									<span style="margin-top: 6px; margin-left: 33%">비밀번호 확인</span> &nbsp; &nbsp; &nbsp; 
									<input type="password" class="form-control col-3" id="pass1" name="pass"> &nbsp; &nbsp;<span id="psspan1"></span>
								</div>
								<br> <br>
								<div class="form-row">
									<a id="changePass" class="btn btn-outline-primary rounded-btn" style="font-size: 14px; margin-left: 33%; width: 31%;"> 변경 완료 </a>
								</div>
								<br> <br> <br> <br>
							</div>
						</section>
					</form>
				</div>
			</div>
		</div>

	</div>
</main>
