<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<script>
//문서 로딩이 완료되고 나서 실행되는 영역
$(function(){
	$("#insertCareer").on("click", function(){
		$("#insertModal").modal();
	});
	$("#insertModalBtn").on("click", function(){ 
		if($("#c_nm").val() == "" || $("#c_dept").val() == "" || $("#c_position").val() == "" || $("#c_sdt").val() == "" || $("#c_edt").val() == "" || $("#c_cont").val() == "" ) {
			swal({
				title: "Info",
				text: "모든항목을 입력해주세요",
				type: "info",
				showCancelButton: false,
				confirmButtonClass: 'btn-info',
				confirmButtonText: '확인',
				closeOnConfirm: false
			});
		}
		else {
			$.ajax({
				url:'${cp}/user/insertCareer',
				type:'post',
				dateType:'json',
				data : {
					"user_id" : $("#user_id").val(),
					"c_nm" : $("#c_nm").val(),
					"c_dept" : $("#c_dept").val(),
					"c_position" : $("#c_position").val(),
					"c_sdt" :  $("#c_sdt").val(),
					"c_edt" : $("#c_edt").val(),
					"c_cont" : $("#c_cont").val()
			},
			success : function(res){
				$('#insertModal').modal("hide");
 				$("#c_nm").val('');
				$("#c_dept").val('');
				$("#c_position").val('');
				$("#c_sdt").val('');
				$("#c_edt").val('');
				$("#c_cont").val('');
				
				$("#newCareer").html(res);
				if($("#msg").val()=="추가 성공!!"){
					swal({
						title: "Success!!",
						text: $("#msg").val(),
						type: "success",
						showCancelButton: false,
						/* cancelButtonClass: 'btn-danger', */
						confirmButtonClass: 'btn-success',
						confirmButtonText: '확인'
					});
				}
				else if($("#msg").val()=="추가 실패!!"){
					swal({
						title: "Error",
						text: $("#msg").val(),
						type: "error",
						showCancelButton: false,
						/* cancelButtonClass: 'btn-danger', */
						confirmButtonClass: 'btn-danger',
						confirmButtonText: '확인'
					});
				}
			},
			error : function(xhr){
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
		}) //아작스 끝 
		
		} //else 작동
	}); //끝 
		
	$("#newCareer").on("click" , ".cupdate" , function(){	
		$("#c_no2").val($(this).data("c_no"));
		$("#c_nm2").val($(this).data("c_nm"));
		$("#c_dept2").val($(this).data("c_dept"));
		$("#c_position2").val($(this).data("c_position"));
		$("#c_sdt2").val($(this).data("c_sdt"));
		$("#c_edt2").val($(this).data("c_edt"));
		$("#c_cont2").val($(this).data("c_cont"));
		
		$("#updateModal").modal();
	});
	
	$("#updateModalBtn").on("click", function(){
		if($("#c_nm2").val() == "" || $("#c_dept2").val() == "" || $("#c_position2").val() == "" || $("#c_sdt2").val() == "" || $("#c_edt2").val() == "" || $("#c_cont2").val() == "" ) {
			swal({
				title: "Info",
				text: "모든항목을 입력해주세요",
				type: "info",
				showCancelButton: false,
				confirmButtonClass: 'btn-info',
				confirmButtonText: '확인',	
				closeOnConfirm: false
			});
		}
		else {
			$.ajax({
				url:'${cp}/user/updateCareer',
				type:'post',
				dateType:'json',
				data : {
					"c_no" : $("#c_no2").val(),
					"user_id" : $("#user_id2").val(),
					"c_nm" : $("#c_nm2").val(),
					"c_dept" : $("#c_dept2").val(),
					"c_position" : $("#c_position2").val(),
					"c_sdt" : $("#c_sdt2").val(),
					"c_edt" : $("#c_edt2").val(),
					"c_cont" : $("#c_cont2").val()
			},
			success : function(res){
				$('#updateModal').modal("hide");
				$("#newCareer").html(res);
				if($("#msg").val()=="수정 성공!!"){
					swal({
						title: "Success!!",
						text: $("#msg").val(),
						type: "success",
						showCancelButton: false,
						/* cancelButtonClass: 'btn-danger', */
						confirmButtonClass: 'btn-success',
						confirmButtonText: '확인'
					});
				}
				else if($("#msg").val()=="수정 실패!!"){
					swal({
						title: "Error",
						text: $("#msg").val(),
						type: "error",
						showCancelButton: false,
						/* cancelButtonClass: 'btn-danger', */
						confirmButtonClass: 'btn-danger',
						confirmButtonText: '확인'
					});
				}
			},
			error : function(xhr){
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
		})
		}
	});
	
	
	var i = ${careerList.size() };
	$("#newCareer").on("click" , ".cdelete" , function(){
		//alert($(this).data("c_no"))
		var c_no = $(this).data("c_no");
		var th = $(this);
		$.ajax({
			url:'${cp}/user/deleteCareer',
			type:'get',
			dateType:'json',
			data : {
				"c_no" : c_no
			},
			success:function(data){
				$(th).parent().parent().parent().remove();
				$(th).parent().parent().remove();
				$(th).parent().remove();
				swal({
					title: "Success!!",
					text: "삭제 성공",
					type: "success",
					showCancelButton: false,
					/* cancelButtonClass: 'btn-danger', */
					confirmButtonClass: 'btn-success',
					confirmButtonText: '확인'
				});
				i--;
			},
			error:function(xhr){
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
		})
	});
	
});
</script>
<style>
.part {
	background: transparent;
	font-size: 12px;
	border: none;
	height: auto;
}

#borderdiv {
	border: 1px solid darkgray;
	margin-left: 8%;
	padding: 10px 5px 10px 25px;
	border-radius: 20px 20px;
}

.pull-right {
	float: right !important;
}
</style>
<!-- START: Main Content-->
<main>
	<div class="content">
		<!-- END: Card DATA-->
		<div class="profile_frame">
			<div class="col-11 mt-4">
				<div class="card border  h-mail-list-section">
					<section>
						<h3 class="p5-profile-head" style="margin-top: 25px; padding-bottom: 20px; height: 52px; font-size: 24px; line-height: 1.3;">
							<c:if test="${careerDate != null}">
								경력(${careerDate })
							</c:if>
							<c:if test="${careerDate == null}">
								경력
							</c:if>
							<c:if test="${user.user_id == S_USER.user_id }">
								<a id="insertCareer" class="btn btn-success pull-right py-2 px-2 rounded ml-auto text-white" style="font-size: 14px; line-height: 1.428;"> <i class="fa fa-plus"></i> <span>추가하기</span>
								</a>
							</c:if>
						</h3>
					</section>
					<section class="p5-partition">
						<div class="p5-2spanInfo" style="min-height: 200px; height: auto; margin-bottom: 10px !important;">
							<br>
							<br>
							<div id="newCareer">
							<c:choose>
								<c:when test="${careerList[0] == null}">
									<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
										<div style="display: table-cell; vertical-align: middle;">
											<div>
												<img src="${cp }/images/profile_employ.png" style="vertical-align: middle;">
												<p class="p5-no-partners-info-text">
													등록된 <span class="text-center p5-bold" style="font-weight: 500;">'경력'</span>이 없습니다.
												</p>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
										<c:forEach items="${careerList }" var="career" varStatus="loop">
											<div>
												<div class="form-row col-10" id="borderdiv">
													<div class="form-group col-11">
														<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
															<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">회사명</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_nm }">
														</div>
														<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
															<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">근무부서</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_dept }">
														</div>
														<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
															<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">직위</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_position }">
														</div>
														<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
															<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">근무기간</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_sdt } ~ ${career.c_edt }">
														</div>
														<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
															<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">설명</span>
															<span class="form-control col-9" style="margin-left: 10px; border: none; text-align: left; font-size: 16px; display: table;">${career.c_cont }</span>
															<%-- <input readonly="readonly" type="text" class="form-control col-9" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_cont }"> --%>
														</div>
													</div>
													<div>
														<c:if test="${user.user_id == S_USER.user_id }">
															<button data-c_no="${career.c_no }" data-c_nm="${career.c_nm }" data-c_dept="${career.c_dept }" data-c_position="${career.c_position }" data-c_sdt="${career.c_sdt }" data-c_edt="${career.c_edt }" data-c_cont="${career.c_cont }" class="btn btn-outline-primary cupdate">
																<i class="fa fa-edit"></i>
															</button>
															<button data-c_no="${career.c_no }" class="btn btn-outline-secondary cdelete" style="margin-left: 2px;">
																<i class="fa fa-trash"></i>
															</button>
														</c:if>
													</div>
												</div>
												<br> <br>
											</div>
										</c:forEach>
								</c:otherwise>
							</c:choose>
							</div>
							<!-- END: Card DATA-->
						</div>
					</section>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" style="display: none;" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle1">경력 추가</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<input type="text" class="form-control" id="c_nm" name="c_nm" placeholder="회사명"> <input type="text" class="form-control" id="c_dept" name="c_dept" placeholder="근무부서"> <input type="text" class="form-control" id="c_position" name="c_position" placeholder="직위"> <input type="date" class="form-control" id="c_sdt" name="c_sdt" placeholder="근무시작일"> <input type="date" class="form-control" id="c_edt" name="c_edt" placeholder="근무종료일"> <input type="text" class="form-control" id="c_cont" name="c_cont" placeholder="설명"> <input type="hidden" class="form-control" id="user_id" name="user_id" value="${user.user_id }">
							</div>
							<div class="modal-footer">
								<button id="insertModalBtn" type="button" class="btn btn-success">추가</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" style="display: none;" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle1">경력 수정</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<input type="text" class="form-control" id="c_nm2" name="c_nm" placeholder="회사명"> <input type="text" class="form-control" id="c_dept2" name="c_dept" placeholder="근무부서"> <input type="text" class="form-control" id="c_position2" name="c_position" placeholder="직위"> <input type="date" class="form-control" id="c_sdt2" name="c_sdt" placeholder="근무시작일"> <input type="date" class="form-control" id="c_edt2" name="c_edt" placeholder="근무종료일"> <input type="text" class="form-control" id="c_cont2" name="c_cont" placeholder="설명"> <input type="hidden" class="form-control" id="user_id2" name="user_id" value="${user.user_id }"> <input type="hidden" class="form-control" id="c_no2" name="c_no">

							</div>
							<div class="modal-footer">
								<button id="updateModalBtn" type="button" class="btn btn-primary">수정</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- </modal> -->
			</div>
		</div>
	</div>
</main>
<!-- END: Content-->

