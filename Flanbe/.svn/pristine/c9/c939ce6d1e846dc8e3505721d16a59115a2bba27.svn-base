<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
/* $(function(){
	$("#cancelBtn").on("click", function(){
		window.history.back();     //이전 페이지로 이동
	}); */
function popolDelete(){	
    if (confirm("해당 포트폴리오를 삭제하시겠습니까?")) {
		$("#frm").attr("method", "post");
		$("#frm").attr("action", "${cp }/user/deletepopol");
		$("#frm").submit();
	};
}

</script>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<!-- START: Main Content-->
<main>
	<form id="frm">
		<input type="hidden" id="po_no" name="po_no" value="${detailpopol.po_no}">
	</form>
	
	<div class="content">

		<!-- END: Card DATA-->
		<div class="profile_frame">

			<div class="col-11 mt-4 pl-lg-0">
				<div class="card border  h-mail-list-section">
					<section >
					<div class="p5-profile-head">					
						<h4 style="font-weight:500;">
							${detailpopol.po_title} 
							<c:if test="${detailpopol.po_repre == 'Y'}">
								<span class="badge badge-pill badge-warning p-2 mb-1"><strong>대표작품</strong></span>
							</c:if>
						</h4>
						<h6 style="font-weight:400;">${detailpopol.user_id}님의 포트폴리오</h6>
						
                         </div>
					</section>
					<section class="detailpopl-section" style="margin:25px;">
						<div>
							<table class="p5-partners-portfolio-info-table">
							<tbody>
								<tr>
									<td><span class="p5-bar"></span>카테고리</td>
									<td class="p5-portfolio-category text-muted">개발</td>
								</tr>
								
								<tr>
									<td style="line-height: 1.5;"><span class="p5-bar"></span>분야</td>
										<td class="p5-portfolio-category text-muted" style="word-break: keep-all; line-height: 1.5; margin-top: -3px;">
											<c:set var="poopl_field" value="${detailpopol.po_field}" />
											<c:forEach items="${poopl_field }" var="poopl_field">
												<c:if test="${poopl_field eq '01'}"> 웹 </c:if>
												<c:if test="${poopl_field eq '02'}"> 애플리케이션 </c:if>
												<c:if test="${poopl_field eq '03'}"> 퍼블리싱 </c:if>
												<c:if test="${poopl_field eq '04'}"> 게임 </c:if>
												<c:if test="${poopl_field eq '05'}"> 기타 </c:if>
											</c:forEach>
										</td>
									</tr>	
									
								<tr>
									<td><span class="p5-bar"></span>설명</td>
									<td style="color: #999999; padding-bottom: 11px;">
									  <% pageContext.setAttribute("newLineChar", "\n"); %>
									  <c:set value="${detailpopol.po_cont}" var="po_cont"></c:set>
									  <p class="p5-portfolio-category-description text-muted">
											${fn:replace(po_cont, newLineChar, '<br/>')}</p></td>
								</tr> 
								
								<tr>
									<td><span class="p5-bar"></span>참여기간</td>
									<td class="p5-portfolio-participationTerm text-muted">
									<fmt:formatDate value="${detailpopol.po_sdt }" pattern="yyyy-MM" />
									 - <fmt:formatDate value="${detailpopol.po_edt }" pattern="yyyy-MM" />
									 </td>								 
								</tr>
								
								<tr>
									<td><span class="p5-bar"></span>이미지</td>
									<td class="p5-portfolio-img-list">
									<c:choose>
										<c:when test="${detailpopol.po_image == null}">
										포트폴리오 <strong>'이미지'</strong>가 없습니다.
									    </c:when>
										<c:otherwise>
										<img src="${cp }/user/popolimg?po_no=${detailpopol.po_no}" style="max-width:100%; height:auto;">
										</c:otherwise>
								     </c:choose>
								 <h5 class="text-muted"></h5></td>
								</tr>
								
								<tr>
									<td style="padding-top: 5px;"><span class="p5-bar">
									</span>관련 기술</td>
										<td class="portfolio-skills-tag-viewbox">
										<c:choose>
											<c:when test="${detailpopol.po_skil == null}">
										    	<strong>'관련 기술'</strong>이 없습니다.
									   		 </c:when>
											 <c:otherwise>
												<c:set var="po_skil" value="${detailpopol.po_skil}" /> 
												<c:forEach items="${fn:split(po_skil, ',') }" var="popol_skil">
													<span id="poskil" class="badge badge-pill badge-secondary p-2 mb-1">
														${popol_skil} </span>
												</c:forEach>
											 </c:otherwise>
										</c:choose>
									</td>										
								</tr>
									
								<tr>
									<td><span class="p5-bar"></span>관련 파일</td>
									<td class="p5-portfolio-participationTerm text-muted">
											<c:forEach items="${filesList}" var="filesList">
									 			<input type="hidden" value="${filesList.a_route }" id="a_route">
												<a href="${cp }/user/popolfileDownload?a_no=${filesList.a_no}">
													${filesList.a_nm}</a>
												<br>
											</c:forEach>								
									</td>									 
								</tr>
							</tbody>
							</table>
						</div>
						<c:if test="${user.user_id == S_USER.user_id }">
							<div class="form-group" style="margin-right: 50px; float: right;">
								<button type="button" class="btn btn-primary" onclick="location.href='${cp }/user/modifypopolView?po_no=${detailpopol.po_no }'">수정</button>
								<button type="button" class="btn btn-secondary" onclick="popolDelete()">삭제</button>
							</div>
						</c:if>
					</section>
				</div>
			 </div>
		</div>
	</div>
</main>