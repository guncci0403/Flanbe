<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>프랜비</title>
	<link rel="shortcut icon" href="dist/images/favicon.ico" />
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="${cp }/css3/quick-website.css" id="stylesheet">
	<%@ include file="/WEB-INF/views/common/common_css.jsp"%>
</head>

<!-- START: Body-->
<body id="main-container" class="default">
	
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
					<a href="${cp }/main/view" class="horizontal-logo text-left"> <span class="h4 font-weight-bold align-self-center mb-0"> 프랜비 </span>
					</a>
				</div>
				<div class="navbar-collapse collapse" style="">
					<ul class="navbar-nav mr-auto">

						<c:choose>
							<c:when test="${S_USER.purpose == 'M' }">
								<li class="nav-item"><a class="nav-link p-3" href="${cp }/manage/userList"> <i class="icofont-user-suited"></i> 관리 페이지
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="dropdown nav-item active"><a class="nav-link p-3" href="#" data-toggle="dropdown"> <i class="icon-layers"></i> 프로젝트 관리
								</a>
									<ul class="dropdown-menu">
										<c:choose>
											<c:when test="${S_USER.purpose == 'P'}">
												<li><a class="dropdown-item" href="${cp }/project/selectLikeList"> <span class="font-weight-bold"> 관심 프로젝트 </span>
												</a></li>
												<li><a class="dropdown-item" href="#"> <span class="font-weight-bold"> 지원 요청 </span>
												</a></li>
												<li><a class="dropdown-item" href="${cp }/project/applyList"> <span class="font-weight-bold"> 지원 내역 </span>
												</a></li>
												<li>
												<a class="dropdown-item" href="${cp }/contract/contractListP?user_id=${S_USER.user_id}&p_state=04&type=s">
													<span class="font-weight-bold"> 계약 </span>
												</a>
												</li>
											</c:when>
											<c:when test="${S_USER.purpose == 'C'}">
												<li><a class="dropdown-item" href="${cp }/project/beforeProjectList"> <span class="font-weight-bold"> 검수 중 </span>
												</a></li>
												<li><a class="dropdown-item" href="${cp }/project/selectUserProject?user_id=${S_USER.user_id}"> <span class="font-weight-bold"> 지원자 모집 중 </span>
												</a></li>
												<li>
												<a class="dropdown-item" href="${cp }/contract/contractList?user_id=${S_USER.user_id}&p_state=04&type=s">
													<span class="font-weight-bold"> 계약 </span>
												</a>
												</li>
											</c:when>
										</c:choose>
										<li><a class="dropdown-item" href="${cp }/project/ingProjectList"> <span class="font-weight-bold"> 진행중인 프로젝트 </span>
										</a></li>
										<li><a class="dropdown-item" href="${cp }/project/finishProjectList"> <span class="font-weight-bold"> 완료한 프로젝트 </span>
										</a></li>
									</ul></li>
							</c:otherwise>
						</c:choose>
						<c:if test="${S_USER.purpose == 'C'}">
							<li class="nav-item"><a class="nav-link p-3" href="${cp }/project/insertProject"> <i class="icon-pencil"></i> 프로젝트 등록
							</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link p-3" href="${cp }/project/selectProject"> <i class="icon-briefcase"></i> 프로젝트 찾기
						</a></li>
						<li class="nav-item"><a class="nav-link p-3" href="${cp }/user/partnerList"> <i class="icon-people"></i> 파트너스 찾기
						</a></li>
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
							<li class="dropdown align-self-center"><a href="#" class="nav-link" data-toggle="dropdown" aria-expanded="false" style="padding-top: 24%"><i class="far  h5 mr-2 fa-handshake"></i> </a>
								<ul class="dropdown-menu dropdown-menu-right border  py-0">
									<c:forEach items="${pList }" var="p">
										<li><a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="${cp }/note/viewMain?p_code=${p.p_code}"> ${p.p_title } </a></li>
									</c:forEach>
								</ul></li>
							<!-- 쪽지 알람 메시지 STATRT -->
							<li class="dropdown align-self-center d-inline-block"><a href="#" class="nav-link" data-toggle="dropdown" aria-expanded="false"> <img src="${cp }/images/message.png" alt="" class="d-flex img-fluid rounded-circle" width="17"> <c:if test="${alarmList.size() != 0 }">
										<span class="badge badge-default"> <span class="ring"></span> <span class="ring-point"></span>
										</span>
									</c:if>
							</a>
								<ul class="dropdown-menu dropdown-menu-right border py-0">
									<c:forEach items="${alarmList }" var="alarmList">
										<li class="mailAlarm"><a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="${cp }/message/messagedetail?m_no=${alarmList.m_no }">
												<div class="media">
													<img src="${cp }/images/r_message.png" alt="" class="d-flex mr-3 img-fluid rounded-circle w-60">
													<div class="media-body">
														<p class="mb-0 text-success">'${alarmList.s_id}' 님이 보낸 쪽지</p>
														<fmt:formatDate value="${alarmList.m_regdt}" pattern="yyyy-MM-dd" />
													</div>
												</div>
										</a></li>
									</c:forEach>
									<li><a class="dropdown-item text-center py-2" href="${cp }/message/main"> 쪽지함 <i class="icon-arrow-right pl-2 small"></i></a></li>
								</ul></li>
							<!-- 쪽지 알람 메시지 END -->

							<li class="dropdown user-profile align-self-center d-inline-block">
								<a href="#" class="nav-link py-0" data-toggle="dropdown" aria-expanded="false">
									<div class="media">
										<img src="${cp }/user/profileImg?user_id=${S_USER.user_id}" alt="" class="d-flex img-fluid rounded-circle" width="37">
									</div>
								</a>

								<div class="dropdown-menu border dropdown-menu-right p-0">
									<c:choose>
										<c:when test="${S_USER.purpose == 'P'}">
											<a href="${cp }/user/profile" class="dropdown-item px-2 align-self-center d-flex"> <span class="icon-user mr-2 h6 mb-0"></span> 내 프로필
											</a>
										</c:when>
										<c:when test="${S_USER.purpose == 'C'}">
											<a href="${cp }/user/intro" class="dropdown-item px-2 align-self-center d-flex"> <span class="icon-user mr-2 h6 mb-0"></span> 내 프로필
											</a>
										</c:when>
									</c:choose>
									<div class="dropdown-divider"></div>
									<a href="${cp }/login/logout" class="dropdown-item px-2 text-danger align-self-center d-flex"> <span class="icon-logout mr-2 h6  mb-0"></span> Sign Out
									</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- 헤더 -->

	<main class="flanbe">
		<div class="container-fluid site-width">

			<!-- Preloader -->
			<div class="preloader"></div>
			<div class="modal fade" tabindex="-1" role="dialog" id="modal-cookies" data-backdrop="false" aria-labelledby="modal-cookies" aria-hidden="true">
				<div class="modal-dialog modal-dialog-aside left-4 right-4 bottom-4">
					<div class="modal-content bg-dark-dark">
						<div class="modal-body">
							<!-- Text -->
							<p class="text-sm text-white mb-3">We use cookies so that our themes work for you. By using our website, you agree to our use of cookies.</p>
							<!-- Buttons -->
							<a href="pages/utility/terms.html" class="btn btn-sm btn-white" target="_blank">Lear12n more</a>
							<button type="button" class="btn btn-sm btn-primary mr-2" data-dismiss="modal">OK</button>
						</div>
					</div>
				</div>
			</div>
			<!-- Go Pro -->
			<!-- Navbar -->
			<!-- Main content -->
			<section class="slice py-7">
				<div class="container">
					<div class="row row-grid align-items-center">
						<div class="col-12 col-md-5 col-lg-6 order-md-2 text-center">
							<!-- Image -->

							<img alt="Image placeholder" src="${cp }/img/svg/illustrations/illustration-3.svg" class="img-fluid mw-md-120">
						</div>
						<div class="col-12 col-md-7 col-lg-6 order-md-1 pr-md-5">
							<!-- Heading -->
							<h1 class="display-4 text-center text-md-left mb-3">
								IT 아웃소싱을<br> <strong class="text-primary">프랜비</strong>에서 <br>빠르고 안전하게
							</h1>
							<!-- Text -->
							<p class="lead text-center text-md-left text-muted">웹, 애플리케이션, 퍼블리싱, 게임 기타 등</p>
							<!-- Buttons -->
						</div>
					</div>
				</div>
			</section>
			<section class="slice slice-lg pt-lg-6 pb-0 pb-lg-6 bg-section-secondary">
				<div class="container">
					<!-- Title -->
					<!-- Section title -->
					<div class="row mb-5 justify-content-center text-center">
						<div class="col-lg-6">
							<span class="badge badge-soft-success badge-pill badge-lg"> Get started </span>
							<h2 class=" mt-4">
								다양한 카테고리의 IT 프로젝트를<br>등록해보세요
							</h2>
							<div class="mt-2">
								<p class="lead lh-180">Register for IT projects in various categories</p>
							</div>
						</div>
					</div>
					<!-- Card -->
					<div class="row mt-5">
						<div class="col-md-4">
							<div class="card">
								<div class="card-body pb-5">
									<div class="pt-4 pb-5">
										<img src="${cp }/img/svg/illustrations/illustration-5.svg" class="img-fluid img-center" style="height: 150px;" alt="Illustration" />
									</div>
									<h5 class="h4 lh-130 mb-3">클라이언트</h5>
									<p style="font-size: 17px;" class="text-muted mb-0">의뢰하고 싶은 프로젝트를 무료로 등록해보세요. 프로젝트는 프랜비 관리자와 계약 후 공개됩니다.</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<div class="card-body pb-5">
									<div class="pt-4 pb-5">
										<img src="${cp }/img/svg/illustrations/illustration-6.svg" class="img-fluid img-center" style="height: 150px;" alt="Illustration" />
									</div>
									<h5 class="h4 lh-130 mb-3">프랜비</h5>
									<p style="font-size: 17px;" class="text-muted mb-0">
										클라이언트와 파트너스를 프랜비가 빠르고 신뢰성있게 연결해드립니다.<br> 믿고 이용해주세요.
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<div class="card-body pb-5">
									<div class="pt-4 pb-5">
										<img src="${cp }/img/svg/illustrations/illustration-1.svg" class="img-fluid img-center" style="height: 150px;" alt="Illustration" />
									</div>
									<h5 class="h4 lh-130 mb-3">파트너스</h5>
									<p style="font-size: 17px;" class="text-muted mb-0">프로필을 등록하고 다양한 프로젝트에 지원해보세요. 프로필을 등록하고 프로젝트에 편리하게 지원해보세요.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="slice slice-lg">
				<div class="container">
					<div class="py-6">
						<div class="row row-grid justify-content-between align-items-center">
							<div class="col-lg-5 order-lg-2">
								<h5 class="h3">세상이 일하는 방식을 더 행복하게</h5>
								<p class="lead my-4">IT 기술의 발달로 일하는 방식이 변화하고 있습니다. 우리가 맞이할 미래의 일하는 방식은 과거와 같지 않을 것입니다. 프랜비는 계속해서 변화하는 사회와 시장의 문제를 앞장서서 해결하며, 세상이 일하는 방식을 더 행복하게 변화시키고자 합니다.</p>
							</div>
							<div class="col-lg-6 order-lg-1">
								<div class="card mb-0 mr-lg-5">
									<div class="card-body p-2">
										<img alt="Image placeholder" src="${cp }/img/svg/illustrations/process_3.png" class="img-fluid shadow rounded">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="py-6">
						<div class="row row-grid justify-content-between align-items-center">
							<div class="col-lg-5">
								<h5 class="h3">우리는 IT 아웃소싱 시장의 거래 방식을 혁신하고 있습니다.</h5>
								<p class="lead my-4">프랜비는 소프트웨어 전문가/회사와 기업을 연결하여 기업의 디지털 기술을 활용한 비즈니스 혁신을 돕고 있습니다. 더 빠르고, 더 편리하고, 더 정확한 방법으로 소프트웨어를 거래할 수 있는 플랫폼을 만들고 있습니다.</p>
							</div>
							<div class="col-lg-6">
								<div class="card mb-0 ml-lg-5">
									<div class="card-body p-2">
										<img alt="Image placeholder" src="${cp }/img/svg/illustrations/process_4.png" class="img-fluid shadow rounded">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="slice slice-lg bg-section-secondary">
				<div class="container text-center">
					<div class="row justify-content-center mb-6">
						<div class="col-lg-8">
							<!-- Title -->
							<h2 class="h1 strong-600">빠르고 안전한 IT 아웃소싱 플랫폼</h2>
							<!-- Text -->
							<p class="text-muted">기업의 프로젝트와 개발회사 & 프리랜서를 이어주는 온라인 IT 아웃소싱 플랫폼</p>
						</div>
					</div>
					<div class="text-center text-md-left mt-5">
						<a style="margin-left: 480px;" href="${cp }/main/instruction" class="btn btn-primary btn-icon"> <span class="btn-inner--text">&nbsp;&nbsp;이용방법</span> <span class="btn-inner--icon"><i data-feather="chevron-right"></i></span>
						</a>
					</div>
				</div>
			</section>
			<footer class="position-relative" id="footer-main">
				<div class="footer pt-lg-7 footer-dark bg-dark">
					<!-- SVG shape -->
					<div class="shape-container shape-line shape-position-top shape-orientation-inverse">
						<svg width="2560px" height="100px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="none" x="0px" y="0px" viewBox="0 0 2560 100" style="enable-background: new 0 0 2560 100;" xml:space="preserve" class=" fill-section-secondary">
                    <polygon points="2560 0 2560 100 0 100"></polygon>
                </svg>
					</div>
					<!-- Footer -->
					<div class="container pt-4">
						<div class="row">
							<div class="col-lg-4 mb-5 mb-lg-0">
								<!-- Theme's logo -->
								<a href="index.html"> <img alt="Image placeholder" src="${cp }/img/mainlogo.png" id="footer-logo" width="250px;" height="150px;">
								</a>
								<!-- Webpixels' mission -->
								<p class="mt-4 text-sm opacity-8 pr-lg-4">플랜비 [대덕인재개발원 5조 화이팅]</p>
								<!-- Social -->
							</div>
							<div class="col-lg-2 col-6 col-sm-4 ml-lg-auto mb-5 mb-lg-0">
								<h6 class="heading mb-3">PL</h6>
								<ul class="list-unstyled">
									<li><a>[유동기]</a></li>
								</ul>
							</div>
							<div class="col-lg-2 col-6 col-sm-4 mb-5 mb-lg-0">
								<h6 class="heading mb-3">Team</h6>
								<ul class="list-unstyled">
									<li><a>[김수연]</a></li>
									<li><a>[백수진]</a></li>
									<li><a>[오제현]</a></li>
									<li><a>[이건영]</a></li>
									<li><a>[이수정]</a></li>
								</ul>
							</div>
							<div class="col-lg-2 col-6 col-sm-4 mb-5 mb-lg-0">
								<h6 class="heading mb-3">Company</h6>
								<ul class="list-unstyled">
									<li><a href="#">[대덕인재개발원]</a></li>
									<li><a href="#">[8월반]</a></li>
									<li><a href="#">[5조]</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- Core JS  -->
			<!-- Feather Icons -->
			<script>
// 				$(function() {
// 					feather.replace({
// 						'width' : '1em',
// 						'height' : '1em'
// 					})
// 				})
			</script>

		</div>
	</main>
	<%@ include file="/WEB-INF/views/common/common_js.jsp"%>
</body>
</html>