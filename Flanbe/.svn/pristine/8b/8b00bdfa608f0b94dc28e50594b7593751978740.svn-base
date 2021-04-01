<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

<script>
	$(function() {
		$('#okbtn').on('click', function() {
			$('#ynfrm').attr("action", "${cp}/manage/approvalProject");
			$("#ynfrm").submit();
		})
		$('#nobtn').on('click', function() {
			$('#ynfrm').attr("action", "${cp}/manage/refusalProject");
			$("#ynfrm").submit();
		})
	})

</script>

<form id="ynfrm" method="post">
	<input type="hidden" id="p_code" name="p_code" value="${project.p_code }" >
</form>
<div class="sidebar">
    <div class="site-width">
        <!-- START: Menu-->
        <ul id="side-menu" class="sidebar-menu">
           <li>
           		<a href="#" style="text-align:center; font-size: 15px;">회원관리</a>                  
                <ul>
                    <li><a href="${cp }/manage/userList"><i class="mdi h5 mr-2 mdi-account-outline"></i> 클라이언트 </a></li>
                    <li><a href="${cp }/manage/userList?div=P"><i class="mdi h5 mr-2 mdi-account"></i> 파트너스 </a></li>
           	    </ul>
           </li>
           <li>
           		<a href="#" style="text-align:center; font-size: 15px;">프로젝트 관리</a>
           		<ul>
                    <li><a href="${cp }/manage/requestProjectList"><i class="fas  h5 mr-2 fa-clipboard-check"></i>프로젝트 관리</a></li>
           	    </ul>                
           </li>
           <li>
           		<a href="#" style="text-align:center; font-size: 15px;">계약 관리</a>
           		<ul>
                    <li><a href="${cp }/manage/requestContractList"><i class="mdi h5 mr-2 mdi-clipboard-text-outline"></i>계약 관리</a></li>
           	    </ul>                  
           </li>
		</ul>
    </div>
</div>



<!-- START: Main Content-->
<main>
	<div class="container-fluid site-width">
		<div class="row ">
			<div class="col-12  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">

				</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col-12 col-sm-12">
				<div class="row">
					<div class="col-11 col-xl-8 mb-10 mb-xl-10">
						<div class="card">
							<div class="card-content">
								<div class="card-body" style="margin-left: 5px;">
									<div class="row">
										<div class="col-12">
											<c:choose>
												<c:when test="${project.p_state == '03' }">
													<span class="badge outline-badge-success" style="margin-left: 20px; color:black">모집중</span>
                                   				</c:when>
                                   				<c:when test="${project.p_state == '06' }">
                                    				<span class="badge outline-badge-warning my-auto" style="margin-left: 20px; color:black" >진행중</span>
                                    			</c:when>
                                    			<c:when test="${project.p_state == '09' }">
                                    				<span class="badge outline-badge-danger my-auto" style="margin-left: 20px; color:black">완료</span>
                                    			</c:when>
                                 			</c:choose>
                                 			<span class="text-primary font-weight-bold " style="margin-left: 20px; font-size: 30px;">${project.p_title }</span>                                 
                                    		<hr>
                              				<div class="row">
                              					<div class="col-xl-4">
                                       				<div class="card">
                                           				<div class="card-body text-info border-bottom border-info border-w-5">
	                                               			<h5 class="text-center"><i class="icon-calendar"></i> 예상기간</h5>
	                                               			<h4 class="text-center">${project.period }일</h4>       
                                           				</div>
                                       				</div>
                                   				</div>
                              					<div class="col-xl-4">
                                       				<div class="card">
                                           				<div class="card-body text-success border-bottom border-success border-w-5">
                                               				<h5 class="text-center"><i class="ion-social-usd"></i> 금액</h5>
                                               				<h4 class="text-center"><fmt:formatNumber value="${project.p_money }"/>원</h4>       
                                           				</div>
                                       				</div>
                                   				</div>
                                   			</div><br><br>
                                   			<div class="form-group row" style="margin-left: 4px;">
                                 				<p style="font-size: 17px;"><i class="ion-android-settings"></i>&nbsp;&nbsp;&nbsp;&nbsp;관련기술</p>
                                 				<div class="col-sm-4" style="margin-left: 67px;">
                                 					<c:forEach items="${pskill}" var="pskill">
	                                 					<c:choose>
	                                    					<c:when test="${pskill.ps_no eq '01' }">
	                                       						<a class="badge outline-badge-info">자바</a>&nbsp;
	                                    					</c:when>
	                                    					<c:when test="${pskill.ps_no eq '02' }">
	                                       						<a class="badge outline-badge-info">C</a>&nbsp;
	                                    					</c:when>
	                                    					<c:when test="${pskill.ps_no eq '03' }">
	                                       						<a class="badge outline-badge-info">파이썬</a>&nbsp;
	                                    					</c:when>
	                                    					<c:when test="${pskill.ps_no eq '04' }">
	                                       						<a class="badge outline-badge-info">자바스크립트</a>&nbsp;
	                                    					</c:when>
	                                    					<c:when test="${pskill.ps_no eq '05' }">
	                                       						<a class="badge outline-badge-info">기타</a>
	                                    					</c:when>
	                                 					</c:choose>
	                                 				</c:forEach>
	                                            </div>
                                 			</div>   
                                    		<div class="form-group row" style="margin-left: 2px;">
                                    			<p style="font-size: 17px;"><i class="mdi h5 mr-2 mdi-alarm"></i>&nbsp;모집마감일</p>
                                       			<div class="col-sm-4" style="margin-left: 50px;">
                                    				<span class="h6 font-w-600"><fmt:formatDate value="${project.deadline }" pattern="yyyy.MM.dd" /></span>
                                       			</div>
                                    		</div>
                                    
                                    		<div class="form-group row" style="margin-left: 2px;">
                                    			<p style="font-size: 17px;"><i class="mdi h5 mr-2 mdi-calendar"></i>&nbsp;예상시작일</p>
                                       			<div class="col-sm-4" style="margin-left: 50px;">
                                    				<span class="h6 font-w-600"><fmt:formatDate value="${project.p_sdt }" pattern="yyyy.MM.dd" /></span>
                                       			</div>
                                    		</div>
                                    
                                    		<div class="form-group row" style="margin-left: 2px;">
                                    			<p style="margin-right: 19px; font-size: 17px;"><i class="mdi h5 mr-2 mdi-calendar-check"></i>&nbsp;등록일자</p>
                                       			<div class="col-sm-4" style="margin-left: 49px;">
                                    				<span class="h6 font-w-600"><fmt:formatDate value="${project.p_regdt }" pattern="yyyy.MM.dd" /></span>
                                       			</div>
                                    		</div>
                                    		<hr>
                                 			<span class="h4 font-w-600">업무 내용</span><br><br>
                                 			<div class="col-12" style="min-height: 350px;">
                                    			<div class="form-group">${project.p_cont}</div>
                                 			</div>
                              			</div>
                              		</div>
                              		<button id="okbtn" type="button" class="btn btn-primary">승인</button>
                              		<button id="nobtn" type="button" class="btn btn-primary">거부</button>
                              	</div>
                            </div>
                        </div>
               		</div>
					
					<div class="col-xl-3">
						<div class="card mb-3">
							<div class="card-header">                               
								<h4 class="card-title">클라이언트 정보</h4>                                
							</div>
                            <div class="card-body">
                            	<div class="media d-block d-sm-flex text-center text-sm-left mb-4">
                                	<div class="media-body align-self-center redial-line-height-1_5">
                                    	<h6 class="my-2 my-sm-0 redial-line-height-1_5 mb-xl-2">사용자아이디</h6>
                                                ${project.user_id }
                                    </div>
								</div>
                                <div class="media d-block d-sm-flex text-center text-sm-left mb-4">
                                	<div class="media-body align-self-center redial-line-height-1_5">
                                    	<h6 class="my-2 my-sm-0 redial-line-height-1_5 mb-xl-2">자기소개</h6>
                                               ${project.intro }
                                    </div>
								</div>
							</div>
						</div>

                        <div class="card">
                        	<div class="card-header">                               
                            	<h4 class="card-title">개발분야</h4>                                
                            </div>
                           	<div class="card-body">
                            	<c:choose>
                            		<c:when test="${project.p_field == '01' }">
                            			<a class="redial-light border redial-border-light px-2 py-1 mb-2 d-inline-block redial-line-height-1_5 mr-2">웹</a>
                            		</c:when>
                            		<c:when test="${project.p_field == '02' }">
                            			<a class="redial-light border redial-border-light px-2 py-1 mb-2 d-inline-block redial-line-height-1_5 mr-2">애플리케이션</a>
                            		</c:when>
                            		<c:when test="${project.p_field == '03' }">
                            			<a class="redial-light border redial-border-light px-2 py-1 mb-2 d-inline-block redial-line-height-1_5 mr-2">퍼블리싱</a>
                            		</c:when>
                            		<c:when test="${project.p_field == '04' }">
                            			<a class="redial-light border redial-border-light px-2 py-1 mb-2 d-inline-block redial-line-height-1_5 mr-2">게임</a>
                            		</c:when>
                            		<c:when test="${project.p_field == '05' }">
                            			<a class="redial-light border redial-border-light px-2 py-1 mb-2 d-inline-block redial-line-height-1_5 mr-2">기타</a>
                            		</c:when>
                            	</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>