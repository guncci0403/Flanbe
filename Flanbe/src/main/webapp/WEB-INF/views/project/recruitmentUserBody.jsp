<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.OK , .NO{
 		border: none;
 		background: white; 
	}
</style>

<script>
$(function (){
	<c:if test="${msg != null }">
		swal({
			title: "Info",
			text: "${msg}",
			type: "info",
			showCancelButton: false,
			confirmButtonClass: 'btn-info',
			confirmButtonText: '확인',	
			closeOnConfirm: false
		});
	</c:if>
	
	$(".userDetail").on("click", function(){
		var user_id = $(this).data("userid");
// 		$("#user_id").val(user_id);
// 		console.log(user_id);
		location.href="${cp}/user/profile?user_id="+user_id;
		
	})
	$('.OK').on('click', function() {
		$("#uid").val($(this).data('userid'));
		$("#unm").val($(this).data('usernm'));
		$("#pn").val($(this).data('usernm'));
		$('#meetingModal').modal();
	})
	$('.NO').on('click', function() {
		$("#uid").val($(this).data('userid'));
		$("#unm").val($(this).data('usernm'));
		$('#recruitFrm').attr("method", "post");
		$('#recruitFrm').attr("action", "${cp}/project/projectNo");
		$('#recruitFrm').submit();
	})
	
	$("#YES").on('click',function() {
		if(($("#mettingDate").val()).length == 0 ){
			swal({
				title: "Info",
				text: "미팅일자가 입력되지 않았습니다",
				type: "info",
				showCancelButton: false,
				confirmButtonClass: 'btn-info',
				confirmButtonText: '확인',	
				closeOnConfirm: false
			});
			return false;
		}
		 var mettingArr = $('#mettingDate').val().split('-');
		 var todayArr = getToday().split('-');
		
		 var todayCompare = new Date(todayArr[0], parseInt(todayArr[1])-1, todayArr[2]);
         var mettingCompare = new Date(mettingArr[0], parseInt(mettingArr[1])-1, mettingArr[2]);
         
         if(todayCompare.getTime() > mettingCompare.getTime()) {
             swal({
             	title: "Info",
             	text: "미팅일자는 현재 날짜 부터 설정 가능합니다.",
             	type: "info",
             	showCancelButton: false,
             	confirmButtonClass: 'btn-info',
             	confirmButtonText: '확인',	
             	closeOnConfirm: false
             });
             return false;
         }
         
		$("#mWay").val($("#mettingWay").val());
		$("#mDate").val($("#mettingDate").val());
		$('#meetingModal').modal('hide');
		$('#recruitFrm').attr("method", "post");
		$('#recruitFrm').attr("action", "${cp}/project/projectOk");
		$('#recruitFrm').submit();
	})
	
    function getToday(){
        
        var date = new Date();
        var year = date.getFullYear();
        var month = ("0" + (1 + date.getMonth())).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);

        return year + "-" + month + "-" + day;
   }
	
})

</script>

<%@ include file="/WEB-INF/views/common/projectSidebar.jsp"%>

<main>

<form id="recruitFrm">
	<input type="hidden" name="p_code" value="${p_code }">
	<input type="hidden" id="uid" name="user_id" value="">
	<input type="hidden" id="unm" name="user_nm" value="">
	<input type="hidden" id="mWay" name="mtway" value="">
	<input type="hidden" id="mDate" name="mtdt" value="">
</form>

	<div class="container-fluid site-width">
		<div class="row ">
			<div class="col-11  mt-4">
				<div class="card">
					<div class="card-header d-flex justify-content-between align-items-center">
						<h6 class="card-title">
							<strong>[ ${pVo.p_title } ]</strong> 의 지원자 목록
						</h6>
						<div class="line-h-1" style="position: absolute; right: 20px;" >
							<a class="btn btn-outline-danger" href="${cp }/project/updateProjectState?p_code=${pVo.p_code }&user_id=${pVo.user_id}">마감완료 </a>
						</div>
					</div>
					<div class="card-content">
						<!-- 			 <div class="card-body p-0 table-responsive"> -->
						<div class="card-body">
							<div class="table-responsive">
								<table class="table" id="userListTable" style="font-size: 15px;">
									<thead>
										<tr>
<!-- 											<th scope="col">지원자 사진</th> -->
											<th scope="col">지원자 이름</th>
											<th scope="col">보유 기술 (숙련도)</th>
											<th scope="col">경력 여부</th>
											<th scope="col">그룹 여부</th>
											<th scope="col"> 승인 / 거절</th>
										</tr>
									</thead>
									<tbody id="transactionHistoryTrns">
										<c:forEach items="${userList }" var="user">
											<tr>
	<%-- 												<th scope="row" style="padding: 20px;"><img src="${cp }/user/profileImg?user_id=${user.user_id }" alt="${user.user_nm }" class="user-image img-fluid" style="width: 150px; height: 150px;"> &nbsp;&nbsp;</th> --%>
												<td  class="userDetail" data-userid="${user.user_id }" style="font-size: 15px;">${user.user_nm }</td>

												<c:choose>
													<c:when test="${user.us_kind!= null }">
														<td style="font-size: 15px;">${user.us_kind }</td>
													</c:when>
													<c:otherwise>
														<td style="font-size: 15px;"> x</td>
													</c:otherwise>
												</c:choose>

												<c:choose>
													<c:when test="${user.careers != null }">
														<td style="font-size: 15px;">경력 (${user.careers }년)</td>
													</c:when>
													<c:otherwise>
														<td style="font-size: 15px;">신입</td>
													</c:otherwise>
												</c:choose>

												<c:choose>
													<c:when test="${user.u_div eq 'S'}">
														<td style="font-size: 15px;">&nbsp;개인</td>
													</c:when>
													<c:when test="${user.u_div eq 'T'}">
														<td style="font-size: 15px;">&nbsp;${user.group_nm }</td>
													</c:when>
												</c:choose>

												<c:choose>
													<c:when test="${user.p_state eq '06' }">
														<td style="font-size: 15px; color: blue;">계약 중&nbsp;&nbsp; <i class="icon-user-following icons" style="width: 50px; color: blue;"></i>
														</td>
													</c:when>
													<c:when test="${user.p_state eq '08' }">
														<td style="font-size: 15px; color: blue;">미팅 중&nbsp;&nbsp; <i class="icon-user-following icons" style="width: 50px; color: blue;"></i>
														</td>
													</c:when>
													<c:otherwise>
														<td style="font-size: 20px;">
															<button class="OK text-success edit-contact" title="승인" data-userid="${user.user_id }" data-usernm="${user.user_nm}">
																<i class="ion-checkmark-circled"> </i>
															</button>
															<button class="NO text-danger delete-contact" title="거절" data-userid="${user.user_id }" data-usernm="${user.user_nm}">
																<i class="ion-close-circled"> </i>
															</button>
														</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<nav aria-label="member list Navigation">
								<ul class="pagination justify-content-center m-0">
									<c:set var="cnt" value="${pagination}" />
									<li class="page-item"><a class="page-link" href="${cp }/project/viewPattendUser?p_code=${p_code }&page=1&pageSize=${pageVo.pageSize}"><i class="fas fa-angle-double-left"></i></a></li>
									<li class="page-item"><a class="page-link" href="${cp }/project/viewPattendUser?p_code=${p_code }&page=
																<c:choose>
																	<c:when test="${pageVo.getPage() -1 > 0 }">${pageVo.page - 1}</c:when>
																	<c:otherwise>${pageVo.page }</c:otherwise>
																</c:choose>&pageSize=${pageVo.pageSize}"><i class="fas fa-angle-left"></i></a></li>
									<c:forEach begin="1" end="${pagination}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="page-item active"><a class="page-link" href="${cp}/project/viewPattendUser?p_code=${p_code }&page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="${cp}/project/viewPattendUser?p_code=${p_code }&page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li class="page-item"><a class="page-link" href="${cp}/project/viewPattendUser?p_code=${p_code }&page=<c:choose>
														<c:when test="${pageVo.getPage() + 1 > pagination }">${pagination }</c:when>
														<c:otherwise>${pageVo.getPage() + 1}</c:otherwise>
													</c:choose>&pageSize=${pageVo.pageSize }"><i class="fas fa-angle-right"></i></a></li>
									<li class="page-item"><a class="page-link" href="${cp}/project/viewPattendUser?p_code=${p_code }&page=${pagination}&pageSize=${pageVo.pageSize}"><i class="fas fa-angle-double-right"></i></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END: Card DATA-->
</main>
<!-- END: Content-->


<!-- Modal -->
<div class="modal fade" id="meetingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle1">미팅</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
            	지원자명 : &nbsp; 
            	<input type="text" style="width: 100px;" id="pn" value="" readonly> <br><br>
                미팅방법 : &nbsp; 
                <select id="mettingWay"class="btn btn-outline-secondary dropdown-toggle">
                	<option value="01">전화</option>
                	<option value="02">화상</option>
                	<option value="03">대면</option>
                </select> <br><br>
                미팅일자 : &nbsp; 
                <input type="date" id="mettingDate">
            </div>
            <div class="modal-footer">
                <button type="button" id="YES" class="btn btn-primary">전송</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

