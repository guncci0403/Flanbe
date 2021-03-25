<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="sidebar">
	<div class="site-width">
		<!-- START: Menu-->
		<ul id="side-menu" class="sidebar-menu">
			<li class="dropdown">
			<a href="#" style="text-align: center; font-size: 15px;">프로젝트 관리</a></li>
		</ul>
	</div>
	<div class="site-width">
		<ul class="list-unstyled inbox-nav  mb-0 mt-2 notes-menu" id="myTab1" role="tablist">
			<c:choose>
				<c:when test="${S_USER.purpose == 'C' }">
					<li class="nav-link active"><a class="nav-link" href="${cp }/project/beforeProjectList"> 검수 중 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/project/selectUserProject?user_id=${S_USER.user_id}"> 지원자 모집 중 </a></li>
					<li class="nav-link active"><a class="nav-link" href="#"> 계약 </a></li>
				</c:when>
				<c:when test="${S_USER.purpose == 'P' }">
					<li class="nav-link active"><a class="nav-link" href="${cp }/project/selectLikeList"> 관심 프로젝트 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/project/requestedapplylist"> 지원 요청 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/project/applyList"> 지원 내역 </a></li>
					<li class="nav-link active"><a class="nav-link" href="#"> 계약 </a></li>
				</c:when>
			</c:choose>
			<li class="nav-link active"><a class="nav-link" href="${cp }/project/ingProjectList"> 진행중인 프로젝트 </a></li>
			<li class="nav-link active"><a class="nav-link" href="${cp }/project/finishProjectList"> 완료한 프로젝트 </a></li>
		</ul>
	</div>
</div>