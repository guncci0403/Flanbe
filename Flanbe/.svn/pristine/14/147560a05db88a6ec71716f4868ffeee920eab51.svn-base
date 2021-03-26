<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(function() {
		$('#inviteUserBtn').on('click', function() {
			//$("#buser").remove();
			var p_code = ${p_code};
			$.ajax({
				url : "${cp}/note/inviteUser",
				data : {
					"p_code" : p_code
				},
				type : 'get',
				success : function(data){
					var html = "";
					$.each(data.userList, function(i, user){
						html += "<div><input type='checkbox' id='check"+i+"' value='"+user+"'>";
						html += "	<label for='check"+i+"'> "+user+"</label><br></div>";
					});
					$("#auser").html(html);
				},
				error : function(xhr) {
				}
				
			})
			
			$('#inviteModal').modal();
		});
		
		$('#right').on('click', function() {
			// $('#auser').find('input[type="checkbox"]:checked').val();
// 			var users = "";
// 			$('#auser').find('input[type="checkbox"]:checked').each(function(index){
// 				if (index != 0) {
// 					users += ', ';
// 	            }
// 				users += $(this).val();
// 			})
			
			$('#auser').find('input[type="checkbox"]:checked').each(function(){
				$(this).prop('checked',false);
				$('#buser').append($(this).parent());
				//$('#buser').('input[type="checkbox"][name="filtercheck"]').prop('checked',false);
				$('#auser').find(this).parent().remove();
			})
		})
		
		$('#left').on('click',function() {
			
			$('#buser').find('input[type="checkbox"]:checked').each(function(){
				$(this).prop('checked',false);
				$('#auser').append($(this).parent());
				//$('#buser').('input[type="checkbox"][name="filtercheck"]').prop('checked',false);
				$('#buser').find(this).parent().remove();
			})
		})
		
		$('#inviteModal').on('hidden.bs.modal', function () {
			$('#buser').html("");
		})
		
		$('#inviteBtn').on('click',function() {
			var users = "";
			$('#buser').find('input[type="checkbox"]').each(function(index){
				if (index != 0) {
					users += ', ';
	            }
				users += $(this).val();
			})
			if(users == "") {
				alert("추가된 사람이 없습니다.")
				return false;
			}
			$('#users').val(users);
			$("#inviteFrm").submit();
		})
		
	})
</script>

<form id="inviteFrm" action="${cp }/note/inviteUser" method="post">
	<input type="hidden" name="p_code" value="${p_code }">
	<input type="hidden" id="users" name="userid" value="">
</form>


<div class="sidebar">
	<div class="site-width">
		<ul class="list-unstyled inbox-nav  mb-0 mt-2 notes-menu" id="myTab1" role="tablist">
			<li class="nav-link active"><a class="nav-link" href="${cp }/note/viewMain?p_code=${p_code}"> 업무노트 </a></li>
			<li class="nav-link active"><a class="nav-link" href="#"> 캘린더 </a></li>
			<li class="nav-link active"><a class="nav-link" href="#"> 메신저 </a></li>
			<li class="nav-link active"><a class="nav-link" href="${cp }/note/userList?p_code=${p_code}"> 참여자 정보 </a></li>
		</ul>
	</div>
</div>

<main>
	<div class="container-fluid site-width">

		<div class="row ">
			<div class="col-12  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">프로젝트 구성원</h4>
					</div>
				</div>
			</div>
		</div>
		<br>

		<div class="col-12">
			<div class="card">
				<div class="card-header d-flex justify-content-between align-items-center">
					<button type="button" id="inviteUserBtn" class="btn float-right btn-primary" data-toggle="modal">사용자 초대</button>
					<a class="btn btn-default float-right" href="${cp }/note/excelDownload?p_code=${p_code}">사용자 엑셀 다운로드</a>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">이메일</th>
									<th scope="col">전화번호</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList }" var="user">
									<tr style="height: 50px;">
										<th scope="row">${user.user_id }</th>
										<td>${user.user_nm }</td>
										<td>${user.email }</td>
										<td>${user.phone }</td>
										<c:choose>
											<c:when test="${user.purpose  == 'C'}">
												<td>클라이언트</td>
											</c:when>
											<c:otherwise>
												<td>개발자</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- Modal -->
<div class="modal fade" id="inviteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle3" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle3">사용자 초대하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" style="min-height: 500px;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-5 border p-4" style="min-height: 450px;">
							<span>사용자 리스트</span>
							<hr>
							<div class="col-md-10" id="auser">
							</div>
						</div>
						<div class="col-md-2"><br><br><br><br><br><br>
							<button class="btn float-center" id="left"><i class="mdi mdi-arrow-left-bold-outline h4"></i></button><br>
							<button class="btn float-center" id="right"><i class="mdi mdi-arrow-right-bold-outline h4"></i></button>
						</div>
						
						<div class="col-md-5 border p-4" style="min-height: 450px;">
							<span>초대할 사용자</span>
							<hr>
							<div class="col-md-10" id="buser">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="inviteBtn">초대하기</button>
				<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
			</div>
		</div>
	</div>
</div>
	

