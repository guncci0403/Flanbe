<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<!-- END: Main Menu-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	
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
	
	$("input:radio[name=u_div]").on("click", function() {
		if($("#r1").is(':checked')){
			$("#group_nm1").val("");
			$('#group_nm1').attr("disabled", true)
		} else if($("#r2").is(':checked')){
			$('#group_nm1').attr("disabled", false)
		}					
		if($("#r3").is(':checked')){
			$("#group_nm2").val("");
			$('#group_nm2').attr("disabled", true)
		} else if($("#r4").is(':checked')){
			$('#group_nm2').attr("disabled", false)
		}					
	})
	
	$("#imgDelete").on("click", function() {
		$("#photoroute").val("");
		$("#fileName").val("");
	});
	
	$('#updateinfo').on('click', function() {
		if($("#user_nm").val() == "" || $("#phone").val() == "" || $("#base_addr").val() == "" || $("#detail_addr").val() == "" || $("#zipcode").val() == ""){
			swal({
				title: "Info",
				text: "필수 입력항목을 모두 입력해주세요",
				type: "info",
				showCancelButton: false,
				confirmButtonClass: 'btn-info',
				confirmButtonText: '확인',	
				closeOnConfirm: false
			});
			return false;
		}
		if($("#r2").prop('checked') == true && $("#group_nm1").val() == "" || $("#r4").prop('checked') == true && $("#group_nm2").val() == "" ){
			swal({
				title: "Info",
				text: "필수 입력항목을 모두 입력해주세요",
				type: "info",
				showCancelButton: false,
				confirmButtonClass: 'btn-info',
				confirmButtonText: '확인',	
				closeOnConfirm: false
			});
			return false;
		}
		else{
			swal({
	            title: "Success!!",
	            text: "수정 완료!!",
	            type: "success",
	            showCancelButton: false,
	            /* cancelButtonClass: 'btn-danger', */
	            confirmButtonClass: 'btn-success',
	            confirmButtonText: '확인'
	         });
			$("#updateFrm").submit();
		}
	})
})
</script>
<style>
.pull-right {
	float: right !important;
}

.input-file-button {
	padding: 6px 25px;
	background-color: #1e3d73;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}
</style>
<!-- START: Main Content-->
<main>
	<div class="content">


		<!-- END: Card DATA-->
		<div class="profile_frame">

			<div class="col-11 mt-4">
				<div class="card border  h-mail-list-section">
					<form id="updateFrm" action="${cp }/user/updateInfo" method="post" enctype="multipart/form-data">
						<section>
							<div class="p5-profile-head" style="margin-top: 25px; padding-bottom: 20px; height: 52px; font-size: 28px; line-height: 1.3;">
								<h3>개인 정보 수정</h3>
							</div>
							<br>
							<div class="p5-2spanInfo" style="height: auto;">
								<div class="form-group">
									<label>아이디</label> <input type="text" class="form-control col-6" id="user_id" name="user_id" value="${user.user_id }" readonly="readonly">
								</div>
								<div class="form-group">
									<label>이메일</label> <input type="text" class="form-control col-6" id="email" name="email" value="${user.email }" readonly="readonly">
								</div>
							</div>
						</section>

						<section class="p5-partition">
							<div class="p5-2spanInfo" style="height: auto; margin-bottom: 10px !important;">
								<div class="form-group">
									<label>프로필 사진</label> <br>
									<div class="form-row">
										&nbsp;<input type="text" class="form-control col-5" name="photoroute" id="fileName" readonly="readonly" value="${user.photoroute }"> <input type="button" id="imgDelete" class="btn btn-primary" value="X" style="margin-left: 7px;"><br>
									</div>
									<%-- <input type="file" class="btn btn-outline-secondary" id="photoroute" name="p_route" value="${user.photoroute }" accept="image/*"> --%>
									<label class="input-file-button" for="photoroute" style="margin-top: 10px;"><i class="fa fa-plus"></i>&nbsp;이미지 등록</label> <input type="file" id="photoroute" name="p_route" accept="image/*" style="display: none" onchange="javascript: document.getElementById('fileName').value = this.value.replace(/c:\\fakepath\\/i,'')" /> <span>이미지 파일(.jpg, .jpeg, .png, .gif등)만 업로드 할 수 있습니다.</span>
								</div>

								<div class="form-group">
									<label><span style="color: red; font-weight: bold;">*</span> 이름</label> <input type="text" class="form-control col-6" id="user_nm" name="user_nm" placeholder="이름" value="${user.user_nm }">
								</div>
								<div class="form-group">
									<label><span style="color: red; font-weight: bold;">*</span> 그룹여부</label><br>
									<c:if test="${user.u_div == 'S'}">
			                    		&nbsp; &nbsp; <input type="radio" id="r1" name="u_div" value="S" checked="checked"> 개인 &nbsp; &nbsp; &nbsp; &nbsp;   
			                    		<input type="radio" id="r2" name="u_div" value="T"> 팀 &nbsp; &nbsp;   
		                        		<label><input type="text" class="form-control col-12" id="group_nm1" name="group_nm" placeholder="그룹 이름" disabled="disabled"></label>
									</c:if>
									<c:if test="${user.u_div == 'T'}">
			                    		&nbsp; &nbsp; <input type="radio" id="r3" name="u_div" value="S"> 개인 &nbsp; &nbsp; &nbsp; &nbsp;   
			                    		<input type="radio" id="r4" name="u_div" value="T" checked="checked"> 팀 &nbsp; &nbsp;   
		                        		<label><input type="text" class="form-control col-12" id="group_nm2" name="group_nm" placeholder="그룹 이름" value="${user.group_nm} "></label>
									</c:if>
								</div>
								<div class="form-group">
									<label><span style="color: red; font-weight: bold;">*</span> 전화번호</label> <input type="text" class="form-control col-6" id="phone" name="phone" placeholder="010-1234-5678" value="${user.phone }">
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="inputCity"><span style="color: red; font-weight: bold;">*</span> 기본주소</label> <input type="text" class="form-control" id="base_addr" name="base_addr" value="${user.base_addr }">
									</div>
									<div class="form-group col-md-6">
										<button type="button" id="addrBtn" class="btn btn-primary" style="margin-top: 25px;">주소검색</button>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="inputState"><span style="color: red; font-weight: bold;">*</span> 상세주소</label> <input type="text" class="form-control" id="detail_addr" name="detail_addr" value="${user.detail_addr }">
									</div>
									<div class="form-group col-md-2">
										<label for="inputZip"><span style="color: red; font-weight: bold;">*</span> 우편번호</label> <input type="text" class="form-control" id="zipcode" name="zipcode" value="${user.zipcode}">
									</div>
								</div>
							</div>
						</section>
						<div class="form-group">
							<a id="updateinfo" class="btn btn-primary pull-right py-2 px-2 rounded ml-auto text-white" style="font-size: 14px; line-height: 1.428; margin-right: 30px;"> <span>수정 완료</span>
							</a> <a href="${cp }/user/profile" class="btn btn-primary pull-right py-2 px-2 rounded ml-auto text-white" style="font-size: 14px; line-height: 1.428; margin-right: 10px;"> <span>취소</span>
							</a> <br>
							<br>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
</main>