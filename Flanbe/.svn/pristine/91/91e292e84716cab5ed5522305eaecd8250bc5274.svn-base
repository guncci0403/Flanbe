<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
	$(function(){
   	  	<c:if test="${msg != null }">
         	alert("${msg}");
      		</c:if>
   		$(".deleteapplylist").on("click", function(){ //지원내역 프로젝트 삭제
   			var p_code = $(this).data("deleteapply");
   			$("#p_code").val(p_code);
   			$("#Applylistform").submit();
   		});
	})
</script>

<%@ include file="/WEB-INF/views/common/projectSidebar.jsp"%>

<!-- START: Main Content-->
<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<div class="row ">
			<div class="col-11  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">지원요청받은 프로젝트</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-11 mt-4">
				<div class="card">
					<div class="card-header justify-content-between align-items-center">
					<h4 class="card-title">프로젝트 리스트</h4>
					</div>

					<div class="card-body">

						<div class="col-12">
							<div class="col-12 mt-3 pl-lg-0">

								<c:if test="${fn:length(reqapplyList)==0}">
									<h4 class="mb-0">프로젝트가 없습니다.</h4><br>
								</c:if>
								<c:forEach items="${reqapplyList }" var="reqapplyList">
									<div class="card border h-invoice-list-section">
										<form id="Applylistform" method="post" action="${cp }/project/deleteapplylist">
											<input type="hidden" id="p_code" name="p_code" value="${p_code}" />
											<input type="hidden" name="user_id" value="${S_USER.user_id}" />
											<div class="card-header border-bottom p-3 d-flex">
												<span style="margin-right: 10px;">프로젝트 명 : </span>
												<span style="font-size: 15px;"> ${reqapplyList.p_title } </span>
											</div>
											<div class="card-body p-0">
												<div class="invoices list">

													<div class="invoice">

														<div class="invoice-content">
															<div class="invoice-info">
																<p class="mb-0 small">클라이언트:</p>
																<p class="invoice-no">${reqapplyList.user_id }</p>
															</div>
															<div class="invoice-info">
																<p class="mb-0 small">계약금액:</p>
																<p class="cliname">${reqapplyList.p_money }</p>
															</div>
															<div class="invoice-info">
																<p class="mb-0 small">프로젝트 기간:</p>
																<p class="invocie-date">${reqapplyList.period }</p>
															</div>
															<div class="invoice-info">
																<p class="mb-0 small">등록일</p>
																<p class="invoice-due-date">
																	<fmt:formatDate value="${reqapplyList.p_regdt }" pattern="yyyy.MM.dd" />
																</p>
															</div>
															<div class="invoice-info">
																<p class="mb-0 small">마감일</p>
																<p class="invoice-due-date">
																	<fmt:formatDate value="${reqapplyList.deadline }" pattern="yyyy.MM.dd" />
																</p>
															</div>

															<c:choose>
																<c:when test="${reqapplyList.p_state == '03'}">
																	<div class="line-h-1">
																		<a class="btn btn-primary" href="${cp }/project/viewProject?p_code=${reqapplyList.p_code}">상세조회</a>
																	</div>																
																</c:when>
																<c:otherwise>
																	<div class="invoice-info">
																		<p class="mb-0" style="color: red; font-size: 11px;">마감된 프로젝트입니다.</p>
																	</div>
																	<div class="line-h-1">
																		<p data-deleteapply="${reqapplyList.p_code }" class="deleteapplylist">❌</p>
																	</div>																	
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</div>
											</div>
										</form>											
									</div><br>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>


