<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<!-- 차트 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>

<style>
.pull-right {
	float: right !important;
}

.part {
	background: transparent;
	font-size: 12px;
	border: none;
	height: auto;
}

.table {
   width: 90%;
   border-collapse: collapse;
   text-align: left;
   line-height: 1.5;
   border: 1px solid #ccc;
   margin: 10px 10px 10px 30px;
}

.table thead th {
   width: 60%;
   padding: 10px;
   font-weight: 500;
   border-bottom: 2px solid #ccc;
   vertical-align: top;
   margin: 20px 10px;
}

.table tbody th {
   padding: 10px;
   line-height: 3;
   border-bottom: 2px solid #ccc;
   border-bottom: 1px solid #ccc;
}

.table td {
   padding: 10px;
   line-height: 3;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
}

#borderdiv {
	border: 1px solid darkgray;
	margin-left: 8%;
	padding: 10px 5px 10px 25px;
	border-radius: 20px 20px;
}
/* 자기소개 5줄까지만 출력 하고 나머지 숨기기 */
#introCont {
	/* 한 줄 자르기 */ 
	display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; 
	/* 여러 줄 자르기 추가 스타일 */ 
	white-space: normal; line-height: 1.2;  text-align: left; word-wrap: break-word;
	display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;
}
.etitle:hover{
	text-decoration: underline;
}
</style>
<main>
	<div class="content">
		<!-- END: Card DATA-->
		<div class="profile_frame">
			<div class="col-11 mt-4">
				<div class="card border  h-mail-list-section">
					<form>
						<section class="p5-profile-head">
							<h3 style="margin-top:25px; height:40px; font-size:28px; line-height:1.3;">${user.user_id }</h3>
							<i class="far fa-keyboard"></i> <span>개발자</span> | <span>파트너스</span> | <i class="fa fa-user"></i> <span>${user.group_nm }</span>
						</section>
						<section class="p5-partition">
							<div class="p5-2spanInfo" style="height: auto; margin-bottom: 10px !important;">
								<c:if test="${averageEvaluation != 0}">
									<div class="form-row col-12" style="border-bottom: 2px dashed lightgray; text-align: center;">
										<div class="form-control part col-3" style="border-right: 2px dashed lightgray;">
											<span style="font-size:16px; font-weight:400;">평균 평점</span> <br>
											<br><br><br><br><br>
                                            <div style="text-align: center; width: 90%">
                                                <h2>
                                                  <c:if test="${averageEvaluation != 0 }">
                                   					 <c:forEach begin="0" end="${averageEvaluation - 1}"><i class="fas fa-star" style="color: #ffc107;"></i></c:forEach>
                                    			  </c:if>
				                                  <c:if test="${emptyStar != 0}">
				                                    <c:forEach begin="0" end="${emptyStar - 1}"><i class="far fa-star" style="color: #ffc107;"></i></c:forEach>
				          					 	  </c:if>
                                                </h2>
                                                <h4 style="border: none; text-align: center; padding-top: 8px; color: #333; font-size: 13px;">
	                                                평균 평점 : <span style="font-size: 15px; font-weight: 500;">${evalVo.average}</span>
	                                                <br>진행한 프로젝트 : <span style="font-size: 15px; font-weight: 500;">${cntJoinProj }</span> 개
	                                            </h4>
                                            </div>
										</div>
										<div class="form-control part col-5" style="border-right: 2px dashed lightgray;">
											<span style="font-size:16px; font-weight:400;">세부 항목 평가</span> <br>
											<br>
											<canvas id="myChart" height="240" style="width: 92%; margin-left:4%;"></canvas>
										</div>
										<div class="form-control part col-4">
											<span style="font-size:16px; font-weight:400;">진행한 프로젝트 분야</span> <br>
											<canvas id="chartjs-other-doughnut"></canvas>
										</div>
									</div>
								</c:if>
								<br>
								<div class="form-group col-12" style="border-bottom: 2px dashed lightgray;">
									<div class="form-control part col-4" style="margin-left: 2%">
										<span style="font-size:16px; font-weight:400;">자기 소개</span>
									</div>
									<div class="form-control part col-8" style="margin-left: 12%">
										<br> <span style="border: none; font-size: 14px;"> <c:choose>
												<c:when test="${user.intro == null}">
													<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
														<div style="display: table-cell; vertical-align: middle;">
															<div>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${cp }/images/profile_introduction.png" style="vertical-align: middle;">
																<p class="p5-no-partners-info-text">
																	등록된 <span class="text-center p5-bold" style="font-weight: 500;">'자기 소개'</span>가 없습니다.
																</p>
															</div>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div style="width: 90%">
														<p id="introCont">${user.intro }</p>
													</div>
												</c:otherwise>
											</c:choose>
										</span>
									</div>
									<div class="form-control part col-11">
										<a class="pull-right" href="${cp }/user/intro?user_id=${user.user_id}" style="color:#2099bb; font-size:14px; margin-right:-100px;">자기소개 더 보기 <i class="fas fa-chevron-right"></i></a>
									</div>
									<br> <br>
								</div>
								<c:choose>
									<c:when test="${popolVo[0] == null}">
										<div class="form-group col-12" style="border-bottom: 2px dashed lightgray;">
											<div class="form-control part col-4" style="margin-left: 2%">
												<span style="font-size:16px; font-weight:400;">포트폴리오</span>
											</div>
											<div class="form-control part col-8" style="margin-left: 12%">
												<br>
												<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
													<div style="display: table-cell; vertical-align: middle;">
														<div style="font-size: 14px;">
															<img src="${cp }/images/project_history_no.png" style="vertical-align: middle;">
															<p class="p5-no-partners-info-text">
																등록된 <span class="text-center p5-bold" style="font-weight: 500;">'포트폴리오'</span>가 없습니다.
															</p>
														</div>
													</div>
												</div>
											</div>
											<div class="form-control part col-11">
												<a class="pull-right" href="${cp }/user/mainpopol?user_id=${user.user_id}" style="color:#2099bb; font-size:14px; margin-right:-100px;">포트폴리오 더 보기 <i class="fas fa-chevron-right"></i></a>
											</div>
											<br> <br>
										</div>
									</c:when>
									<c:when test="${reprePopolVo[0] == null}">
										<div class="form-group col-12" style="border-bottom: 2px dashed lightgray;">
											<div class="form-control part col-4" style="margin-left: 2%">
												<span style="font-size:16px; font-weight:400;">포트폴리오</span>
											</div>
											<div class="form-control part col-8" style="margin-left: 12%">
												<br>
												<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
													<div style="display: table-cell; vertical-align: middle;">
														<div style="font-size: 14px;">
															<img src="${cp }/images/project_history_no.png" style="vertical-align: middle;">
															<p class="p5-no-partners-info-text">
																<span class="text-center p5-bold" style="font-weight: 500;">'대표 포트폴리오'</span>를 등록해 주세요.
															</p>
														</div>
													</div>
												</div>
											</div>
											<div class="form-control part col-11">
												<a class="pull-right" href="${cp }/user/mainpopol?user_id=${user.user_id}" style="color:#2099bb; font-size:14px; margin-right:-100px;">포트폴리오 더 보기 <i class="fas fa-chevron-right"></i></a>
											</div>
											<br> <br>
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-group col-12" style="border-bottom: 2px dashed lightgray;">
											<div class="form-control part col-4" style="margin-left: 2%">
												<span style="font-size:16px; font-weight:400;">포트폴리오</span>
											</div>
											<div class="form-control part col-8" style="margin-left: 12%; height: 350px;">
												<br>
												<div class="p5-description-hasvalue">						
													<c:forEach items="${reprePopolVo}" var="reprePopolVo" varStatus="status">
														<div class="portfolio-thumbnail"style="margin-top: 0;" >
															<a href="${cp }/user/detailpopol?po_no=${reprePopolVo.po_no}"> 
																<img class="portfolio-thumbnail-image" src="${cp }/user/popolimg?po_no=${reprePopolVo.po_no}">
															</a>
														
															<div class="portfolio-thumbnail-caption-top">
															<span class="badge badge-pill badge-warning p-1 mb-1"><strong>대표작품</strong></span>
															<br>
																<a class="popol_title">${reprePopolVo.po_title} </a> 
																<p class="popol_field_skil">
																	개발&nbsp;|&nbsp;<span class="category-field-splitter"></span>
																	<c:set var="poopl_field" value="${reprePopolVo.po_field}" />
																	<c:forEach items="${poopl_field }" var="poopl_field">
																		<c:if test="${poopl_field eq '01'}"> 웹 </c:if>
																		<c:if test="${poopl_field eq '02'}"> 애플리케이션 </c:if>
																		<c:if test="${poopl_field eq '03'}"> 퍼블리싱 </c:if>
																		<c:if test="${poopl_field eq '04'}"> 게임 </c:if>
																		<c:if test="${poopl_field eq '05'}"> 기타 </c:if>
																	</c:forEach>
																</p>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
											<div class="form-control part col-11">
												<a class="pull-right" href="${cp }/user/mainpopol?user_id=${user.user_id}" style="color:#2099bb; font-size:14px; margin-right:-100px;">포트폴리오 더 보기 <i class="fas fa-chevron-right"></i></a>
											</div>
											<br> <br>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="form-group col-12" style="border-bottom: 2px dashed lightgray;">
									<div class="form-control part col-4" style="margin-left: 2%">
										<span style="font-size:16px; font-weight:400;">보유 기술</span>
									</div>
									<div class="form-control part col-8" style="margin-left: 12%">
										<br> <span style="border: none; font-size: 14px;"> <c:choose>
												<c:when test="${skillList[0] == null}">
													<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
														<div style="display: table-cell; vertical-align: middle;">
															<div>
																<img src="${cp }/images/profile_certify.png" style="vertical-align: middle;">
																<p class="p5-no-partners-info-text">
																	등록된 <span class="text-center p5-bold" style="font-weight: 500;">'보유 기술'</span>이 없습니다.
																</p>
															</div>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<table class="table table-striped">
														<thead>
															<tr>
																<th scope="cols">종류</th>
																<th scope="cols">숙련도</th>
															</tr>
														</thead>
														<c:forEach items="${skillList }" var="skill" begin="0" end="2">
															<tbody>
																<tr>
																	<th scope="row"><span style="margin-left: 10px;"> <c:choose>
																				<c:when test="${skill.us_kind == '01' }">Java</c:when>
																				<c:when test="${skill.us_kind == '02' }">C</c:when>
																				<c:when test="${skill.us_kind == '03' }">Python</c:when>
																				<c:when test="${skill.us_kind == '04' }">JavaScript</c:when>
																				<c:when test="${skill.us_kind == '05' }">기타</c:when>
																				<c:otherwise>${skill.us_kind }</c:otherwise>
																			</c:choose>
																	</span></th>
																	<td><span style="margin-left: 5px;"> <c:choose>
																				<c:when test="${skill.us_prof == '01' }">초급</c:when>
																				<c:when test="${skill.us_prof == '02' }">중급</c:when>
																				<c:when test="${skill.us_prof == '03' }">고급</c:when>
																				<c:when test="${skill.us_prof == '04' }">특급</c:when>
																			</c:choose>
																	</span></td>
																</tr>
															</tbody>
														</c:forEach>
													</table>
												</c:otherwise>
											</c:choose>
										</span>
									</div>
									<div class="form-control part col-11">
										<a class="pull-right" href="${cp }/user/skill?user_id=${user.user_id}" style="color:#2099bb; font-size:14px; margin-right:-100px;">보유기술 더 보기 <i class="fas fa-chevron-right"></i></a>
									</div>
									<br> <br>
								</div>
								<div class="form-group col-12" style="border-bottom: 2px dashed lightgray;">
									<div class="form-control part col-4" style="margin-left: 2%">
										<c:if test="${careerDate != null}">
											<span style="font-size:16px; font-weight:400;">경력(${careerDate })</span>
										</c:if>
										<c:if test="${careerDate == null}">
											<span style="font-size:16px; font-weight:400;">경력</span>
										</c:if>
									</div>
									<div class="form-control part col-8" style="margin-left: 11%">
										<br> <span style="border: none; font-size: 14px;"> <c:choose>
												<c:when test="${careerList[0] == null}">
													<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
														<div style="display: table-cell; vertical-align: middle;">
															<div>
																<img src="${cp }/images/profile_employ.png" style="vertical-align: middle;">
																<p class="p5-no-partners-info-text">
																	등록된 <span class="text-center p5-bold" style="font-weight: 500;">'경력'</span>이 없습니다.
																</p>
															</div>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<c:forEach items="${careerList }" var="career" varStatus="loop" begin="0" end="0">
														<div>
															<div class="form-row col-10" id="borderdiv">
																<div class="form-group col-11">
																	<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
																		<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #333; font-size: 16px;">회사명</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_nm }">
																	</div>
																	<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
																		<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #333; font-size: 16px;">근무부서</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_dept }">
																	</div>
																	<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
																		<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #333; font-size: 16px;">직위</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_position }">
																	</div>
																	<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
																		<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #333; font-size: 16px;">근무기간</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_sdt } ~ ${career.c_edt }">
																	</div>
																	<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
																		<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #333; font-size: 16px;">설명</span>
																		<span class="form-control col-9" style="margin-left: 10px; border: none; text-align: left; font-size: 16px; display: table;">${career.c_cont }</span>
																	</div>
																</div>
															</div>
															<br>
														</div>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</span>
									</div>
									<div class="form-control part col-11">
										<a class="pull-right" href="${cp }/user/career?user_id=${user.user_id}" style="color:#2099bb; font-size:14px; margin-right:-100px;">경력 더 보기 <i class="fas fa-chevron-right"></i></a>
									</div>
									<br> <br>
								</div>
								<div class="form-group col-12">
									<div class="form-control part col-4" style="margin-left: 2%">
										<span style="font-size:16px; font-weight:400;">평가</span>
									</div>
										<c:choose>
												<c:when test="${projectEvalList[0] == null}">
													<div class="form-control part col-8" style="margin-left: 12%">
														<br>
															<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
																<div style="display: table-cell; vertical-align: middle;">
																	<div>
																		<img src="${cp }/images/profile_evaluation.png" style="vertical-align: middle;">
																		<p class="p5-no-partners-info-text">
																			등록된 <span class="text-center p5-bold" style="font-weight: 500;">'평가'</span>가 없습니다.
																		</p>
																	</div>
																</div>
															</div>
													</div>
												</c:when>
												<c:otherwise>
												<div class="form-control row part col-12" style="margin-left: 2%">
													<br>
				                                    	<div class="row">	
														<c:forEach items="${projectEvalList}" var="projectEval" begin="0" end="1">
				                                    		<div class="form-row col-5" style="border: 1px solid darkgray; padding: 10px 5px 10px 5px; margin-left: 3%">
																<div class="form-group col-12">
																	<div class="form-row col-12">
																		<a class="col-12" href="${cp }/project/viewProject?p_code=${projectEval.p_code}" ><span class="form-control col-10 etitle" style="border: none; text-align: left; padding-top: 4px; color: #2099bb; font-size: 18px; font-weight: 500;">${projectEval.p_title }</span></a>
																	</div>
																	<div class="form-row" style="border-bottom: 1px solid lightgray; border-top: 1px solid lightgray;">
																		<span class="form-control col-3" style="border: none; text-align: center; padding-top: 8px; color: #333; background-color: #f7f7f7; font-size: 12px;">계약금액</span> 
																		<input readonly="readonly" type="text" class="form-control col-3" style="border: none; text-align: left; font-size: 16px;" value="<fmt:formatNumber value="${projectEval.p_money}" /> 원"> 
																		<span class="form-control col-3" style="border: none; text-align: center; padding-top: 8px; color: #333; background-color: #f7f7f7; font-size: 12px;">프로젝트기간</span> 
																		<input readonly="readonly" type="text" class="form-control col-3" id="sumMoney" style="border: none; text-align: left; font-size: 16px;" value="${projectEval.period } 일">
																	</div>
																	<div class="form-row col-13">
																		<span class="form-control col-5" style="border: none; text-align: left; padding-top: 8px; color: #333; font-size: 14px;"><i class="fas fa-star" style="color: #ffc107;"></i> 평균평점 &nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: 500; color:black;">${projectEval.average}.0 점</span></span>
																		<ul class="rating-box" style="width: 100%; background-color: #f7f7f7; list-style: none; margin-bottom: 5px; padding: 10px 15px 5px 5px;">
																		<li class="details row"><span class="col-2 title">전문성</span>  
																			<div class="row col-4">     
																				<c:if test="${projectEval.pro == 5 }">
																					<!-- 5점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="background: transparent; width: 100%;">
													                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.pro == 4 }">
																					<!-- 4점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.pro == 3 }">
																					<!-- 3점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.pro == 2 }">
																				<!-- 2점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-50" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.pro == 1 }">
																				<!-- 1점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-25" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.pro == 0 }">
																				<!-- 0점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
													                                    <div class="progress-bar bg-warning" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																			</div>
																			<span class="score" style="margin-left: 1%">${projectEval.pro}.0</span>
																			<span class="col-2 title">만족도</span>
																			<div class="row col-4">     
																				<c:if test="${projectEval.sat == 5 }">
																					<!-- 5점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="background: transparent; width: 100%;">
													                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.sat == 4 }">
																					<!-- 4점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.sat == 3 }">
																					<!-- 3점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.sat == 2 }">
																				<!-- 2점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-50" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.sat == 1 }">
																				<!-- 1점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-25" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.sat == 0 }">
																				<!-- 0점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
													                                    <div class="progress-bar bg-warning" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																			</div>
																		<span class="score" style="margin-left: 1%">${projectEval.sat}.0</span></li>
																		<li class="details row"><span class="col-2 title">의사소통</span>  
																			<div class="row col-4">     
																				<c:if test="${projectEval.comm == 5 }">
																					<!-- 5점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="background: transparent; width: 100%;">
													                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.comm == 4 }">
																					<!-- 4점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.comm == 3 }">
																					<!-- 3점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.comm == 2 }">
																				<!-- 2점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-50" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.comm == 1 }">
																				<!-- 1점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-25" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.comm == 0 }">
																				<!-- 0점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
													                                    <div class="progress-bar bg-warning" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																			</div>
																			<span class="score" style="margin-left: 1%">${projectEval.comm}.0</span>
																			<span class="col-2 title">일정 준수</span>
																			<div class="row col-4">     
																				<c:if test="${projectEval.ontime == 5 }">
																					<!-- 5점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="background: transparent; width: 100%;">
													                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.ontime == 4 }">
																					<!-- 4점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.ontime == 3 }">
																					<!-- 3점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.ontime == 2 }">
																				<!-- 2점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-50" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.ontime == 1 }">
																				<!-- 1점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-25" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.ontime == 0 }">
																				<!-- 0점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
													                                    <div class="progress-bar bg-warning" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																			</div>
																			<span class="score" style="margin-left: 1%">${projectEval.ontime}.0</span></li>
																		<li class="details row"><span class="col-2 title">적극성</span>
																			<div class="row col-4">     
																				<c:if test="${projectEval.activity == 5 }">
																					<!-- 5점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="background: transparent; width: 100%;">
													                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.activity == 4 }">
																					<!-- 4점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-100" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.activity == 3 }">
																					<!-- 3점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-75" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.activity == 2 }">
																				<!-- 2점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-50" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.activity == 1 }">
																				<!-- 1점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
														                                 <div class="progress mb-2 w-25" style="background: transparent;">
														                                    <div class="progress-bar bg-warning w-75" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
														                                 </div>
													                                 </div>
																				</c:if>
																				<c:if test="${projectEval.activity == 0 }">
																				<!-- 0점 그래프 -->				                                    	
													                                 <div class="progress mb-2" style="width: 100%;">
													                                    <div class="progress-bar bg-warning" role="progressbar"  aria-valuemin="0" aria-valuemax="100"></div>
													                                 </div>
																				</c:if>
																			</div>
																			<span class="score" style="margin-left: 1%">${projectEval.activity}.0</span></li>
																		</ul>
																	</div>
																	<div class="form-row col-13">
																		<c:if test="${projectEval.e_cont != null}">
																			<span class="form-control col-11" style="border: none; text-align: left; padding-top: 8px; color: #333; font-size: 14px;">클라이언트의 평가</span>
																			<br>
																			<input readonly="readonly" type="text" class="form-control col-2" style="margin-left: 10px; border: none; text-align: center; font-size: 14px; font-weight: 500;" value="${projectEval.user_id}">
																			<input readonly="readonly" type="text" class="form-control col-9" style="margin-left: 10px; border: none; text-align: left; font-size: 14px;" value="${projectEval.e_cont}">
																		</c:if>
																		<c:if test="${projectEval.e_cont == null}">
																			<span class="form-control col-11" style="border: none; text-align: left; padding-top: 8px; color: #333; font-size: 14px;">클라이언트의 평가</span>
																			<br>
																			<input readonly="readonly" type="text" class="form-control col-9" style="margin-left: 10px; border: none; text-align: left; font-size: 14px;" value="등록된 평가가 없습니다.">
																		</c:if>
																	</div>
																</div>
															</div>
															</c:forEach>
														</div>
													</div>
													</c:otherwise>
											</c:choose>
									<div class="form-control part col-11">
										<a class="pull-right" href="${cp }/evaluation/viewmain?user_id=${user.user_id}" style="color:#2099bb; font-size:14px; margin-right:-100px;">평가 더 보기 <i class="fas fa-chevron-right"></i></a>
									</div>
								</div>
								<br>
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
		var web = ${historyMap.web	};
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
});
</script>
<script>
		var pro = ${evalVo.pro}
		var sat = ${evalVo.sat}
		var comm = ${evalVo.comm}
		var ontime = ${evalVo.ontime}
		var activity = ${evalVo.activity}
		var average = ${evalVo.average}
		var user_id = '${evalVo.user_id}'
		
		var ctx = document.getElementById('myChart');
		
		
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				datasets: [{
					data: [pro, sat, comm, ontime, activity, average],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					label: user_id + '의 평점',
					borderWidth: 3
				}],
				labels: ['전문성', '결과물 만족도', '의사소통', '일정준수', '적극성', '평균']
			},
			options: {
				responsive: false,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero : true,
							max : 5,
						}
					}]
				},
				intersect : true,
				
			}
		});
		
</script>

       