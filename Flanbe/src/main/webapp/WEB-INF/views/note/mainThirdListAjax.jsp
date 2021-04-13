<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
       					<div class="card bg-primary-light">
                            <div class="card-header d-flex justify-content-between align-items-center">                               
                                <h6 class="card-title">완료 : ${finishListCnt}개</h6> 
                   			
                            </div>
                            <div class="card-body">                                   
                                <div class="task-list">   
                                <c:forEach items="${finishListNote}" var="finishNote">   
                                <div class="${finishNote.n_no}" onclick="oneArticle(this)" >                               
                                    <div class="card my-2  task-card color" > 
                                        <div class="card-content">
                                            <div class="card-body p-4 body-color">
                                              <c:if test="${finishNote.n_import == '01' }"> 
                                            <span id="star">⭐</span>
                                              </c:if> 
                                               <h6 class="mb-3 font-w-600"> <c:if test="${finishNote.n_import == '01' }"><span id="star">⭐</span></c:if>${finishNote.n_title }<c:if test="${finishNote.n_import == '01' }"><span id="star">⭐</span></c:if></h6>
                                                <p class="font-w-500 tx-s-12"><i class="icon-calendar"></i> <span class="task-date">${finishNote.n_sdt} ~ ${finishNote.n_edt}</span></p>                                            
                                                    <p class="font-w-500 tx-s-12" style="font-size:15px"><i></i>&#128106;<span class="task-date"> 작성자 : ${finishNote.user_id}</span></p> 
                                                <span class="blue evalbar" data-val='${finishNote.progress }%'>${finishNote.progress }%</span>       
                                                <c:if test="${S_USER.user_id == finishNote.user_id}">
                                                <div class="d-flex">
                                                    <div class="my-auto line-h-1 h5">
                                                        <a class="text-success updatePen" data-no="${finishNote.n_no }"  data-toggle="modal" data-target="#edittask"><i class="icon-pencil"></i></a>
                                                        <a class="text-danger  deleteTrash" data-no="${finishNote.n_no }" ><i class="icon-trash"></i></a>                                  
                                                    </div>                                               
                                                </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                   </div>
                                   </c:forEach> 
                                </div>
                            </div>
                        </div>
                        
                        		<!-- 페이징 처리 -->
						
						<li class="page-item" id="pageNumberBoard" style="margin-left: 30%;"><a class="page-link"
							id="pagingNumber" onclick="pagination(1 , '03')"><i class="fas fa-angle-double-left"></i></a></li>
						
						<c:choose>
						<c:when test="${page3 != 1 }">
							<li class="page-item" id="pageNumberBoard"><a class="page-link"
								id="pagingNumber" onclick="pagination( ${page3 - 1} , '03')"><i class="fas fa-angle-left"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item" id="pageNumberBoard"><a class="page-link"
								id="pagingNumber" onclick="pagination(1, '03')"><i class="fas fa-angle-left"></i></a></li>
						</c:otherwise>
						</c:choose>
						
						
						
						
						<c:forEach begin="1" end="${finishPagination}" var="i">
							<c:choose>
							<c:when test="${page3 == i }"><li class="page-item active" id="pageNumberBoard"></c:when>
							<c:otherwise><li class="page-item" id="pageNumberBoard"></c:otherwise>							
							</c:choose>
							<a class="page-link" id="pagingNumber" onclick="pagination(${i} , '03')">${i}</a></li>
						</c:forEach>
						
						
						
						
						<c:choose>
						<c:when test="${page3 != finishPagination}">
							<li class="page-item" id="pageNumberBoard"><a class="page-link"
								id="pagingNumber" onclick="pagination(${page3 + 1} , '03')"><i class="fas fa-angle-right"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item" id="pageNumberBoard"><a class="page-link"
								id="pagingNumber" onclick="pagination(${finishPagination} , '03')"><i class="fas fa-angle-right"></i></a></li>
						
						</c:otherwise>
						
						</c:choose>
						<li class="page-item" id="pageNumberBoard"><a class="page-link"
							id="pagingNumber" onclick="pagination(${finishPagination} , '03')"><i class="fas fa-angle-double-right"></i></a></li>
						
						<!--  페이징 처리 끝 -->
    
    
