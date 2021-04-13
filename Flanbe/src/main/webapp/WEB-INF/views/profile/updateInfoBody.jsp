<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<!-- END: Main Menu-->
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
	// 프로필 사진 삭제
	$("#imgDelete").on("click", function() {
		$("#photoroute").val("");
		$("#fileName").val("");
	});
	
////////////정규식 /////////////
	var a = true;
	var b = true;
	// 이름 정규식 체크
	$('#user_nm').focus(function(){
		a = false;
	});
	$('#user_nm').blur(function(){
		if(!namecheck()) {
			$('#user_nm').addClass("form-control is-invalid");
			return false;
		}
		$('#user_nm').removeClass("form-control is-invalid").addClass("form-control is-valid");
		$('#nmspan').html("");
		a = true;
	});
	
	// 전화번호 정규식 체크
	$('#phone').focus(function(){
		b = false;
	});
	$('#phone').blur(function(){
		if(!phonecheck()) {
			$('#phone').addClass("form-control is-invalid");
			return false;
		}
		$('#phone').removeClass("form-control is-invalid").addClass("form-control is-valid");
		$('#phspan').html("");
		b = true;
	});
	
	
	$('#updateinfo').on('click', function() {
		//null 체크
		if($("#base_addr").val() == "" || $("#detail_addr").val() == "" || $("#zipcode").val() == ""){
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
		//정규식 통과 체크
		if(a==false||b==false) {
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
<script>
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
		$('#phspan').html("전화번호는 '-'를 포함하여 입력 (예: 010-1234-5678)").css('color','red');
		return false;
	}
	return true;
	
}
</script>
<style>
.pull-right {
	float: right !important;
}

.input-file-button {
	padding: 6px 25px;
	background-color: #17a2b8;
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
								<h4>개인 정보 수정</h4>
							</div>
							<br>
							<div class="p5-2spanInfo" style="height: auto;">
								<div class="form-group">
									<label>아이디</label> <input type="text" class="form-control col-4" id="user_id" name="user_id" value="${user.user_id }" readonly="readonly">
								</div>
								<div class="form-group">
									<label>이메일</label> <input type="text" class="form-control col-4" id="email" name="email" value="${user.email }" readonly="readonly">
								</div>
							</div>
						</section>

						<section class="p5-partition">
							<div class="p5-2spanInfo" style="height: auto; margin-bottom: 10px !important;">
								<div class="form-group">
									<label>프로필 사진</label> <br>
									<div class="form-row">
										&nbsp;<input type="text" class="form-control col-5" name="photoroute" id="fileName" readonly="readonly" value="${user.photoroute }"> <input type="button" id="imgDelete" class="btn btn-secondary" value="X" style="margin-left: 7px;"><br>
									</div>
									<%-- <input type="file" class="btn btn-outline-secondary" id="photoroute" name="p_route" value="${user.photoroute }" accept="image/*"> --%>
									<label class="input-file-button" for="photoroute" style="margin-top: 10px;"><i class="fa fa-plus"></i>&nbsp;이미지 등록</label> <input type="file" id="photoroute" name="p_route" accept="image/*" style="display: none" onchange="javascript: document.getElementById('fileName').value = this.value.replace(/c:\\fakepath\\/i,'')" /> <span>이미지 파일(.jpg, .jpeg, .png, .gif등)만 업로드 할 수 있습니다.</span>
								</div>

								<div class="form-group">
                                    <label><span style="color: red; font-weight: 500;">*</span> 이름</label>
                                    	 &nbsp; &nbsp;<span id="nmspan"></span>
                                    <input type="text" class="form-control col-4" id="user_nm" name="user_nm" placeholder="이름은 한글 2~5 글자" value="${user.user_nm}">
                                </div>
								<div class="form-group">
									<label><span style="color: red; font-weight: 500;">*</span> 그룹여부</label><br>
									<c:if test="${user.u_div == 'S'}">
			                    		&nbsp; &nbsp; <input type="radio" id="r1" name="u_div" value="S" checked="checked"> 개인 &nbsp; &nbsp; &nbsp; &nbsp;   
			                    		<input type="radio" id="r2" name="u_div" value="T"> 팀 &nbsp; &nbsp;   
		                        		<label><input type="text" class="form-control col-12" id="group_nm1" name="group_nm" placeholder="그룹 이름" disabled="disabled"></label>
									</c:if>
									<c:if test="${user.u_div == 'T'}">
			                    		&nbsp; &nbsp; <input type="radio" id="r3" name="u_div" value="S"> 개인 &nbsp; &nbsp; &nbsp; &nbsp;   
			                    		<input type="radio" id="r4" name="u_div" value="T" checked="checked"> 팀 &nbsp; &nbsp;   
		                        		<label><input type="text" class="form-control col-12" id="group_nm2" name="group_nm" placeholder="그룹 이름" value="${user.group_nm}"></label>
									</c:if>
								</div>
                                <div class="form-group">
                                    <label><span style="color: red; font-weight: 500;">*</span> 전화번호</label>
                                    &nbsp; &nbsp;<span id="phspan"></span>
                                    <input type="text" class="form-control col-4" id="phone" name="phone" placeholder="전화번호는 '-'를 포함하여 입력 (예: 010-1234-5678)" value="${user.phone}">
                                </div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="inputCity"><span style="color: red; font-weight: 500;">*</span> 기본주소</label> <input type="text" class="form-control" id="base_addr" name="base_addr" value="${user.base_addr }">
									</div>
									<div class="form-group col-md-6">
										<button type="button" id="addrBtn" class="btn btn-info" style="margin-top: 25px;">주소검색</button>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="inputState"><span style="color: red; font-weight: 500;">*</span> 상세주소</label> <input type="text" class="form-control" id="detail_addr" name="detail_addr" value="${user.detail_addr }">
									</div>
									<div class="form-group col-md-2">
										<label for="inputZip"><span style="color: red; font-weight: 500;">*</span> 우편번호</label> <input type="text" class="form-control" id="zipcode" name="zipcode" value="${user.zipcode}">
									</div>
								</div>
							</div>
						</section>
						<div class="form-group">
							<a id="updateinfo" class="btn btn-primary pull-right py-2 px-2 rounded ml-auto text-white" style="font-size: 14px; line-height: 1.428; margin-right: 30px;"> <span>수정 완료</span>
							</a>
							<c:if test="${user.purpose == 'P' }">
								<a href="${cp }/user/profile" class="btn btn-secondary pull-right py-2 px-2 rounded ml-auto text-white" style="font-size: 14px; line-height: 1.428; margin-right: 10px;"> <span>취소</span>
								</a>
							</c:if>
							<c:if test="${user.purpose == 'C' }">
								<a href="${cp }/user/intro" class="btn btn-secondary pull-right py-2 px-2 rounded ml-auto text-white" style="font-size: 14px; line-height: 1.428; margin-right: 10px;"> <span>취소</span>
								</a>
							</c:if>
							
							<br>
							<br>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
</main>
