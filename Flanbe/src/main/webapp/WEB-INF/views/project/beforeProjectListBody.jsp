<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/projectSidebar.jsp" %>

<!-- START: Main Content-->
<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<div class="row ">
			<div class="col-11  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">검수중 프로젝트</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-11 mt-4">
				<div class="card">
					<div class="card-header justify-content-between align-items-center">
						<h4 class="card-title">검수중인 프로젝트 리스트</h4>
					</div>
					<div class="card-body">
						<div class="col-12">
							<div class="col-12 mt-3 pl-lg-0">
								<c:forEach items="${beforeprojectList }" var="beforeprojectList">
									<div class="card border h-invoice-list-section">
											<div class="card-header border-bottom p-3 d-flex">
												<span style="margin-right: 10px;">프로젝트 명 : </span>
												<span style="font-size: 15px;"> ${beforeprojectList.p_title } </span>
											</div>
											<div class="card-body p-0">
												<div class="invoices list">

													<div class="invoice">

														<div class="invoice-content">
															<div class="invoice-info">
																<p class="mb-0 small">클라이언트:</p>
																<p class="invoice-no">${beforeprojectList.user_id }</p>
															</div>
															<div class="invoice-info">
																<p class="mb-0 small">계약금액:</p>
																<p class="cliname"><fmt:formatNumber value="${beforeprojectList.p_money }"/>원</p>
															</div>
															<div class="invoice-info">
																<p class="mb-0 small">프로젝트 기간:</p>
																<p class="invocie-date">${beforeprojectList.period }일</p>
															</div>
															<div class="invoice-info">
																<p class="mb-0 small">등록일</p>
																<p class="invoice-due-date">
																	<fmt:formatDate value="${beforeprojectList.p_regdt }" pattern="yyyy.MM.dd" />
																</p>
															</div>
															<div class="invoice-info">
																<p class="mb-0 small">프로젝트 마감일</p>
																<p class="invoice-due-date">
																	<fmt:formatDate value="${beforeprojectList.p_edt }" pattern="yyyy.MM.dd" />
																</p>
															</div>
															<c:choose>
																<c:when test="${beforeprojectList.p_state == '01' }">
																	<div class="invoice-info">
																		<p class="mb-0 small" style="color: GREEN;">검수중</p>
																	</div>
																</c:when>
															<c:otherwise>
																<div class="invoice-info">
																	<p class="mb-0 small" style="color: #ff6800;">등록실패</p>
																</div>															
															</c:otherwise>	
															</c:choose>
																<div class="line-h-1">
																	<a class="btn btn-primary" style="font-size:13px;" href="${cp }/project/viewProject?p_code=${beforeprojectList.p_code}">상세조회</a>
																</div>
														</div>
													</div>
												</div>
											</div>
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


