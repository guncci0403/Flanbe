<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>
<!-- END: Main Menu-->
<script>
$(function(){
	$("#updateIntro").on("click", function(){
		/* db안에 <br>태그를 줄바꿈기호로 변환해서 출력 */
		var str = $('#introCont').val();
		if(str!=null){
			str = str.split('<br/>').join("\r\n");
			$('#introCont').val(str);
			$("#intro").val($("#introCont").val());
		}
		
		$("#updateModal").modal();
	});
	
	$("#updateModalBtn").on("click", function(){
		/* 줄바꿈기호를 db안에 <br>태그로 변환해서 입력 */
 		var str = $('#intro').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#intro').val(str);
		
		/* alert($("#intro").val()); */
		$.ajax({
			url:'${cp}/user/updateIntro',
			type:'post',
			dateType:'json',
			data : {
				"intro" : $("#intro").val(),
				"user_id" : $("#user_id").val()
			},
			success : function(res){
				$('#updateModal').modal("hide");
				/* alert(res); */
				/* var rrr = eval("(" + res + ")");
				alert(rrr.msg); */
				/* $("#newIntro").html(rrr.body); */
				$("#newIntro").html(res);
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
				else{
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
	});
	
	
	
  	$(document).ready(function() {
  	    $('#intro').on('keyup', function() {
  	        $('#intro_cnt').html("("+$(this).val().length+" / 1500)");
  	 
  	        if($(this).val().length > 1500) {
  	            $(this).val($(this).val().substring(0, 1500));
  	            $('#test_cnt').html("(1500 / 1500)");
  	        }
  	    });
  	});
});
</script>
<style>
.pull-right {
	float: right !important;
}

textarea {
	width: 100%;
	height: 250px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px stealgray;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
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
						<h3 class="p5-profile-head" style="margin-top: 25px; padding-bottom: 20px; height: 52px; font-size: 28px; line-height: 1.3;">
							'${user.user_id }'의 자기소개
							<c:if test="${user.user_id == S_USER.user_id }">
								<a id="updateIntro" class="btn btn-success pull-right py-2 px-2 rounded ml-auto text-white" style="font-size: 14px; line-height: 1.428;"> <span>업데이트 하기</span>
								</a>
							</c:if>
						</h3>
					</section>

					<section class="p5-partition" style="padding-bottom: 20px;">
						<div class="p5-2spanInfo" style="height: auto;">
							<div id="newIntro">
								<h6 class="p5-content-title">자기소개</h6>
								<div class="p5-description-hasvalue">
									<c:choose>
										<c:when test="${user.intro == null}">
											<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
												<div style="display: table-cell; vertical-align: middle;">
													<div>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${cp }/images/profile_introduction.png" style="vertical-align: middle;">
														<p class="p5-no-partners-info-text">
															등록된 <span class="text-center p5-bold" style="font-weight: 500;">'자기 소개'</span>가 없습니다.
														</p>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<input type="hidden" id="introCont" value="${user.intro }">
											${user.intro }
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle1">자기소개 수정</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div>
								<h6 class="p5-content-title" style="padding-bottom: 0px !important;">자기소개</h6>
								<form id="updateFrm" action="${cp }/user/updateIntro" method="post">
									<input type="hidden" id="user_id" value="${user.user_id }" />
									<div class="p5-description-hasvalue">
										<textarea id="intro" name="intro" placeholder="자기소개를 입력해주세요.(1500자 제한)"></textarea>
										<div id="intro_cnt">(최대 1500자)</div>
									</div>
								</form>
							</div>
						</div>
						<div class="modal-footer">
							<button id="updateModalBtn" type="button" class="btn btn-primary">수정</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
