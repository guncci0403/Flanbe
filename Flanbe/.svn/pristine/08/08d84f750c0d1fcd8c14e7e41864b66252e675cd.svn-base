<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<style>
.part {
	background: transparent;
	font-size: 12px;
	border: none;
	height: auto;
	}
.invoice-info {
		cursor: default !important;
	}
</style>
<main>
	<div class="content">
		<!-- END: Card DATA-->
		<div class="profile_frame">
			<div class="col-11 mt-4">
				<div class="card border  h-mail-list-section">
					<form>
						<section>
							<div class="p5-profile-head" style="margin-top: 25px; padding-bottom: 20px; height: 52px; font-size: 28px; line-height: 1.3;">
								<h4>프랜비에서 진행한 프로젝트</h4>
							</div>
						</section>
						<section class="p5-partition">
							<div class="p5-2spanInfo" style="min-height: 240px; height: auto; margin-bottom: 10px !important;">
								<br> <br>
								<c:choose>
									<c:when test="${cntJoinProj == 0}">
										<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
											<div style="display: table-cell; vertical-align: middle;">
												<div>
													<img src="${cp }/images/project_history_no.png" style="vertical-align: middle;">
													<p class="p5-no-partners-info-text" style="margin-top: 15px; margin-bottom: 0; color: #999 !important; line-height: 1;">
														진행한 <span class="text-center p5-bold" style="font-weight: bold;">'프로젝트'</span>가 없습니다.
													</p>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-row" style="border-bottom: 1px solid lightgray; border-top: 1px solid lightgray;">
											<span class="form-control col-2" style="border: none; text-align:center; color:#999999; background-color:#fafafa; font-size:16px; font-weight:450;">진행한 프로젝트</span> <input readonly="readonly" type="text" class="form-control col-2" style="border: none; text-align: left; font-size: 16px;" value="    ${cntJoinProj } 개"> 
											<span class="form-control col-2" style="border: none; text-align: center; color: #999999; background-color: #fafafa; font-size: 16px; font-weight:450;">누적 프로젝트 금액</span> <input readonly="readonly" type="text" class="form-control col-2" id="sumMoney" style="border: none; text-align: left; font-size: 16px;" value="    <fmt:formatNumber value="${sumMoney }"/> 원">
										</div>
										<br>
										<br>
										<div class="form-row col-12">
											<div class="form-control part col-4" style="border-right: 2px dashed lightgray;">
												<span style="color:#999999; font-size:16px; font-weight:450; margin-left:30%;">진행한 프로젝트 분야</span> <br>

												<%-- <canvas id="chartjs-other-doughnut" width="403" height="196" class="chartjs-render-monitor" style="display: block; width: 403px; height: 196px;"></canvas> --%>
												<canvas id="chartjs-other-doughnut"></canvas>

											</div>
											<div class="form-control part col-4" style="border-right: 2px dashed lightgray;">
												<span style="color:#999999; font-size:16px; font-weight:450; margin-left:30%;">프로젝트 평균 금액</span> <br> <br> <br> <br> <br> <input readonly="readonly" type="text" id="avgMoney" style="border: none; text-align: center; margin-left: 10%; font-size: 22px; font-weight: bold;" value="<fmt:formatNumber value="${avgMoney }"/> 원">

											</div>
											<div class="form-control part col-4">
												<span style="color:#999999; font-size:16px; font-weight:450; margin-left:30%;">프로젝트 평균 기간</span> <br> <br> <br> <br> <br> <input readonly="readonly" type="text" style="border: none; text-align: center; margin-left: 10%; font-size: 22px; font-weight: bold;" value="${avgPeriod } 일">

											</div>
										</div>
										<br>
										<br>
										<br>
										<br>
										<div class="form-group col-12">
											<c:forEach items="${projectMap }" var="project">
												<div class="card border h-invoice-list-section">
													<div class="card-header border-bottom p-3 d-flex">
														<span style="font-size: 15px; font-weight: 500;"> ${project.p_title } </span>
													</div>
													<div class="card-body p-0">
														<div class="invoices list">

															<div class="invoice">
																<div class="invoice-content">
																	<div class="invoice-info">
																		<p class="mb-0 small">클라이언트</p>
																		<p class="invoice-no">${project.user_id }</p>
																	</div>
																	<div class="invoice-info">
																		<p class="mb-0 small">계약금액</p>
																		<p class="cliname">${project.p_money }</p>
																	</div>
																	<div class="invoice-info">
																		<p class="mb-0 small">프로젝트 기간</p>
																		<p class="invocie-date">${project.period }</p>
																	</div>
																	<div class="invoice-info">
																		<p class="mb-0 small">등록일</p>
																		<p class="invoice-due-date">
																			<fmt:formatDate value="${project.p_regdt }" pattern="yyyy.MM.dd" />
																		</p>
																	</div>
																	<div class="invoice-info">
																		<p class="mb-0 small">마감일</p>
																		<p class="invoice-due-date">
																			<fmt:formatDate value="${project.deadline }" pattern="yyyy.MM.dd" />
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
										<!-- END: Card DATA-->
										<div class="card-body" style="margin-left: 40%;">
											<nav aria-label="member list Navigation">
												<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
													<ul class="pagination">
														<c:choose>
															<c:when test="${page.page == 1 }">
																<li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
																<li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-left"></i></a></li>
															</c:when>
															<c:otherwise>
																<li class="paginate_button page-item previous" id="dataTable_previous"><a href="${cp }/user/joinProject?user_id=${page.user_id }&page=1" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
																<li class="paginate_button page-item previous" id="dataTable_previous"><a href="${cp }/user/joinProject?user_id=${page.user_id }&page=${page.page - 1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-left"></i></a></li>
															</c:otherwise>
														</c:choose>
														<c:forEach begin="1" end="${pagination }" var="i">
															<c:choose>
																<c:when test="${page.page == i}">
																	<li class="paginate_button page-item active"><span class="page-link">${i }</span></li>
																</c:when>
																<c:otherwise>
																	<li class="paginate_button page-item"><a href="${cp }/user/joinProject?user_id=${page.user_id }&page=${i}" aria-controls="dataTable" class="page-link">${i }</a></li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														<c:choose>
															<c:when test="${page.page == pagination }">
																<li class="paginate_button page-item next disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-right"></i></a></li>
																<li class="paginate_button page-item next disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
															</c:when>
															<c:otherwise>
																<li class="paginate_button page-item next" id="dataTable_previous"><a href="${cp }/user/joinProject?user_id=${page.user_id }&page=${page.page +1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-right"></i></a></li>
																<li class="paginate_button page-item next" id="dataTable_previous"><a href="${cp }/user/joinProject?user_id=${page.user_id }&page=${pagination}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
															</c:otherwise>
														</c:choose>
													</ul>
												</div>
											</nav>
										</div>
										<br>
										<br>
									</c:otherwise>
								</c:choose>
							</div>
						</section>
					</form>
				</div>
			</div>
		</div>
	</div>
</main>



<script>
$(function() {
	

	(function($) {
		"use strict";

		var primarycolor = getComputedStyle(document.body).getPropertyValue(
				'--primarycolor');
		var bordercolor = getComputedStyle(document.body).getPropertyValue(
				'--bordercolor');
		var bodycolor = getComputedStyle(document.body).getPropertyValue(
				'--bodycolor');

		var options = {
			responsive : true,
			legend : {
				position : 'top',
				labels : {
					fontColor : bodycolor
				}
			},
			scales : {
				xAxes : [ {
					display : true,
					gridLines : {
						display : true,
						color : bordercolor,
						zeroLineColor : bordercolor
					},
					ticks : {
						fontColor : bodycolor,

					},
				} ],
				yAxes : [ {
					display : true,
					gridLines : {
						display : true,
						color : bordercolor,
						zeroLineColor : bordercolor
					},
					ticks : {
						fontColor : bodycolor,

					}
				} ]
			}
		};

		window.chartColors = {
			red : 'rgb(30, 61, 115)',
			orange : 'rgb(23, 162, 184)',
			yellow : 'rgb(30, 224, 172)',
			green : 'rgb(75, 192, 192)',
			blue : 'rgb(54, 162, 235)',
			purple : 'rgb(153, 102, 255)',
			grey : 'rgb(201, 203, 207)'
		};

		////////////////////////////////////// Other Chart doughnut //////////////////////
		var web = ${historyMap.web};
		var app = ${historyMap.app};
		var pub = ${historyMap.pub};
		var game = ${historyMap.game};
		var etc = ${historyMap.etc};

		var config = {
			type : 'doughnut',
			data : {
				datasets : [ {
					data : [ web, app, pub, game, etc ],
					backgroundColor : [ window.chartColors.red,
							window.chartColors.orange,
							window.chartColors.yellow,
							window.chartColors.green, window.chartColors.blue, ],
					label : 'Dataset 1'
				} ],
				labels : [ '웹', '애플리케이션', '퍼블리싱', '게임', '기타' ]
			},
			options : {
				responsive : true,
				legend : {
					position : 'top',
					labels : {
						fontColor : bodycolor
					}
				},
				animation : {
					animateScale : true,
					animateRotate : true
				}
			}
		};
		var chartjs_other_doughnut = document
				.getElementById("chartjs-other-doughnut");
		if (chartjs_other_doughnut) {
			var ctx = document.getElementById('chartjs-other-doughnut')
					.getContext('2d');
			window.myDoughnut = new Chart(ctx, config);
		}

	})(jQuery);
})	
</script>
<!-- END: Page Script JS-->
