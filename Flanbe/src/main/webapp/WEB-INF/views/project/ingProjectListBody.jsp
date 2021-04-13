<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/WEB-INF/views/common/projectSidebar.jsp" %>

<style>
	.invoice-info {
		cursor: default !important;
	}
</style>
<!-- START: Main Content-->
<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<div class="row ">
			<div class="col-11  align-self-center">
				<div
					class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">프로젝트 진행 중</h4>
						<p class="p5-no-partners-info-text" style="color:gray; font-size:15px; font-weight:350;">현재 진행 중인 프로젝트를 확인할 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-11 mt-4">
				<div class="card">
					<div class="card-body">
						<div class="col-12">
							<div class="col-12 mt-3 pl-lg-0">						
								<c:if test="${fn:length(ingProjectList)==0}">
									<p class="mb-0" style="color:#999 !important; line-height:1; font-size: 14px;">프로젝트 진행 내역이 없습니다.</p><br>
								</c:if>							
								<c:forEach items="${ingProjectList }" var="ingprojectList">
									<div class="card border h-invoice-list-section">
										<div class="p-3">
											<span style="font-size:17px; font-weight:450; color:#2099bb;"> ${ingprojectList.p_title }
											</span>
										</div>
										<div class="card-body p-0">
											<div class="invoices list">

												<div class="invoice">

													<div class="invoice-content">
														<div class="invoice-info">
															<p class="mb-0">클라이언트</p>
															<p class="invoice-no">${ingprojectList.user_id }</p>
														</div>
														<div class="invoice-info">
															<p class="mb-0">계약금액</p>
															<p class="cliname"><fmt:formatNumber value="${ingprojectList.p_money }"/>원</p>
														</div>
														<div class="invoice-info">
															<p class="mb-0">프로젝트 기간</p>
															<p class="invocie-date">${ingprojectList.period }일</p>
														</div>
														<div class="invoice-info">
															<p class="mb-0">등록일</p>
															<p class="invoice-due-date">
																<fmt:formatDate value="${ingprojectList.p_regdt }"
																	pattern="yyyy.MM.dd" />
															</p>
														</div>
														<div class="invoice-info">
															<p class="mb-0">프로젝트 마감일</p>
															<p class="invoice-due-date">
																<fmt:formatDate value="${ingprojectList.p_edt }"
																	pattern="yyyy.MM.dd" />
															</p>
														</div>
														<div class="invoice-info">
															<p class="mb-0" style="color:#00a878; font-size:14.5px; font-weight:500;">진행중인
																프로젝트</p>
														</div>
														<div class="line-h-1">
															<a class="btn btn-primary" style="font-size: 13px;"
																href="${cp }/project/viewProject?p_code=${ingprojectList.p_code}">상세조회</a>
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
	</div>
</main>