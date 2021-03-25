<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<!-- END: Main Menu-->
<script>
$(function(){
	
	$('#changePass').on('click', function() {
		// 비밀번호
		var pass1 = $("#pass1").val();
		// 비밀번호 확인
		var pass2 = $("#pass2").val();
		
		if(pass1 != pass2) {
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
									<span style="margin-top: 6px; margin-left: 32.9%">새 비밀번호</span> &nbsp; &nbsp; &nbsp; &nbsp; <input type="password" class="form-control col-3" id="pass1">
								</div>
								<br>
								<div class="form-row">
									<span style="margin-top: 6px; margin-left: 33%">비밀번호 확인</span> &nbsp; &nbsp; <input type="password" class="form-control col-3" id="pass2" name="pass">
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
