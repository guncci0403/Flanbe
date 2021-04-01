<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>
<style>
	#messageModalBtn {
 		border: none;
 		background: white; 
	}
</style>
<script>
      //문서 로딩이 완료되고 나서 실행되는 영역
      $(function(){
            <c:if test="${msg != null }">
	    		swal({
	    			title: "Info",
	    			text: "${msg}",
	    			type: "info",
	    			showCancelButton: false,
	    			confirmButtonClass: 'btn-info',
	    			confirmButtonText: '확인',	
	    			closeOnConfirm: false
	    		});
            </c:if>
         $('#summernote').summernote({
            height:250,width:1100,
             popover: {
                 image:[],
                 link:[],
                 air:[]
              },
            toolbar: [
                 ['style', ['style']],
                 ['font', ['bold', 'underline', 'clear']],
                 
                 ['fontname', ['fontname']],
                 ['color', ['color']],
                 ['para', ['ul', 'ol', 'paragraph']],
                 ['table', ['table']],
                 ['view', ['fullscreen', 'codeview']],
               ]
         });
       $('#summernote').summernote('disable');
      });
   
      $(function() {  //관심 등록, 삭제
           $("#insertlike").on("click", function(){
             $("#Pattform").attr("method", "post");
             $("#Pattform").attr("action", "${cp}/project/insertLike");
             $("#Pattform").submit();
           });
          
           $("#deletelike").on("click", function(){
             $("#Pattform").attr("method", "post");
             $("#Pattform").attr("action", "${cp}/project/deleteLike");
             $("#Pattform").submit();
           });
       
           $("#insertapplybtn").on("click", function(){
             $("#Pattform").attr("method", "post");
             $("#Pattform").attr("action", "${cp}/project/insertApply");
             $("#Pattform").submit();
           });
           
           $("#updateapplybtn").on("click", function(){
             $("#Pattform").attr("method", "post");
             $("#Pattform").attr("action", "${cp}/project/updateApply");
             $("#Pattform").submit();
           });
           
           $('#messageSendBtn').on('click', function() {
   			
   			var r_id = $("#r_id").val();
   			var m_cont = $("#m_cont").val();
   			
   			$.ajax({
   				url : "${cp}/message/messageSend",
   				data : {
   					"r_id" : r_id,
   					"m_cont" : m_cont
   				},
   				type : 'post',
   				success : function(data){
   					if(data.cnt == 1) {
   						swal({
   							title: "Success!!",
   							text: "쪽지를 보냈습니다.",
   							type: "success",
   							showCancelButton: false,
   							/* cancelButtonClass: 'btn-danger', */
   							confirmButtonClass: 'btn-success',
   							confirmButtonText: '확인'
   						});
   					} else {
   						swal({
   							title: "Error",
   							text: "쪽지 전송에 실패했습니다.",
   							type: "error",
   							showCancelButton: false,
   							/* cancelButtonClass: 'btn-danger', */
   							confirmButtonClass: 'btn-primary',
   							confirmButtonText: '확인'
   						});
   					}
   					$('#mailModal').modal('hide');
   				},
   				error : function(xhr) {
   					swal({
   						title: "Error",
   						text: "상태 :" + xhr.status,
   						type: "error",
   						showCancelButton: false,
   						/* cancelButtonClass: 'btn-danger', */
   						confirmButtonClass: 'btn-danger',
   						confirmButtonText: '확인'
   					});
   				}
   			});
   		});
       })
       
</script>

<script>
    function sendSMS(pageName){

       console.log("문자를 전송합니다.");
       $("#smsForm").attr("action", "${cp}/project/send");
       $("#smsForm").submit();
    }
  </script>


<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<div class="col-3  align-self-center">
			<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
				<div class="w-sm-100 mr-auto">
					<%--                   <h4  class="text-center">프로젝트 명 : ${project.p_title }</h4> --%>
				</div>
			</div>
		</div>

		<br>
		<div class="row">
			<br><br><br><br><br><br><br><br>
			<div class="col-11 col-sm-11" style="padding-left: 120px;">
				<div class="row">
					<div class="col-11 col-xl-8 mb-10 mb-xl-10">
						<div class="card">
							<div class="card-content">
								<div class="card-body" style="margin-left: 5px;">
									<div class="row">
										<div class="col-12">
											<form>
												<c:choose>
													<c:when test="${project.p_state == '03' }">
														<span class="badge outline-badge-success" style="margin-left: 20px; color: black">모집중</span>
													</c:when>
													<c:when test="${project.p_state == '06' }">
														<span class="badge outline-badge-warning my-auto" style="margin-left: 20px; color: black">진행중</span>
													</c:when>
													<c:when test="${project.p_state == '09' }">
														<span class="badge outline-badge-danger my-auto" style="margin-left: 20px; color: black">완료</span>
													</c:when>
												</c:choose>
												<p>
													<span class="text-primary font-weight-bold " style="margin-left: 20px; font-size: 30px;">${project.p_title }</span>
													<!--                                     </h2> -->
												<hr>
												<div class="row">

													<div class="col-xl-4">
														<div class="card">
															<div class="card-body text-info border-bottom border-info border-w-5">
																<h5 class="text-center">
																	<i class="icon-calendar"></i> 예상기간
																</h5>
																<h4 class="text-center">${project.period }일</h4>
															</div>
														</div>
													</div>
													<div class="col-xl-4">
														<div class="card">
															<div class="card-body text-success border-bottom border-success border-w-5">
																<h5 class="text-center">
																	<i class="ion-social-usd"></i> 금액
																</h5>
																<h4 class="text-center">
																	<fmt:formatNumber value="${project.p_money }" />
																	원
																</h4>
															</div>
														</div>
													</div>
													<c:if test="${project.p_state != '06' && project.p_state != '07' && project.p_state != '09'}">
														<div class="col-xl-4">
															<div class="card">
																<div class="card-body text-danger border-bottom border-danger border-w-5">
																	<h5 class="text-center">
																		<i class="ion-person"></i> 지원자 수
																	</h5>
																	<h4 class="text-center">${applicant}명</h4>
																</div>
															</div>
														</div>
													</c:if>
												</div>
												<br>
												<br>
												<div class="form-group row" style="margin-left: 4px;">
													<p style="font-size: 17px;">
														<i class="ion-android-settings"></i>&nbsp;&nbsp;&nbsp;&nbsp;관련기술
													</p>
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
													<p style="font-size: 17px;">
														<i class="mdi h5 mr-2 mdi-alarm"></i>&nbsp;모집마감일
													</p>
													<div class="col-sm-4" style="margin-left: 50px;">
														<span class="h6 font-w-600"><fmt:formatDate value="${project.deadline }" pattern="yyyy.MM.dd" /></span>
													</div>
												</div>

												<div class="form-group row" style="margin-left: 2px;">
													<p style="font-size: 17px;">
														<i class="mdi h5 mr-2 mdi-calendar"></i>&nbsp;예상시작일
													</p>
													<div class="col-sm-4" style="margin-left: 50px;">
														<span class="h6 font-w-600"><fmt:formatDate value="${project.p_sdt }" pattern="yyyy.MM.dd" /></span>
													</div>
												</div>

												<div class="form-group row" style="margin-left: 2px;">
													<p style="margin-right: 19px; font-size: 17px;">
														<i class="mdi h5 mr-2 mdi-calendar-check"></i>&nbsp;등록일자
													</p>
													<div class="col-sm-4" style="margin-left: 49px;">
														<span class="h6 font-w-600"><fmt:formatDate value="${project.p_regdt }" pattern="yyyy.MM.dd" /></span>
													</div>
												</div>

												<hr>
											</form>
											<span class="h4 font-w-600">업무 내용</span><br>
											<br>
											<div class="col-12" style="min-height: 350px;">
												<div class="form-group">${project.p_cont}</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-xl-3">
						<c:if test="${S_USER.purpose == 'P'}">
							<div class="card mb-3">
								<form id="Pattform" role="form">
									<div class="card-header d-flex justify-content-between align-items-center">
										<h4 class="card-title">관심프로젝트 및 지원하기</h4>
									</div>
									<div class="card-body">
										<div class="card-content">
											<div class="col-12">
												<input type="hidden" name="p_code" value="${project.p_code }"> <input type="hidden" name="user_id" value="${S_USER.user_id }">
												<c:choose>
													<c:when test="${pstate == null }">
														<button id="insertlike" type="button" class="btn btn-primary btn-md">관심등록하기</button>
														<button id="insertapplybtn" type="button" class="btn btn-primary btn-md">지원하기</button>
													</c:when>
													<c:when test="${pstate == '01' }">
														<button id="deletelike" type="button" class="btn btn-primary btn-md">관심삭제하기</button>
														<button id="updateapplybtn" type="button" class="btn btn-primary btn-md">지원하기</button>
													</c:when>
													<c:when test="${pstate == '02' }">
														<button id="updateapplybtn" type="button" class="btn btn-primary btn-md">지원하기</button>
													</c:when>
													<c:when test="${pstate == '03' || pstate == '07' || pstate == '08'}">
														<label class="btn btn-primary btn-md">지원한 프로젝트</label>
													</c:when>
													<c:when test="${pstate == '04' }">
														<label class="btn btn-primary btn-md">참여중인 프로젝트</label>
													</c:when>
													<c:when test="${pstate == '05' }">
														<label class="btn btn-primary btn-md">종료된 프로젝트</label>
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
								</form>
							</div>
						</c:if>
						<div class="card mb-2">
							<div class="card-header d-flex justify-content-between align-items-center">
								<h4 class="card-title">사용자 정보</h4>
								<c:if test="${project.user_id != S_USER.user_id }">
									<button type="button" id="messageModalBtn" data-toggle="modal" data-target="#mailModal"><img src="${cp }/images/message.png" alt="" width="17"></button>
								</c:if>
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

						<div class="card mb-3">
							<div class="card-header d-flex justify-content-between align-items-center">
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

<!-- 쪽지 보내는 modal -->
<div class="modal fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><i class="icon-pencil"></i> 쪽지 쓰기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="icon-close"></i>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<input type="text" id="r_id" class="form-control" placeholder="To." name="r_id" value="${project.user_id }" readonly />
				</div>

				<textarea id="m_cont" name="m_cont" style="width: 465px; height: 300px; resize: none;"></textarea>
			</div>
			<div class="modal-footer">
				<button id="messageSendBtn" type="button" class="btn btn-primary send-email">전송</button>
			</div>
		</div>
	</div>
</div>