<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="card bg-primary-light">
	<div class="card-header d-flex justify-content-between align-items-center">
		<h6 class="card-title">진행예정 : ${beforeListCnt}개</h6>
	</div>

	<!-- 카드보드 진행예정 전체 -->

	<div class="card-body">
		<div class="task-list">
			<c:forEach items="${beforeListNote}" var="beforeNote">
				<div class="${beforeNote.n_no}" onclick="oneArticle(this)">
					<div class="card my-2 task-card color">
						<%--  <input type="hidden" value="${beforeNote.n_no}" class="n_no"> --%>
						<div class="card-content">
							<div class="card-body p-4 body-color">
								<c:if test="${beforeNote.n_import == '01' }">
									<span id="star">⭐</span>
								</c:if>
								<h6 class="mb-3 font-w-600">
									<c:if test="${beforeNote.n_import == '01' }">
										<span id="star">⭐</span>
									</c:if>${beforeNote.n_title }<c:if test="${beforeNote.n_import == '01' }">
										<span id="star">⭐</span>
									</c:if>
								</h6>

								<div class="task-content mb-3"></div>
								<p class="font-w-500 tx-s-12">
									<i class="icon-calendar"></i> <span class="task-date">${beforeNote.n_sdt} ~ ${beforeNote.n_edt}</span>
								</p>
								<p class="font-w-500 tx-s-12" style="font-size: 15px">
									<i></i>&#128106;<span class="task-date"> 작성자 : ${beforeNote.user_id}</span>
								</p>
								<span class="blue evalbar" data-val='${beforeNote.progress }'>${beforeNote.progress }%</span>

								<c:if test="${S_USER.user_id == beforeNote.user_id}">
									<!-- 연필모양 , 휴지통 이모티콘 -->
									<div class="d-flex">
										<div class="my-auto line-h-1 h5">
											<a class="text-success updatePen" data-no="${beforeNote.n_no }" data-toggle="modal" data-target="#edittask"><i class="icon-pencil"></i></a> <a class="text-danger deleteTrash" data-no="${beforeNote.n_no}"><i class="icon-trash"></i></a>
										</div>
									</div>
								</c:if>
								<!-- 연필모양 , 휴지통 이모티콘 끝 -->
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- 페이징 처리 -->

<!-- 중요한 애들만 나오면 t , 일반보통은 f 중요한 애들만 있으면 starCheck 가 t 이면 일반을 보여주려 null 보내야함  -->

<li class="page-item" id="pageNumberBoard" style="margin-left: 30%;"><a class="page-link" id="pagingNumber" <c:choose>
							<c:when test="${ starCheck == 'f'}">
								onclick="pagination(1 , '01' , null)"
							</c:when>
							<c:otherwise>
                              	onclick="pagination(1 , '01' , '1')"
                            </c:otherwise>
							
							</c:choose>><i class="fas fa-angle-double-left"></i></a></li>

<c:choose>
	<c:when test="${page1 != 1 }">
		<li class="page-item" id="pageNumberBoard"><a class="page-link" id="pagingNumber" <c:choose>
								<c:when test="${ starCheck == 'f'}">
									onclick="pagination( ${page1 - 1} , '01' ,null)"
								</c:when>
								<c:otherwise>
									onclick="pagination( ${page1 - 1} , '01' , '1')"
								</c:otherwise>
								</c:choose>><i class="fas fa-angle-left"></i></a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item" id="pageNumberBoard"><a class="page-link" id="pagingNumber" <c:choose>
								<c:when test="${ starCheck == 'f'}">
									onclick="pagination(1, '01' , null)"
								</c:when>
								<c:otherwise>
									onclick="pagination(1, '01' , '1')"
								</c:otherwise>
								
								</c:choose>><i class="fas fa-angle-left"></i></a></li>
	</c:otherwise>
</c:choose>




<c:forEach begin="1" end="${beforePagination}" var="i">
	<c:choose>
		<c:when test="${page1 == i }">
			<li class="page-item active" id="pageNumberBoard">
		</c:when>
		<c:otherwise>
			<li class="page-item" id="pageNumberBoard">
		</c:otherwise>
	</c:choose>
	<a class="page-link" id="pagingNumber" <c:choose>
							<c:when test="${ starCheck == 'f'}">
							onclick="pagination(${i} , '01' , null)"
							</c:when>
							<c:otherwise>
							onclick="pagination(${i} , '01' , '1')"
							</c:otherwise>
							</c:choose>>${i}</a>
</c:forEach>




<c:choose>
	<c:when test="${page1 != beforePagination}">
		<li class="page-item" id="pageNumberBoard"><a class="page-link" id="pagingNumber" <c:choose>
								<c:when test="${ starCheck == 'f'}">
									onclick="pagination(${page1 + 1} , '01' , null)"
								</c:when>
								<c:otherwise>
									onclick="pagination(${page1 + 1} , '01' , '1')"
								</c:otherwise>
								</c:choose>><i class="fas fa-angle-right"></i></a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item" id="pageNumberBoard"><a class="page-link" id="pagingNumber" <c:choose>
								<c:when test="${ starCheck == 'f'}">
									onclick="pagination(${beforePagination} , '01' null)"
								</c:when>
								<c:otherwise>
									onclick="pagination(${beforePagination} , '01' , '1')"
								</c:otherwise>
								</c:choose>><i class="fas fa-angle-right"></i></a></li>

	</c:otherwise>

</c:choose>
<li class="page-item" id="pageNumberBoard"><a class="page-link" id="pagingNumber" <c:choose>
							<c:when test="${ starCheck == 'f'}">
								onclick="pagination(${beforePagination} , '01' , null)"
							</c:when>
							<c:otherwise>
								onclick="pagination(${beforePagination} , '01' , '1')"
							</c:otherwise>
								</c:choose>><i class="fas fa-angle-double-right"></i></a></li>

<!--  페이징 처리 끝 -->
