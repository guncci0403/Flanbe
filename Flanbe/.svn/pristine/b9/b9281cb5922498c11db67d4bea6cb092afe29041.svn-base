<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<script>
$(function(){
	
	$('#changePass').on('click', function() {
		// 비밀번호
		var pass = $("#pass").val();
		
		$.ajax({
			url : "${cp }/user/passCheck2",
			data : { "pass" : pass },
			type : 'post',
			dataType : 'json',
			success : function(res) {
				if(res.msg != null){
					swal({
						title: "Error",
						text: res.msg,
						type: "error",
						showCancelButton: false,
						/* cancelButtonClass: 'btn-danger', */
						confirmButtonClass: 'btn-primary',
						confirmButtonText: '확인'
					});
				}else{
					$('#changeFrm').submit();
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
})
</script>
<!-- START: Main Content-->
<main>
	<div class="content">


		<!-- END: Card DATA-->
		<div class="profile_frame">

			<div class="col-11 mt-4">
				<div class="card border  h-mail-list-section">
					<form id="changeFrm" action="${cp }/user/changePass" method="post">
						<section>
							<div class="p5-profile-head" style="margin-top: 25px; padding-bottom: 20px; height: 52px; font-size: 28px; line-height: 1.3;">
								<h3>비밀번호 변경</h3>
							</div>
							<br>
						</section>

						<section class="p5-partition">
							<div class="p5-2spanInfo" style="height: auto;">
								<br> <br> <br> <br>
								<div class="form-row">
									<span style="margin-top: 6px; margin-left: 33%">아이디</span> &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<input type="text" class="form-control col-3" id="user_id" name="user_id" value="${user.user_id }" readonly="readonly">
								</div>
								<br>
								<div class="form-row">
									<span style="margin-top: 6px; margin-left: 33%">비밀번호</span> &nbsp; &nbsp; &nbsp;<input type="password" class="form-control col-3" id="pass">
								</div>
								<br> <br>
								<div class="form-row">
									<a id="changePass" class="btn btn-outline-primary rounded-btn" style="font-size: 14px; margin-left: 33%; width: 29.7%;"> 비밀번호 변경 </a>
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
