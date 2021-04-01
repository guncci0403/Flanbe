<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
})
</script>

<%@ include file="/WEB-INF/views/common/projectSidebar.jsp" %>

<main>
	<div class="container-fluid site-width">
		<!-- START: Card Data-->
		<div class="row ">
			<div class="col-11  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">모집 중인 프로젝트</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			 <div class="col-11 mt-4">
				<div class="card">
					<div class="card-header border-bottom p-3 d-flex">
						<h4 class="card-title">지원자 모집중인 프로젝트</h4>
					</div>
					<div class="card border h-invoice-list-section">
						<div class="col-12">
							<div class="col-12 mt-3 pl-lg-0">

								<c:forEach items="${projectList }" var="project">
									<div class="card border h-invoice-list-section absolute">
										<div class="card-header border-bottom p-3 d-flex">
											<span style="margin-right: 10px;">프로젝트 명 : </span> 
											<span style="font-size: 15px;"> ${project.p_title } </span>
											<div class="line-h-1" style="position: absolute; right: 20px;" >
															<a class="btn btn-outline-info" 
																href="${cp }/project/viewPattendUser?p_code=${project.p_code}&user_id=${S_USER.user_id}">지원자목록</a>
<!-- 															<a class="btn btn-outline-danger"  -->
<%-- 																href="${cp }/project/updateProjectState?p_code=${project.p_code}&user_id=${project.user_id}">마감완료 </a> --%>
											</div>	
										</div>
										<div class="card-body p-0">
											<div class="invoices list">
												<div class="invoice">
													<div class="invoice-content">
														<div class="invoice-info">
															<p class="mb-0 small">클라이언트:</p>
															<p class="invoice-no">${project.user_id }</p>
														</div>
														<div class="invoice-info">
															<p class="mb-0 small">계약금액:</p>
															<p class="cliname">${project.p_money }원</p>
														</div>
														<div class="invoice-info">
															<p class="mb-0 small">개발 분야:</p>
															<c:choose>
																<c:when test="${project.p_field eq '01' }">
																	<p class="cliname">웹</p>
																</c:when>
																
																<c:when test="${project.p_field  eq '02' }">
																	<p class="cliname">애플리케이션</p>
																</c:when>
																<c:when test="${project.p_field eq '03' }">
																	<p class="cliname">퍼블리싱</p>
																</c:when>
																<c:when test="${project.p_field eq '04'}">
																	<p class="cliname">게임</p>
																</c:when>
																<c:otherwise>
																	<p class="cliname">기타</p>
																</c:otherwise>
															</c:choose>
														</div>
														<div class="invoice-info">
															<p class="mb-0 small">프로젝트 기간:</p>
															<p class="invocie-date">${project.period }일</p>
														</div>
														<div class="invoice-info">
															<p class="mb-0 small">지원 마감일</p>
															<p class="invoice-due-date">
																<fmt:formatDate value="${project.deadline }"
																	pattern="yyyy.MM.dd" />
															</p>
														</div>
														<div class="line-h-1">
															<a class="btn btn-primary" href="${cp }/project/viewProject?p_code=${project.p_code}">상세조회</a>
														</div>	
													</div>
												</div>
											</div>
										</div>
									</div>
									<br>
								</c:forEach>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- END: Card DATA-->
		<div class="card-body">
			<nav aria-label="member list Navigation">
				<ul class="pagination justify-content-center m-0">
					<c:set var="cnt" value="${pagination}" />
					<li class="page-item"><a class="page-link"
						href="${cp }/project/selectUserProject?user_id=${S_USER.user_id }&page=1&pageSize=${pageVo.pageSize}"><i
							class="fas fa-angle-double-left"></i></a></li>
					<li class="page-item"><a class="page-link"
						href="${cp }/project/selectUserProject?user_id=${S_USER.user_id }&page=
										<c:choose>
										<c:when test="${pageVo.getPage() > 0 }">${pageVo.page}</c:when>
										</c:choose>&pageSize=${pageVo.pageSize}"><i
							class="fas fa-angle-left"></i></a></li>
					<c:forEach begin="1" end="${pagination}" var="i">
						<c:choose>
							<c:when test="${pageVo.page == i}">
								<li class="page-item active"><a class="page-link"
									href="${cp}/project/selectUserProject?user_id=${S_USER.user_id }&page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${cp}/project/selectUserProject?user_id=${S_USER.user_id }&page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item"><a class="page-link"
						href="${cp}/project/selectUserProject?user_id=${S_USER.user_id }&page=<c:choose>
								<c:when test="${pageVo.getPage() + 1 > pagination }">${pagination }</c:when>
								<c:otherwise>${pageVo.getPage() + 1}</c:otherwise>
							</c:choose>&pageSize=${pageVo.pageSize }"><i
							class="fas fa-angle-right"></i></a></li>
					<li class="page-item"><a class="page-link"
						href="${cp}/project/selectUserProject?user_id=${S_USER.user_id }&page=${pagination}&pageSize=${pageVo.pageSize}"><i
							class="fas fa-angle-double-right"></i></a></li>
				</ul>
			</nav>
		</div>
	</div>
</main>