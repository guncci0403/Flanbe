<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="sidebar">
   <div class="site-width">
	   <ul class="list-unstyled inbox-nav  mb-0 mt-2 notes-menu" id="myTab1" role="tablist">
	         <li class="nav-link active"><a class="nav-link" href="${cp }/note/viewMain?p_code=${p_code}"> 업무노트 </a></li>
	         <li class="nav-link active"><a class="nav-link" href="${cp }/note/noteCalendar?p_code=${p_code}"> 캘린더 </a></li>
	         <li class="nav-link active"><a class="nav-link" href="#"> 메신저 </a></li>
	         <li class="nav-link active"><a class="nav-link" href="${cp }/note/userList?p_code=${p_code}"> 참여자 정보 </a></li>
	   </ul>
   </div>
</div>