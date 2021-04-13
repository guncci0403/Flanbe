<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/projectSidebar.jsp" %>

<script>
//문서 로딩이 완료되고 나서 실행되는 영역
$(function(){
	<c:if test="${msg != null }">
		alert("${msg}");
	</c:if>
	
});
</script>


<style>
.nav-link:hover {
	color: var(- -primarycolor);
}

.todo-item:hover {
	background: var(- -sidebarbordercolor);
}
</style>

<!-- START: Main Content-->
<main>
	<div class="container-fluid site-width">
		<div class="row ">
			<div class="col-11  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<c:choose>
							<c:when test="${type == 's' }">
								<h4 class="mb-0">진행 중인 계약</h4>
							</c:when>
							<c:otherwise>
								<h4 class="mb-0">완료된 계약</h4>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

		<!-- START: Card Data-->
		<div class="row">
			<div class="col-11 mt-3">
				<div class="card">
					<div class="col-12" style="padding-top: 0px;">
						<div class="card-header border-bottom p-2 d-flex">
							<div class="input-group row col-6" style="height: 36px;">
							</div>
						</div>

						<div class="card-body p-0">
							<ul class="todo-list" style="margin-bottom: 0px;">
								<c:forEach items="${contractList }" var="contract">
									<li class="todo-item">
										<div class="todo-content" data-p_code="${contract.p_code }">
											<h3>프로젝트 : ${contract.p_title }</h3>
											<p class="text-muted mb-0 font-weight-bold todo-date">프로젝트 기간 : ${contract.period }일</p>
<!-- 											<p class="small-content text-muted mb-0">지원자</p> -->
										</div>
										<div class="ml-auto">
											<a class="dropdown-item edit-todo" href="#"><i class="icon-exclamation font-15 mr-2"></i></a>
										</div>
										<div>
											<a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="icon-options-vertical font-15"></i></a>
											<div class="dropdown-menu p-0 m-0 dropdown-menu-right">
												<a class="dropdown-item edit-todo" href="${cp }/contract/view?p_code=${contract.p_code }&puser_id=${contract.puser_id }">계약 내용 보기 </a> <a class="dropdown-item delete" href="#">삭제</a>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
							
						</div>
						<br><br><br>
					</div>
				</div>
			</div>
		</div>
		<!-- END: Card DATA-->
	</div>
</main>
<!-- END: Content-->
