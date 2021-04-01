<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/projectSidebar.jsp" %>

<script>
//문서 로딩이 완료되고 나서 실행되는 영역
$(function(){
	<c:if test="${msg !=null}">
		alert("${msg}");
	</c:if>

});
</script>
<style>
.nav-link:hover {
	color: var(- -primarycolor);
}

.todo-item:hover {
	background: rgba(72, 94, 144, 0.16);
}

.nav-item:hover {
	text-decoration: underline;
}
</style>

<!-- START: Main Content-->
<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<!-- END: Breadcrumbs-->

		<!-- START: Card Data-->
		<div class="row">
			<div class="col-11 mt-3">
				<div class="card">
					<div class="col-12" style="padding-top: 0px;">
						<div class="card-header border-bottom p-2 d-flex">
							<c:choose>
								<c:when test="${type eq 's' }">
									<a href="${cp }/contract/contractList?p_state=${p_state }&user_id=${S_USER.user_id}" class="btn btn-primary py-2 px-2 rounded ml-auto text-white" style="margin-left: 0px !important;">
										<i class="fas fa-list"></i> 목록
									</a>
								</c:when>
								<c:when test="${type eq 'f' }">
									<a href="${cp }/contract/contractList?p_state=06&p_state2=07&p_state3=09&user_id=${S_USER.user_id}" class="btn btn-primary py-2 px-2 rounded ml-auto text-white" style="margin-left: 0px !important;">
										<i class="fas fa-list"></i> 목록
									</a>
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="card-body p-0">
						<div class="col-md-12 col-lg-12">
							<div class="card-body border brd-gray border-top-0 border-right-0 border-left-0">
								<h3 class="mb-0">
									<a class="f-weight-500 text-primary">[${pVo.p_title }] 프로젝트 계약 내용</a>
								</h3>
								<div class="clearfix" style="margin-top: 5px;">
									<c:choose>
										<c:when test="${pVo.p_field  eq '01' }">
											<span>개발분야 : 웹</span>
										</c:when>

										<c:when test="${pVo.p_field  eq '02' }">
											<span>개발분야 : 애플리케이션</span>
										</c:when>
										<c:when test="${pVo.p_field eq '03' }">
											<span>개발분야 : 퍼블리싱</span>
										</c:when>
										<c:when test="${pVo.p_field eq '04'}">
											<span>개발분야 : 게임</span>
										</c:when>
										<c:otherwise>
											<span>개발분야 : 기타</span>
										</c:otherwise>
									</c:choose>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모집 마감일 : <fmt:formatDate value="${pVo.deadline }" pattern="yyyy.MM.dd" /></span>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예상 금액 : ${pVo.p_money }원</span>
								</div><br><br>
							</div>
							<div class="card-body border brd-gray border-top-0 border-right-0 border-left-0">
								<strong class="mb-0" lang="ca"> 프로젝트 내용 </strong> <br> <br>
								<p class="mb-0" lang="ca">${pVo.p_cont }</p>
							</div>
							<c:if test="${!empty userList}">
								<div class="card-body border brd-gray border-top-0 border-right-0 border-left-0">
									<strong class="mb-0" lang="ca"> 계약 예정 파트너스 목록 </strong> <br> <br>
									<ul class="todo-item todo-list">
										<c:forEach items="${userList }" var="user">

											<li class="todo-item">
												<!--                                             <label class="chkbox">                                                         --> <!--                                                 <input type="checkbox"> --> <!--                                                 <span class="checkmark mt-2"></span> --> <!--                                             </label> -->
												<div class="todo-content">
													<p class="mb-0" lang="ca">${user.user_nm }</p>
													<p class="text-muted mb-0 font-weight-bold todo-date">
														미팅 날짜 :
														<fmt:formatDate value="${user.mtdt }"></fmt:formatDate>
													</p>
												</div>
												<div class="ml-auto">
													<c:choose>
														<c:when test="${user.p_state eq '08'}">
															<p class="small-content mb-0 font-15" style="color: #ff6800; margin-right: 20px;" data-meetA>미팅 예정</p> &nbsp;&nbsp;
                                            			</c:when>
														<c:when test="${user.p_state eq '06'}">
															<p class="small-content mb-0 font-15" style="color: green; margin-right: 20px;" data-meetF>미팅완료</p>
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
												</div>
												<div>
													<a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-options-vertical font-15"></i></a>
													<div class="dropdown-menu p-0 m-0 dropdown-menu-right">
														<a class="dropdown-item" href="${cp }/contract/updateMeetFinish?user_id=${user.user_id}&type=${type }&p_code=${pVo.p_code}&state1=${state1}&state2=${state2}&state3=${state3}">미팅 완료</a>
														<c:if test="${user.p_state eq '06'}">
															<a class="dropdown-item" href="${cp }/contract/insertContract?user_id=${user.user_id}&p_code=${pVo.p_code}&p_title=${pVo.p_title }&client_id=${S_USER.user_id}">계약 하기</a>
														</c:if>
														<a class="dropdown-item delete" href="${cp }/contract/updateUserDelete?user_id=${user.user_id}&type=${type }&p_code=${pVo.p_code}&state1=${state1}&state2=${state2}&state3=${state3}">탈 락</a>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</c:if>
							<c:if test="${!empty contractList}">
								<div class="card-body border brd-gray border-top-0 border-right-0 border-left-0">
									<strong class="mb-0" lang="ca"> 계약 파트너스 목록 </strong> <br> <br>
									<ul class="todo-item todo-list">
										<c:forEach items="${contractList }" var="conUser">
											<li class="todo-item">
												<div class="todo-content">
													<p class="mb-0" lang="ca">${conUser.user_nm }</p>
													<p class="text-muted mb-0 font-weight-bold todo-date">미팅 날짜 :</p>
												</div>
												<div class="ml-auto">
													<c:choose>
														<c:when test="${conUser.s_no eq '01'}">
															<p class="small-content mb-0 font-15" style="color: #ff6800; margin-right: 20px;" data-meetA>계약 요청</p> &nbsp;&nbsp;
                                            			</c:when>
														<c:when test="${conUser.s_no eq '02'}">
															<p class="small-content mb-0 font-15" style="color: green; margin-right: 20px;" data-meetF>계약 승인(파트너스)</p>
														</c:when>
														<c:when test="${conUser.s_no eq '03'}">
															<p class="small-content mb-0 font-15" style="color: green; margin-right: 20px;" data-meetF>계약 완료</p>
														</c:when>
													</c:choose>
												</div>
												<div>
													<a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-options-vertical font-15"></i></a>
													<div class="dropdown-menu p-0 m-0 dropdown-menu-right">
														<a class="dropdown-item" href="${cp }/contract/view?p_code=${pVo.p_code }&puser_id=${conUser.puser_id }">계약 내용 보기 </a>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- END: Card DATA-->
		</div>
 			<!-- Modal -->
<!-- 			<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true" style="display: none;"> -->
<!-- 				<div class="modal-dialog" role="document"> -->
<!-- 					<div class="modal-content"> -->
<!-- 						<div class="modal-header"> -->
<!-- 							<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5> -->
<!-- 							<button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 								<span aria-hidden="true">×</span> -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 						<div class="modal-body"></div> -->
<!-- 						<div class="modal-footer"> -->
<!-- 							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
	</div>
</main>