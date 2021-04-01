<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar">
	<div class="site-width">
		<!-- START: Menu-->
		<ul id="side-menu" class="sidebar-menu">
			<li class="dropdown"><a href="#" style="text-align: center; font-size: 15px;">계약 </a></li>
		</ul>
	</div>
	<div class="site-width">
		<ul class="list-unstyled inbox-nav  mb-0 mt-2 notes-menu" id="myTab1" role="tablist">
			<c:choose>
				<c:when test="${S_USER.purpose == 'C' }">
					<li class="nav-item">
						<c:choose>
							<c:when test="${type == 's'}">
								<a class="nav-link active" href="${cp }/contract/contractList?type=s&user_id=${S_USER.user_id}">
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="${cp }/contract/contractList?type=s&user_id=${S_USER.user_id}">
							</c:otherwise>
						</c:choose>
							<i class="icon-list">진행 중인 계약</i>
						</a>
					</li>
					<li class="nav-item">
						<c:choose>
							<c:when test="${type == 'f'}">
								<a class="nav-link active" href="${cp }/contract/contractList?type=f&user_id=${S_USER.user_id}">
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="${cp }/contract/contractList?type=f&user_id=${S_USER.user_id}">
							</c:otherwise>
						</c:choose>
							<i class="icon-star">완료된 계약</i>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<c:choose>
							<c:when test="${type == 's'}">
								<a class="nav-link active" href="${cp }/contract/contractListP?type=s&user_id=${S_USER.user_id}">
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="${cp }/contract/contractListP?type=s&user_id=${S_USER.user_id}">
							</c:otherwise>
						</c:choose>
							<i class="icon-list">진행 중인 계약</i>
						</a>
					</li>
					<li class="nav-item">
						<c:choose>
							<c:when test="${type == 'f'}">
								<a class="nav-link active" href="${cp }/contract/contractListP?type=f&user_id=${S_USER.user_id}">
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="${cp }/contract/contractListP?type=f&user_id=${S_USER.user_id}">
							</c:otherwise>
						</c:choose>
							<i class="icon-star">완료된 계약</i>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
			<li class="nav-item">
				<c:choose>
					<c:when test="${type == null}">
						<a class="nav-link active" href="${cp }/contract/calendar">
					</c:when>
					<c:otherwise>
						<a class="nav-link" href="${cp }/contract/calendar">
					</c:otherwise>
				</c:choose>
					<i class="icon-star">미팅 일정</i>
				</a>
			</li>
		</ul>
	</div>
</div>    