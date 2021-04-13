<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.menu a, .menu li{
   cursor:pointer;
   margin-bottom: 3px;
}
.menu .hide{
   display:none;
   padding-left: 12px;
   font-size: 11px;
   list-style: none;
   color: #424242;
}
.hide li a:hover {
    color: royalblue;
}
.notes-menu .hide li a:hover:after {
    background: none;
}
</style>
<script>
//계약부분 마우스 반응형 효과
$(function(){
    // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu>a").click(function(){
        var submenu = $(this).next("ul");
        
        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if(submenu.is(":visible")){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    }).mouseover(function(){
        $(this).next("ul").slideDown();
    });
});
</script>
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
					<li class="menu nav-link active">
						<a class="nav-link"> 계약 </a>
						<ul class="hide">
							<li>
								<a href="${cp }/contract/contractList?type=s&user_id=${S_USER.user_id}"> 진행 중인 계약
							</li>
							<li>
								<a href="${cp }/contract/contractList?type=f&user_id=${S_USER.user_id}"> 완료된 계약
							</li>
							<li>
								<a href="${cp }/contract/calendar"> 미팅 일정
							</li>
	                  	</ul>
	               </li>
				</c:when>
				<c:when test="${S_USER.purpose == 'P' }">
					<li class="nav-link active"><a class="nav-link" href="${cp }/project/selectLikeList"> 관심 프로젝트 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/project/requestedapplylist"> 지원 요청 </a></li>
					<li class="nav-link active"><a class="nav-link" href="${cp }/project/applyList"> 지원 내역 </a></li>
					<li class="menu nav-link active">
						<a class="nav-link"> 계약 </a>
						<ul class="hide">
							<li>
								<a href="${cp }/contract/contractListP?type=s&user_id=${S_USER.user_id}"> 진행 중인 계약
							</li>
							<li>
								<a href="${cp }/contract/contractListP?type=f&user_id=${S_USER.user_id}"> 완료된 계약
							 </li>
							<li> 
								<a href="${cp }/contract/calendar"> 미팅 일정
							</li>
						</ul>
					</li>
				
				</c:when>
			</c:choose>
			<li class="nav-link active"><a class="nav-link" href="${cp }/project/ingProjectList"> 진행중인 프로젝트 </a></li>
			<li class="nav-link active"><a class="nav-link" href="${cp }/project/finishProjectList"> 완료한 프로젝트 </a></li>
		</ul>
	</div>
</div>