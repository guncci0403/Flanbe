<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
   <!-- 검색시 최신등록순 : data-type=business-note class(????) 는 starred , 평점 높은 순 : personal-note 클래스에 important 평점 낮은순 : work-note 금액 높은순 : social-note  // 기타를 위해 private-note -->
    
    		 <a href="#" class="d-inline-block d-lg-none flip-menu-toggle border-0"><i class="icon-menu"></i></a>
                            <div class="row notes" >
                            
                                
                        
    		<input type="hidden" value="${user_id}" class="user_id">
    		<!-- 리스트이기 때문에 for 문으로 돌려야한다.  -->
				<c:if test="${EvalNullcheck != null}">
				
					<br>
						<div class="p5-assign-component start" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
							<div style="display: table-cell; vertical-align: middle;">
								<div>
									<img src="${cp }/images/profile_evaluation.png" style="vertical-align: middle;">
									<p class="p5-no-partners-info-text" style="margin-top: 15px; margin-bottom: 0; color: #999 !important; line-height: 1;">
										등록된 <span class="text-center p5-bold" style="font-weight: 500;">'평가'</span>가 없습니다.
									</p>
								</div>
							</div>
					
				</div>
    			</c:if>
    			 <c:forEach items="${projectEvalList}" var="projectEval"> 
				 	<!-- check 값에 따라 색상이 달라진다.  -->
 					<c:choose> 				
 						<c:when test="${check == 'basic'}">
  							<div class="col-12  col-md-6 col-lg-4 my-3 note business-note all starred"  data-type="business-note">
  						</c:when>  				
  						<c:when test="${check == 'latest'}">
  							<div class="col-12  col-md-6 col-lg-4 my-3 note work-note all starred"  data-type="business-note">
  						</c:when>  
  						<c:when test="${check == 'highScore'}">   
  							<div class="col-12  col-md-6 col-lg-4 my-3 note private-note all starred"  data-type="business-note">
  						</c:when>	
  						<c:when test="${check == 'lowScore' }">
  							<div class="col-12  col-md-6 col-lg-4 my-3 note social-note all starred"  data-type="business-note">
  						</c:when>
  						<c:otherwise>	
  							<div class="col-12  col-md-6 col-lg-4 my-3 note work-note all starred"  data-type="business-note">
						</c:otherwise>                               
                    </c:choose>	                
                                    <div class="card">                            
                                        <div class="card-content">
                                            <div class="card-body p-4">
                                                <h6 class="mb-3 font-w-600">${projectEval.p_title }</h6>
                                                <p class="font-w-500 tx-s-12"><i class="icon-calendar"></i> <span class="note-date">프로젝트 기간 : ${projectEval.period }일 </span></p> 
                                                <p class="font-w-500 tx-s-12"><i class="fas fa-won-sign"></i> 
                                                <!-- 글자배경색상 강조함 (금액순 / 평점순) -->
                                                <span  
                                                <c:if test="${check == 'highMoney' }" >  style='background-color : #F4FA58'  </c:if>
                                                 class="note-date"> 프로젝트 금액 :  <fmt:formatNumber value="${projectEval.p_money}" />원</span></p> 
                                                <p class="font-w-500 tx-s-12"><i class="icon-star"></i> 
                                                <span  
                                                <c:if test="${check == 'lowScore' }" >  style='background-color : #FFFF00'  </c:if> 
                                                <c:if test="${check == 'highScore' }" >  style='background-color : #FF0080'  </c:if>
                                                class="note-date"> 별점 :  ${projectEval.average} 점</span></p> 
                                                <div class="note-content mb-4">${projectEval.e_cont}</div>
                                                <div class="d-flex notes-tool">
                                                    <span class="icon-star"> </span> 
                                                    <span class="icon-exclamation mx-2"></span>    
                                                    <span class="dot"></span> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    </c:forEach>
    				
    		
                
                
            
            
            <!-- 반복문 끝 -->
                </div>
            
            
            
	<c:if test="${EvalNullcheck eq null}">
			<!-- 페이징 처리 시작 -->					
					<ul class="pagination justify-content-center m-0">
						
						<li class="page-item">
						<c:choose>
							<c:when test="${page != 1 }">
								<a class="page-link" href="${cp}/evaluation/evalMainBoard?page=1&user_id=${user_id}&check=${check}">
								<i class="fas fa-angle-double-left"></i>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page-link"> 
								<i class="fas fa-angle-double-left"></i>
								</span>
							</c:otherwise>
						</c:choose>
						</li>
						
						
						<li class="page-item">
						<c:choose>
							<c:when test="${page != 1 }">
								<a class="page-link" href="${cp}/evaluation/evalMainBoard?page=${page - 1}&user_id=${user_id}&check=${check}">
								<i class="fas fa-angle-left">
								</i>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page-link"> 
								<i class="fas fa-angle-left">
								</i>
								</span>
							</c:otherwise>
						</c:choose>
						</li>
					
					
						<c:forEach begin="1" end="${pagination}"  var="i">
						<li class="page-item active"><a class="page-link"
							href="${cp}/evaluation/evalMainBoard?page=${i}&user_id=${user_id}&check=${check}">${i}</a></li>
					
						</c:forEach>
					
						<li class="page-item">
						<c:choose>
							<c:when test="${page == pagination }">
							 <span class="page-link">
							  <i class="fas fa-angle-right"></i>
							 </span>
							</c:when>
							<c:otherwise>
							<a class="page-link"
								href="${cp}/evaluation/evalMainBoard?page=${page + 1}&user_id=${user_id}&check=${check}"> <i
									class="fas fa-angle-right"></i>
							</a>
							</c:otherwise>
						</c:choose>
						
						</li>
						
						<li class="page-item">
						<c:choose>
							<c:when test="${page != pagination}">
								<a class="page-link"
									href="${cp}/evaluation/evalMainBoard?page=${pagination}&user_id=${user_id}&check=${check}">
									<i class="fas fa-angle-double-right"></i>
								</a>
							</c:when>
							<c:otherwise>
								 <span class="page-link">
								 	<i class="fas fa-angle-double-right"></i>
								 </span>
							</c:otherwise>	
						</c:choose>
						</li>
					</ul>
									
			<!-- 페이징 처리 끝 -->						
	</c:if>
								