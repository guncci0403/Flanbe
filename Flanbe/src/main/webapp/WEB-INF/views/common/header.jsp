<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
    
<!-- START: Pre Loader-->
<div class="se-pre-con">
	<div class="loader"></div>
</div>
<!-- END: Pre Loader-->

<!-- START: Header-->
<div id="header-fix" class="header fixed-top">
	<div class="site-width">
		<nav class="navbar navbar-expand-xl  p-0">
			<div class="navbar-header  h-100 h4 mb-0 align-self-center logo-bar text-left">
				<a href="${cp }/main/view" class="horizontal-logo text-left">
					<span class="h4 font-weight-bold align-self-center mb-0"> 프랜비 </span>
				</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="navbar-nav mr-auto">
				
					<c:choose>
						<c:when test="${S_USER.purpose == 'M' }">
							<li class="nav-item">
								<a class="nav-link p-3" href="${cp }/manage/userList"> <i class="icofont-user-suited"></i> 관리 페이지 </a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="dropdown nav-item active">
								<a class="nav-link p-3" href="#" data-toggle="dropdown"> <i class="icon-layers"></i> 프로젝트 관리 </a>
								<ul class="dropdown-menu">
									<c:choose>
										<c:when test="${S_USER.purpose == 'P'}">
											<li>
												<a class="dropdown-item" href="${cp }/project/selectLikeList">
													<span class="font-weight-bold"> 관심 프로젝트 </span>
												</a>
											</li>
											<li>
												<a class="dropdown-item" href="${cp }/project/requestedapplylist">
													<span class="font-weight-bold"> 지원 요청 </span>
												</a>
											</li>
											<li>
												<a class="dropdown-item" href="${cp }/project/applyList">
													<span class="font-weight-bold"> 지원 내역 </span>
												</a>
											</li>
											<li>
												<a class="dropdown-item" href="${cp }/contract/contractListP?user_id=${S_USER.user_id}&p_state=04&type=s">
													<span class="font-weight-bold"> 계약 </span>
												</a>
											</li>
										</c:when>
										<c:when test="${S_USER.purpose == 'C'}">
											<li>
												<a class="dropdown-item" href="${cp }/project/beforeProjectList">
													<span class="font-weight-bold"> 검수 중 </span>
												</a>
											</li>
											<li>
												<a class="dropdown-item" href="${cp }/project/selectUserProject?user_id=${S_USER.user_id}">
													<span class="font-weight-bold"> 지원자 모집 중 </span>
												</a>
											</li>
											<li>
												<a class="dropdown-item" href="${cp }/contract/contractList?user_id=${S_USER.user_id}&p_state=04&type=s">
													<span class="font-weight-bold"> 계약 </span>
												</a>
											</li>
										</c:when>
									</c:choose>
									<li>
										<a class="dropdown-item" href="${cp }/project/ingProjectList">
											<span class="font-weight-bold"> 진행중인 프로젝트 </span>
										</a>
									</li>
									<li>
										<a class="dropdown-item" href="${cp }/project/finishProjectList">
											<span class="font-weight-bold"> 완료한 프로젝트 </span>
										</a>
									</li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
					<c:if test="${S_USER.purpose == 'C'}">
						<li class="nav-item">
							<a class="nav-link p-3" href="${cp }/project/insertProject"> <i class="icon-pencil"></i> 프로젝트 등록 </a>
						</li>
					</c:if>
					<li class="nav-item">
						<a class="nav-link p-3" href="${cp }/project/selectProject"> <i class="icon-briefcase"></i> 프로젝트 찾기 </a>
					</li>
					<li class="nav-item">
						<a class="nav-link p-3" href="${cp }/user/partnerList"> <i class="icon-people"></i> 파트너스 찾기 </a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link p-3" href="#" data-toggle="dropdown"> <i class="icon-book-open"></i> 프랜비 소식 </a>
						<ul class="dropdown-menu">
							<li>
								<a class="dropdown-item" href="${cp }/board/view?b_no=1">
									<span class="font-weight-bold"> 공지사항 </span>
								</a>
							</li>
							<li>
								<a class="dropdown-item" href="${cp }/board/view?b_no=2">
									<span class="font-weight-bold"> 자주묻는질문 </span>
								</a>
							</li>
							<li>
								<a class="dropdown-item" href="${cp }/board/view?b_no=3">
									<span class="font-weight-bold"> 건의사항 </span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
				<div class="navbar-right ml-auto h-100">
					<ul class="ml-auto p-0 m-0 list-unstyled d-flex top-icon h-100">
						<li class="dropdown align-self-center">
							<a href="#" class="nav-link" data-toggle="dropdown" aria-expanded="false" style="padding-top: 24%;"><i class="far  h5 mr-2 fa-handshake"></i>
							</a>
							<ul class="dropdown-menu dropdown-menu-right border  py-0">
								<c:forEach items="${pList }" var="p">
									<li>
										<a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="${cp }/note/viewMain?p_code=${p.p_code}">
											${p.p_title }
										</a>
									</li>
								</c:forEach>									
							</ul>
						</li>
						<!-- 쪽지 알람 메시지 STATRT -->
						<li class="dropdown align-self-center d-inline-block">
	                    	<a href="#" class="nav-link" data-toggle="dropdown" aria-expanded="false">
	                    		<img src="${cp }/images/message.png" alt="" class="d-flex img-fluid rounded-circle" width="17">
	                    			<c:if test="${alarmList.size() != 0 }">
		                        		<span class="badge badge-default">
			                           		<span class="ring"></span>
			                           		<span class="ring-point"></span>
		                        		</span>
	                        		</c:if>
	                     	</a>
		                    <ul class="dropdown-menu dropdown-menu-right border py-0">
		                     	<c:forEach items="${alarmList }" var="alarmList">
		                        	<li class="mailAlarm">
		                           		<a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="${cp }/message/messagedetail?m_no=${alarmList.m_no }">
		                              		<div class="media">
		                                 		<img src="${cp }/images/r_message.png" alt="" class="d-flex mr-3 img-fluid rounded-circle w-60">
		                                 		<div class="media-body">
		                                    		<p class="mb-0 text-success">'${alarmList.s_id}' 님이 보낸 쪽지</p>
													<fmt:formatDate value="${alarmList.m_regdt}" pattern="yyyy-MM-dd" />
		                                    	</div>
		                                	</div>
		                            	</a>
		                            </li>
		                        </c:forEach>
		                        <li>
									<a class="dropdown-item text-center py-2" href="${cp }/message/main"> 쪽지함 <i class="icon-arrow-right pl-2 small"></i></a>
		                    	</li>
		                	</ul>
		                </li>
	                  	<!-- 쪽지 알람 메시지 END -->
						
						<li class="dropdown user-profile align-self-center d-inline-block">
							<a href="#" class="nav-link py-0" data-toggle="dropdown" aria-expanded="false">
								<div class="media">
									<img src="${cp }/user/profileImg?user_id=${S_USER.user_id}" alt="" class="d-flex img-fluid rounded-circle" width="37">
								</div>
                            </a>

                            <div class="dropdown-menu border dropdown-menu-right p-0">
<%--                             	<a href="${cp }/user/mainpopol" class="dropdown-item px-2 align-self-center d-flex"> --%>
<!--                                     <span class="icon-user mr-2 h6 mb-0"></span>내 프로필 -->
<!--                                 </a> -->
								<c:choose>
									<c:when test="${S_USER.purpose == 'P'}">
										<a href="${cp }/user/profile" class="dropdown-item px-2 align-self-center d-flex">
										    <span class="icon-user mr-2 h6 mb-0"></span> 내 프로필
										</a>
									</c:when>
									<c:when test="${S_USER.purpose == 'C'}">
										<a href="${cp }/user/intro" class="dropdown-item px-2 align-self-center d-flex">
										    <span class="icon-user mr-2 h6 mb-0"></span> 내 프로필
										</a>
									</c:when>
								</c:choose>
<!--                             	<a href="" class="dropdown-item px-2 align-self-center d-flex"> -->
<!--                                     <span class="icon-user mr-2 h6 mb-0"></span> View Profile -->
<!--                                 </a> -->
<!--                                 <div class="dropdown-divider"></div> -->
<!--                                 <a href="" class="dropdown-item px-2 align-self-center d-flex"> -->
<!--                                     <span class="icon-support mr-2 h6  mb-0"></span> Help Center -->
<!--                                 </a> -->
<!--                                 <a href="" class="dropdown-item px-2 align-self-center d-flex"> -->
<!--                                     <span class="icon-globe mr-2 h6 mb-0"></span> Forum</a> -->
<!--                                 <a href="" class="dropdown-item px-2 align-self-center d-flex"> -->
<!--                                     <span class="icon-settings mr-2 h6 mb-0"></span> Account Settings -->
<!--                                 </a> -->
                                <div class="dropdown-divider"></div>
                                <a href="${cp }/login/logout" class="dropdown-item px-2 text-danger align-self-center d-flex">
                                    <span class="icon-logout mr-2 h6  mb-0"></span> Sign Out
                                </a>
                            </div>
                        </li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</div>
