<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#messageModalBtn {
 	border: none;
 	background: white; 
}
</style>

<script>
	$(function() {
		$('#requestBtn').on('click', function() {
			$.ajax({
				url : "${cp}/project/requestSend",
				data : {
					
				},
				type : 'get',
				success : function(data){
					var a = "";
					$.each(data.projectTList, function(i, project){
						a += "<div><input type='radio' name='r_p_code' id='p"+project.p_code+"' value='"+project.p_code+"'>";
						a += "	<label for='p"+project.p_code+"'> "+project.p_title+"</label><br></div>";
					});
					$("#projectList").html(a);
				},
				error : function(xhr) {
					swal({
						title: "Error",
						text: "상태 :" + xhr.status,
						type: "error",
						showCancelButton: false,
						confirmButtonClass: 'btn-danger',
						confirmButtonText: '확인'
					});
				}
			});
			
			$('#requestModal').modal();
		})
			
		
		$('#reqSend').on('click',function() {

// 			alert("p_code " + $("input[name='r_p_code']:checked").val());
// 			alert("user_id :  ${user.user_id}");
			
			var rp_code = $("input[name='r_p_code']:checked").val();
			var userid = '${user.user_id}';
			$.ajax({
				url : "${cp}/project/requestSend",
				data : {
					"p_code" : rp_code,
					"user_id" : userid
				},
				type : 'post',
				success : function(data){
					if(data.cnt == 1) {
						swal({
							title: "Success!!",
							text: "요청을 보냈습니다.",
							type: "success",
							showCancelButton: false,
							confirmButtonClass: 'btn-success',
							confirmButtonText: '확인'
						});
					} else {
						swal({
							title: "Error",
							text: "요청 전송을 실패했습니다.",
							type: "error",
							showCancelButton: false,
							confirmButtonClass: 'btn-primary',
							confirmButtonText: '확인'
						});
					}
					$('#requestModal').modal('hide');
				},
				error : function(xhr) {
					swal({
						title: "Error",
						text: "상태 :" + xhr.status,
						type: "error",
						showCancelButton: false,
						confirmButtonClass: 'btn-danger',
						confirmButtonText: '확인'
					});
				}
			});
		})
		
		$('#messageSendBtn').on('click', function() {
			
			var r_id = $("#r_id").val();
			var m_cont = $("#m_cont").val();
			
			$.ajax({
				url : "${cp}/message/messageSend",
				data : {
					"r_id" : r_id,
					"m_cont" : m_cont
				},
				type : 'post',
				success : function(data){
					if(data.cnt == 1) {
						swal({
							title: "Success!!",
							text: "쪽지를 보냈습니다.",
							type: "success",
							showCancelButton: false,
							confirmButtonClass: 'btn-success',
							confirmButtonText: '확인'
						});
					} else {
						swal({
							title: "Error",
							text: "쪽지 전송에 실패했습니다.",
							type: "error",
							showCancelButton: false,
							confirmButtonClass: 'btn-primary',
							confirmButtonText: '확인'
						});
					}
					$('#mailModal').modal('hide');
				},
				error : function(xhr) {
					swal({
						title: "Error",
						text: "상태 :" + xhr.status,
						type: "error",
						showCancelButton: false,
						confirmButtonClass: 'btn-danger',
						confirmButtonText: '확인'
					});
				}
			});
		});
	})
</script>

<div class="sidebar">
	<div class="site-width">
		<!-- START: Menu-->
		<ul id="side-menu" class="sidebar-menu" style="padding-bottom: 0px; margin-bottom: 5px;">
			<li class="dropdown">
				<div style="text-align: center; font-size: 15px;">
					<c:if test="${user.purpose == 'C' }">
					 	클라이언트
					</c:if>
					<c:if test="${user.purpose == 'P' }">
					 	파트너스
					</c:if>
					<c:if test="${user.user_id != S_USER.user_id }">
						<button type="button" id="messageModalBtn" data-toggle="modal" data-target="#mailModal"><img src="${cp }/images/message.png" alt="" width="17"></button>
					</c:if>
				</div>
				<img src="${cp }/user/profileImg?user_id=${user.user_id}" class="d-flex img-fluid rounded-circle" width="180" style="margin-left: 8%; height: 180px !important">
			</li>
		</ul>
		<h5 style="font-size: 17px; text-align: center; margin-right: 5px">${user.user_id }</h5><br>
		<c:if test="${S_USER.purpose == 'C' && user.purpose == 'P'}">
			<div class="text-center">
				<button type="button" id="requestBtn" class="btn btn-outline-secondary"><i class="mdi h5 mr-2 mdi-account-heart-outline"></i>지원요청하기</button>
			</div>
		</c:if>
	</div>
	<hr>
	<c:choose>
		<c:when test="${user.user_id == S_USER.user_id }">
			<c:if test="${user.purpose == 'P' }">
				<div class="site-width">
					<ul class="list-unstyled inbox-nav  mb-0 mt-2 notes-menu" id="myTab1" role="tablist" style="display: block;">
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/profile"> 전체보기 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/intro"> 자기소개 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/mainpopol"> 포트폴리오 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/skill"> 보유 기술 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/career"> 경력 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/evaluation/viewmain"> 클라이언트 평가 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/joinProject"> 프랜비에서 진행한 프로젝트 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/updateInfo"> 개인정보 수정 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/pass"> 비밀번호 변경 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/deleteUser"> 회원 탈퇴 </a></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${user.purpose == 'C' }">
				<div class="site-width">
					<ul class="list-unstyled inbox-nav  mb-0 mt-2 notes-menu" id="myTab2" role="tablist">
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/intro"> 자기소개 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/updateInfo"> 개인정보 수정 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/pass"> 비밀번호 변경 </a></li>
						<li class="nav-link active"><a class="nav-link" href="${cp }/user/deleteUser"> 회원 탈퇴 </a></li>
					</ul>
				</div>
			</c:if>
		</c:when>

		<c:otherwise>
			<div class="site-width">
				<ul class="list-unstyled inbox-nav  mb-0 mt-2 notes-menu" id="myTab3" role="tablist">
					<li class="nav-link active"><a class="nav-link" href="${cp }/user/profile?user_id=${user.user_id}"> 전체보기 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/user/intro?user_id=${user.user_id}"> 자기소개 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/user/mainpopol?user_id=${user.user_id}"> 포트폴리오 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/user/skill?user_id=${user.user_id}"> 보유 기술 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/user/career?user_id=${user.user_id}"> 경력 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/evaluation/viewmain?user_id=${user.user_id}"> 클라이언트 평가 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/user/joinProject?user_id=${user.user_id}"> 프랜비에서 진행한 프로젝트 </a></li>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
</div>


<!-- Modal -->
<div class="modal fade" id="requestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle1">지원 요청하기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            	<div class="text-center">
            	<p>내 프로젝트</p><hr>
            	</div>
            	<div id="projectList" style="margin-left: 15px;">
            	</div>
			</div>
            <div class="modal-footer">
                <button type="button" id="reqSend" class="btn btn-primary">요청하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<!-- 쪽지 보내는 modal -->
<div class="modal fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><i class="icon-pencil"></i> 쪽지 쓰기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="icon-close"></i>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<input type="text" id="r_id" class="form-control" placeholder="To." name="r_id" value="${user.user_id }" readonly />
				</div>

				<textarea id="m_cont" name="m_cont" style="width: 465px; height: 300px; resize: none;"></textarea>
			</div>
			<div class="modal-footer">
				<button id="messageSendBtn" type="button" class="btn btn-primary send-email">전송</button>
			</div>
		</div>
	</div>
</div>