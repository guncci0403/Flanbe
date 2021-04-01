
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script>
$(function(){
  //대표 포트폴리오 
  var maxCount = 3;								//최대값은 3
  var count = $("#chk_id:checked").length;   	//체크된 값의 길이
	
  $('.chk_id').on('click',function() {
		count = $("#chk_id:checked").length;   	//체크된 값의 길이
	  if(count > maxCount) {
		 swal({
				title: "Info",
				text: "최대 3개까지만 선택가능합니다!",
				type: "info",
				showCancelButton: false,
				confirmButtonClass: 'btn-info',
				confirmButtonText: '확인',	
				closeOnConfirm: false
			});
		 $(this).prop('checked', false);
		 $(":checkbox:not(:checked)").attr("disabled", true); 		// 다른 체크박스들을 disable 처리
	   } else {
		  $(":checkbox:not(:checked)").attr("disabled", false); 	// 다른 체크박스들을 disable 처리
		  count ++;
		}
	});
  
  //분야 필터(적용하기 버튼 클릭 시, 실행)
  $('#filterfrmBtn').on('click', function(){
	  var check_field = ""; 
 	  var userid = '${user.user_id}';
      $("input[name='po_field']:checked").each(function(i) {
    	  if(i != 0){
    		  check_field += ",";
    	  }
    	  check_field += $(this).val();
      }); 
	
      $.ajax({
			url: '${cp}/user/fieldFilter',
			type: 'post',
			data: {"userid": userid, "checkfield": check_field},
			dataType: 'json',
			success: function(data){
				 var code = "";

				 $.each(data.fieldfilter, function(i, popol){
					var field = popol.po_field;
					var split_field = field.split(",");
					var po_field = [];
					
					for(var i in split_field) { 
						if(split_field[i] == '01') {
							po_field[i] = "웹";
						}if(split_field[i] == '02'){
							po_field[i] = "애플리케이션";
						}if(split_field[i] == '03'){
							po_field[i] = "퍼블리싱";
						}if(split_field[i] == '04'){
							po_field[i] = "게임";
						}if(split_field[i] == '05'){
							po_field[i] = "기타";						
					   }
					}

					 code += '<div class="portfolio-thumbnail" style="margin-top:0;">';
					 code += '<a href="/user/detailpopol?po_no='+popol.po_no+'">';
					 code += '<img class="portfolio-thumbnail-image" src="/user/popolimg?po_no='+popol.po_no+'">';
					 code += '</a>';
					 code += '<div class="portfolio-thumbnail-caption-top">';
					 code += '<a class="popol_title">'+popol.po_title+'</a>';
					 code += '<p class="popol_field_skil">';
					 code += '개발&nbsp;|&nbsp;<span class="category-field-splitter">'+po_field+'</span></p>';
					 code += '	</div>';
				     code += '</div>';
				 });
				
				 $("#popolN").html(code);
				 $("#fieldfilterModal").modal('hide');
/*  			alert(data.po_no);
				console.log(data.fieldfilter); */
		 	}
		 }); 
  	 });
});
</script>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<!-- START: Main Content-->
<main>
	<div class="content">
		<div class="profile_frame">
			<div class="col-11 mt-4 pl-lg-0">
				<div class="card border  h-mail-list-section">
					<section>
						<h4 class="p5-profile-head">${user.user_id}의 포트폴리오
						 	 <c:if test="${user.user_id == S_USER.user_id }"> 
						 	 
						 	 <a href="${cp }/user/registpopolView"><button type="button" class="btn btn-success" style="float:right; font-size: revert;">
						 	 등록</button></a>
						 	 </c:if>
						</h4>
					</section>
					
					<!-- 대표 포트폴리오(po_repre=Y) 출력 -->
					<section class="p5-partition">
						<div class="p5-2spanInfo">
							<div>
								<h6 class="p5-content-title">대표 포트폴리오
									<c:if test="${user.user_id == S_USER.user_id }">
										<button type="button" class="btn btn-primary" style="float:right; font-size: revert;"
										    	data-toggle="modal" data-target="#portfolioModal">대표 포트폴리오 수정</button>
									</c:if>
								</h6>
								<c:choose>
									<c:when test="${reprePopolVo[0] == null}">
										<br><br><br><br><br>
										<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
											<div style="display: table-cell; vertical-align: middle;">
												<div style="font-size: 14px;">
													<img src="${cp }/images/project_history_no.png" style="vertical-align: middle;">
													<p class="p5-no-partners-info-text" style="margin-top: 15px; margin-bottom: 0; color: #999 !important; line-height: 1;">
														<span class="text-center p5-bold" style="font-weight: bold;">'대표 포트폴리오'</span>를 등록해주세요.
													</p>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="p5-description-hasvalue">						
											<c:forEach items="${popolVo}" var="popolVo" varStatus="status" >
												<c:if test="${popolVo.po_repre eq 'Y'}">
													<div class="portfolio-thumbnail"style="margin-top: 0;" >
														<a href="${cp }/user/detailpopol?po_no=${popolVo.po_no}"> 
															<img class="portfolio-thumbnail-image" src="${cp }/user/popolimg?po_no=${popolVo.po_no}">
														</a>
													
														<div class="portfolio-thumbnail-caption-top">
														<span class="badge badge-pill badge-warning p-1 mb-1"><strong>대표작품</strong></span>
														<br>
															<a class="popol_title">${popolVo.po_title} </a> 
															<p class="popol_field_skil">
																개발&nbsp;|&nbsp;<span class="category-field-splitter"></span>
																<c:set var="poopl_field" value="${popolVo.po_field}" />
																<c:forEach items="${poopl_field }" var="poopl_field">
																	<c:if test="${poopl_field eq '01'}"> 웹 </c:if>
																	<c:if test="${poopl_field eq '02'}"> 애플리케이션 </c:if>
																	<c:if test="${poopl_field eq '03'}"> 퍼블리싱 </c:if>
																	<c:if test="${poopl_field eq '04'}"> 게임 </c:if>
																	<c:if test="${poopl_field eq '05'}"> 기타 </c:if>
																</c:forEach>
															</p>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</section>
					
					<!-- 일반 포트폴리오(po_repre=N) 출력 -->
					<section class="p5-partition" style="margin-bottom: 50px;">
						<div class="p5-2spanInfo" style="border-bottom:0px;">
							<div>
								<h6 class="p5-content-title">
									포트폴리오
									<button type="button" class="btn btn-outline-info" style="float: right; font-size: revert;"
										    data-toggle="modal" data-target="#fieldfilterModal">분야 필터</button>
								</h6>
								<c:choose>
									<c:when test="${popolVo[0] == null}">
										<br><br><br><br><br>
										<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
											<div style="display: table-cell; vertical-align: middle;">
												<div style="font-size: 14px;">
													<img src="${cp }/images/project_history_no.png" style="vertical-align: middle;">
													<p class="p5-no-partners-info-text" style="margin-top: 15px; margin-bottom: 0; color: #999 !important; line-height: 1;">
														등록된 <span class="text-center p5-bold" style="font-weight: bold;">'포트폴리오'</span>가 없습니다.
													</p>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="p5-description-hasvalue" id="popolN">
											<c:forEach items="${popolVo}" var="popolVo">
												<c:if test="${popolVo.po_repre eq 'N'}">
													<div class="portfolio-thumbnail" >
														<a href="${cp }/user/detailpopol?po_no=${popolVo.po_no}"> 
														<img class="portfolio-thumbnail-image" src="${cp }/user/popolimg?po_no=${popolVo.po_no}">
														</a>
														<div class="portfolio-thumbnail-caption-top">
															<a class="popol_title">${popolVo.po_title}${status.count }</a>
															
															<p class="popol_field_skil">
																개발&nbsp;|&nbsp;<span class="category-field-splitter"></span>
															<c:set var="poopl_field" value="${popolVo.po_field}" />
																<c:forEach items="${poopl_field }" var="poopl_field">
																	<c:if test="${poopl_field eq '01'}"> 웹 </c:if>
																	<c:if test="${poopl_field eq '02'}"> 애플리케이션 </c:if>
																	<c:if test="${poopl_field eq '03'}"> 퍼블리싱 </c:if>
																	<c:if test="${poopl_field eq '04'}"> 게임 </c:if>
																	<c:if test="${poopl_field eq '05'}"> 기타 </c:if>
																</c:forEach>
															</p>	
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- 대표 포트폴리오 수정 모달창 -->
<div class="modal fade" id="portfolioModal" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal"
	 style="display: none;" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h6 class="modal-title" id="exampleModalLabel">대표 포트폴리오 선택</h6><br>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			
		<form id="repersentfrm" action="${cp }/user/representpopol" method="POST" >
		<input type="hidden" value="${user.user_id}" name="user_id"/>
		 <div class="modal-body">
			<p id="rep_modal_title" style="text-align:center; font-weight:normal;">등록한 포트폴리오 중에서 대표를 선정해 주세요<br> <span class="p5-bold">
			<strong>대표 포트폴리오는 최대 3개까지 선택할 수 있습니다.</strong></span></p>
				<hr>
				<c:forEach items="${popolVo}" var="popolVo">
				<label style="margin-bottom:0; cursor:pointer">
					<input type="checkbox" class="chk_id" id="chk_id" name="po_no"  
						   value="${popolVo.po_no}" <c:if test="${popolVo.po_repre == 'Y'}">checked</c:if> /> &nbsp;&nbsp;${popolVo.po_title} 
					</label>
				<hr>
				</c:forEach>
		  </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button id="updateBtn" type="submit" class="btn btn-primary">수정 완료</button>
			</div>
		</form>		
		</div>
	</div>
</div>

<!-- 분야 필터 모달창 -->
<div class="modal fade" id="fieldfilterModal" tabindex="-1" role="dialog" aria-labelledby="#fieldfilterModal"
	 style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header"> 
				<h6 class="modal-title" id="exampleModalLabel">분야 필터</h6><br>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div> 			
		<form class="fieldfilterfrm">
		  <div class="modal-body">
			 <br>		
			 <label style="margin-bottom:0; cursor:pointer"><input type="checkbox" class="field_id" name="po_field" value="01"/> &nbsp;&nbsp;웹</label><hr>
			 <label style="margin-bottom:0; cursor:pointer"><input type="checkbox" class="field_id" name="po_field" value="02" /> &nbsp;&nbsp;애플리케이션</label><hr>
			 <label style="margin-bottom:0; cursor:pointer"><input type="checkbox" class="field_id" name="po_field" value="03" /> &nbsp;&nbsp;퍼블리싱</label><hr>
			 <label style="margin-bottom:0; cursor:pointer"><input type="checkbox" class="field_id" name="po_field" value="04" /> &nbsp;&nbsp;게임</label><hr>
			 <label style="margin-bottom:0; cursor:pointer"><input type="checkbox" class="field_id" name="po_field" value="05" /> &nbsp;&nbsp;기타</label>			
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			<button id="filterfrmBtn" type="button" class="btn btn-primary">적용하기</button>
		  </div>
		</form>			
		</div>
	</div>
</div>