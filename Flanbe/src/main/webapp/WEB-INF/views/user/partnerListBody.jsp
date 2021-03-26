<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	$(function(){
		<c:if test="${kW != null }">
			$("#kW").val("${kW}");
		</c:if>
		<c:if test="${sT != null }">
			$("#sT").val("${sT}").prop("selected", true);
		</c:if>
		<c:if test="${val == 'S'}">
// 			alert("S 체크");
			$("#checkS").prop('checked',true);
		</c:if>
		<c:if test="${val == 'T'}">
// 			alert("T 체크");
			$("#checkT").prop('checked',true);
		</c:if>
		var a = '${val}';
		var arr = a.split(",");
		for(var i in arr) {
			if(arr[i] == '01') {
				$("#checkJ").prop('checked',true);
			} else if(arr[i] == '02'){
				$("#checkC").prop('checked',true);
			} else if(arr[i] == '03') {
				$("#checkP").prop('checked',true);
			} else if(arr[i] == '04') {
				$("#checkJS").prop('checked',true);
			}
		}
		
		 $('input[type="checkbox"][name="filtercheck"]').change(function(){
			 if($(this).prop('checked')){
				 $('input[type="checkbox"][name="filtercheck"]').prop('checked',false);
				 $(this).prop('checked',true);
				 location.href="${cp}/user/filterPartner?value="+$(this).val();
			 } else {
				 location.href="${cp}/user/partnerList";
			 }
		 });
		 
		 $('#filterSearchBtn').on('click',function(){
			 cnt = $('input[type="checkbox"][name="value"]:checked').length
			 if(cnt == 0) {
				 swal({
						title: "Info",
						text: "선택된 값이 없습니다.",
						type: "info",
						showCancelButton: false,
						confirmButtonClass: 'btn-info',
						confirmButtonText: '확인',	
						closeOnConfirm: false
					});
				 setTimeout(function() {
					 location.href="${cp}/user/partnerList";
		        	}, 1000);
			 } else {
				 
			 	$('#filterSearchfrm').submit();
			 }
		 })
		 
	})

</script>

<div class="sidebar">
	<div class="site-width">
		<!-- START: Menu-->
		<ul id="side-menu" class="sidebar-menu">
			<li class="dropdown">
				<a href="#" style="text-align: center; font-size: 15px;">파트너스 상세조회</a>
				</li>
			
		</ul>
		<div class="card-body p-2" style="margin-left : 10px;">
			<a style="cursor: default;">
				<font size="3"><strong> 파트너 형태 </strong></font>
			</a><br><br>
            <div class="custom-control custom-checkbox custom-control-inline">                                        
                <input type="checkbox" class="custom-control-input" id="checkS" name="filtercheck" value="S">
            	<label class="custom-control-label" for="checkS"> 개인</label>
            </div><br>
			<div class="custom-control custom-checkbox custom-control-inline">                                        
			    <input type="checkbox" class="custom-control-input" id="checkT" name="filtercheck" value="T">
				<label class="custom-control-label" for="checkT"> 팀</label>
			</div><br>
			<hr>
			<form id="filterSearchfrm" action="${cp }/user/filterPartner" method="post">
				<a style="cursor: default;">
					<font size="3"><strong> 보유 기술 </strong></font>
					<span>
						<button class="btn" type="button" id="filterSearchBtn" data-card-widget="search">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
				</a><br><br>
				<div class="custom-control custom-checkbox custom-control-inline">                                        
				    <input type="checkbox" class="custom-control-input" id="checkJ" name="value" value="01">
					<label class="custom-control-label" for="checkJ"> 자바</label>
				</div><br>
				<div class="custom-control custom-checkbox custom-control-inline">                                        
				    <input type="checkbox" class="custom-control-input" id="checkC" name="value" value="02">
					<label class="custom-control-label" for="checkC"> C언어</label>
				</div><br>
				<div class="custom-control custom-checkbox custom-control-inline">                                        
				    <input type="checkbox" class="custom-control-input" id="checkP" name="value" value="03">
					<label class="custom-control-label" for="checkP"> 파이썬</label>
				</div><br>
				<div class="custom-control custom-checkbox custom-control-inline">                                        
				    <input type="checkbox" class="custom-control-input" id="checkJS" name="value" value="04">
					<label class="custom-control-label" for="checkJS"> 자바스크립트</label>
				</div>
			</form>
		</div>			
		<div class="eagle-divider"></div>
	</div>
</div>

<main>
	<div class="container-fluid site-width">
	         <!-- START: Breadcrumbs-->
	    <div class="row ">
	        <div class="col-12  align-self-center">
	            <div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
	                <div class="w-sm-100 mr-auto"><h4 class="mb-0">파트너스</h4></div>
	            </div>
	        </div>
	    </div>
	    <!-- END: Breadcrumbs-->
	
	    <!-- START: Card Data-->
	    <div class="row">
	        <div class="col-11 mt-3">
	            <div class="card">
	                <!-- <div class="card-header border-bottom p-1 d-flex"> -->
	                <div class="card-header justify-content-between align-items-center">
	                
	                	<div id="keyword" class="card-tools" style="width: 550px;">
							<form class="input-group row" action="${cp }/user/searchPartnerList" method="post"> &nbsp; &nbsp; &nbsp;
								<select class="form-control col-md-3" name="searchType" id="sT">
									<option value="">검색구분</option>
									<option value="id">아이디</option>
									<option value="tnm">팀명</option>
								</select>
								<input class="form-control" type="text" id="kW" name="keyword" placeholder="검색어를 입력하세요."> 
								<span class="input-group-append">
									<button class="btn btn-primary" type="submit" id="searchBtn" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</form>
						</div>
	                </div>
	                <div class="card-body">
	                    <div class="contacts grid">
	                    
	                    	<c:forEach items="${partnerList }" var="partner">
		                        <div class="contact family-contact"> 
		                            <div class="contact-content">
		                                <div class="contact-profile">
		                                	<div style="text-align: center;">                                                   
		                                    	<img src="${cp }/user/profileImg?user_id=${partner.user_id}" class="user-image img-fluid" style="width: 150px; height: 150px;">
		                                    </div>
		                                    <div class="contact-info">
		                                        <p class="contact-name mb-0">아이디</p>
		                                        <p class="contact-position mb-0 font-weight-bold text-muted">${partner.user_id}</p>
		                                    </div>
		                                </div>
		                                <div class="contact-email">
		                                    <p class="mb-0 small">그룹 이름</p>
		                                    <p class="user-email">${partner.group_nm}</p>
		                                </div>
		                                <div class="contact-email">
		                                    <p class="mb-0 small">Email</p>
		                                    <p class="user-email">${partner.email}</p>
		                                </div>
		                                <div class="contact-info">
		                                    <p class="mb-0 small">보유 기술</p>
		                                    <p class="user-info">
		                                    <c:choose>
		                                    	<c:when test="${partner.u_skills != null }">
		                                    		${partner.u_skills }
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    		등록된 기술이 없습니다.
		                                    	</c:otherwise>
		                                    </c:choose>
		                                    </p>
		                                </div>
		                                <div class="line-h-1 h5">
		                                    <a class="text-success edit-contact" href="${cp }/user/profile?user_id=${partner.user_id}"><i class="icon-user"></i></a>
		                                    <a class="text-danger delete-contact" href="#"><i class="icon-trash"></i></a>                                 
		                                </div>
		                            </div>
		                        </div>
	                        </c:forEach>
	                    </div>
	                    
	                    <c:if test="${pageVo != null }">
							<nav>
								<ul class="pagination justify-content-center m-0">
									<li class="page-item">
										<c:choose>
											<c:when test="${pageVo.page == 1 }">
												<span class="page-link">
													<i class="fas fa-angle-double-left"></i>
												</span>
											</c:when>
											<c:otherwise>
												<%-- <a class="page-link" href="${cp }/user/partnerList?page=1"> --%>
												<a class="page-link" href="${cp }/user/filterPartner?value=${val }&page=1">
													<i class="fas fa-angle-double-left"></i>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<li class="page-item">
										<c:choose>
											<c:when test="${pageVo.page > 1 }">
												<%-- <a class="page-link" href="${cp }/user/partnerList?page=${pageVo.page -1}"> --%>
												<a class="page-link" href="${cp }/user/filterPartner?value=${val }&page=${pageVo.page -1}">
													<i class="fas fa-angle-left"></i>
												</a>
											</c:when>
											<c:otherwise>
												<span class="page-link">
													<i class="fas fa-angle-left"></i>
												</span>
											</c:otherwise>
										</c:choose>
									</li>
									<c:forEach begin="1" end="${pagination }" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="page-item active">
													<%-- <a class="page-link" href="${cp }/user/partnerList?page=${i}">${i }</a> --%>
													<a class="page-link" href="${cp }/user/filterPartner?value=${val }&page=${i}">${i }</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="page-item">
													<%-- <a class="page-link" href="${cp }/user/partnerList?page=${i}">${i }</a> --%>
													<a class="page-link" href="${cp }/user/filterPartner?value=${val }&page=${i}">${i }</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li class="page-item">
										<c:choose>
											<c:when test="${pageVo.page < pagination }">
												<%-- <a class="page-link" href="${cp }/user/partnerList?page=${pageVo.page +1}"> --%>
												<a class="page-link" href="${cp }/user/filterPartner?value=${val }&page=${pageVo.page +1}">
													<i class="fas fa-angle-right"></i>
												</a>
											</c:when>
											<c:otherwise>
												<span class="page-link">
													<i class="fas fa-angle-right"></i>
												</span>
											</c:otherwise>
										</c:choose>
									</li>
									<li class="page-item">
										<c:choose>
											<c:when test="${pageVo.page == pagination }">
												<span class="page-link">
													<i class="fas fa-angle-double-right"></i>
												</span>
											</c:when>
											<c:otherwise>
												<%-- <a class="page-link" href="${cp }/user/partnerList?page=${pagination}"> --%>
												<a class="page-link" href="${cp}/user/filterPartner?value=${val }&page=${pagination}">
													<i class="fas fa-angle-double-right"></i>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
								</ul>
							</nav>
						</c:if>
	                </div>
				</div>
	        </div>
	    </div>
	</div>
</main>