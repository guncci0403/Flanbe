<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style type="text/css">

/*     i { */
/*     	width : 300px; */
/*     	height : 300px; */
/*     } */
/* #content { */
/* 	border: 1px solid black; */
/* 	width: 100%; */
/* } */

#firstDiv {
	float: left;
	width: 83%
}

#secondDiv {
	float: left;
	width: 16%
}

.site-footer {
	clear: both;
}

#sameHeight {
	display: flex;
}

#replyView {
	margin-left: 20px;
}

body {
	/*     	min-width : 2000px; */
	
}

/* size {
    	min-height : 1000px;
    } */
#title:hover {
	color: blue;
}

.labelCont {
	font-size: 16px;
}

#upperWork {
	background-color: #FBF301;
}

#replyWrite {
	width: 100%
}

.deleteIcon {
	height: auto;
	width: auto;
}

.updateIcon {
	height: auto;
	width: auto;
}

#replyBtnTd {
	padding-top: 170px;
	float: left;
}

#replyIcon {
	width: 10px;
	height: 10px;
}

.trashIcon {
	width: auto;
	height: auto;
}

#titlereplyReply {
	background-color: #FBF301;
	color: gray;
}

#GroupReplyInsertBtn {
	float: bottom;
}

.replyParentId {
	background-color: #A9D0F5;
}

.replyReply {
	background-color: #f4f4f4;
}

.changePink {
	background-color: #F6CEE3 !important;
}
.form-control{
	border: none;
}
.lab{
	line-height: 1.8;
	font-weight: bold;
}
.labelCont{
	margin-left: 1%;
}
</style>


<script type="text/javascript">
		$(document).ready(function(){
			
			
			$('#summernote').summernote({
		            height: 250,
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
			
			
			
			//뒤페이지 리스트로 가기
	
			
			$('#cancel').on('click' , function(){
				location.href="${cp}/note/viewMain?p_code=${noteVo.p_code }"
				
			})
			
			//답글 달기 (최상위 : 여기페이지에 있는 글의 최상위 코드 , 부모코드 : 여기 있는 코드)
			$('#insertNoteReply').on('click' , function(){
	
				$('#insertForm').submit();			
			})
			
			
			//글 수정하기 
			
			$('#update').on('click' , function(){
				var n_no = $('#n_parent').val();
				location.href="${cp}/note/viewUpdate?n_no=" + n_no;
			})
			
			
			// 상위 댓글 찾기 (댓글을 클릭하면 부모댓글의 색깔이 깜빡하고 변했다가 다시 돌아오게 할 것임)

			$('.ajaxReplyBlock').on('mouseover' , '.eachReplyTr'  , function(){
				var r_parent = $(this).data('pno');
				if(r_parent == 0 ){
					return false;
				}
				//현재 댓글 번호 가지고 오기 
				var r_no = $(this).data('rnumber');
				
				
				$('#replyBody').children('#' + r_parent ).addClass('changePink');
				
				
					
			})
			
			$('.ajaxReplyBlock').on('mouseleave' , '.eachReplyTr'  , function(){
				
				var r_parent = $(this).data('pno');
				if(r_parent == 0 ){
					return false;
				}
				var r_no = $(this).data('rnumber');
				$('#replyBody').children('#' + r_parent ).removeClass('changePink');	
				
			})
			/*댓글 등록하기 */
			
			
			// 최상위 부모 댓글 등록하기 
			
			$('#GroupReplyInsertBtn').on('click' , function(){
				
				//최상위 부모 댓글 등록
				//현재 글번호 
				var form = {
					n_no : $('#n_no').val(),
				//작성자
					user_id : $('#user_id').val(),
				//내용
					r_cont : $('#replyWrite').val()
				}
				
				//아작스로 넘겨주기 
				$.ajax({
					url : "${cp}/note/insertReply",
					type : "GET", 
					cache : false, 
					data : form,
					success : function(data){
						$('#replyTable').html(data);
						$('#replyWrite').val("");
					},
					error : function(){
						swal({
							title: "Error",
							text: "에러발생",
							type: "error",
							showCancelButton: false,
							/* cancelButtonClass: 'btn-danger', */
							confirmButtonClass: 'btn-danger',
							confirmButtonText: '확인'
						});
					}
				})
				
			})
			
			//자식 댓글창 입력 열기
		 	$('.ajaxReplyBlock').on('click' , '.ChildReplyViewBtn'  , function(){
		 		
		 		//현재댓글을 클릭하면 그 댓글은 부모댓글이 되고 그 하위 댓글을 작성하는 것이다. r_parentNum 은 현재 댓글의 댓글번호이고 이것을 지금 입력할 자식댓글행의 부모댓글번호컬럼에 insert 해준다.
		 		var r_parentNum = $(this).data('up'); 
		  		var plusTr = "";
			 		plusTr += "<tr style='height: 150px;'>"
			 		plusTr += 	"<th></th>"
			 		plusTr += 	"<th colspan='4' style='width: 200px; height: 50px;'><span>답글 입력</span><br><textarea rows='3' cols='130' class='replyReplyCont'></textarea>"
			 		plusTr += 		"<input type='button' class='btn float-right btn-primary insertReplyReply' " + "id='" + r_parentNum + "'" + "value='답글등록'>"
			 		plusTr += 	"</th>"
			 		plusTr += 	"<th style='width: 200px;' scope='col'></th>"
			 		plusTr += 	"<th style='width: 180px;' scope='col'></th>"
			 		plusTr += "</tr>"
		 		
		 		$(this).parent().parent().after(plusTr); 
		 		
			})
			
			//자식 댓글 실제로 등록하기
			$('.ajaxReplyBlock').on('click' , '.insertReplyReply'  , function(){
			
				//부모 답글의 번호 
				var r_parent =  $(this).attr('id');
				var r_cont = $(this).parent().find('.replyReplyCont').val().trim();
				
				var form = {
				//현재 글번호 
					n_no : $('#n_no').val(),
				//부모 댓글 번호
					r_parent : r_parent,
				//작성자
					user_id : $('#user_id').val(),
				//내용
					r_cont : r_cont 
				}
				
				//아작스로 넘겨주기 
				$.ajax({
					url : "${cp}/note/insertReply",
					type : "GET", 
					cache : false, 
					data : form,
					success : function(data){
						$('#replyTable').html(data);
					},
					error : function(){
					}
				});
			})
			
			
			//댓글 삭제
			$('.ajaxReplyBlock').on('click' ,'.deleteReply', function(){
				//현재 자신의 id 에 저장된 값을 r_no 로 가지고 오기(r_no 저장되어 있음)
				var r_no = $(this).data('delete');
				//var cont = $(this).parent().parent().find(".deletedCont");
				var n_no = $('#n_no').val();
				$.ajax({
					url : "${cp}/note/deleteReply", 
					type : "GET" , 
					cache : false ,
					data : { r_no : r_no ,
							n_no : n_no
							}, 
					success : function(data){
						$('#replyTable').html(data);
						}, 
					error : function(){
						swal({
							title: "Error",
							text: "에러발생",
							type: "error",
							showCancelButton: false,
							/* cancelButtonClass: 'btn-danger', */
							confirmButtonClass: 'btn-danger',
							confirmButtonText: '확인'
						});
					}
					
				})
			})
			
			
			
			//댓글 수정창 열기 버튼
			$('.ajaxReplyBlock').on('click' , '.updateReplyView'  , function(){
				var updateCont = $(this).data('rno')
				//수정할 댓글 no 
				var updateReplyNo = $(this).data('rnono');
				var plusTr = "";
		 		 plusTr += "<tr style='height: 150px;'><th></th>"
		 		 plusTr +=     "<th colspan='4' style='width: 200px; height: 50px;'><span>댓글 수정</span><br><textarea rows='3' cols='130' class='replyReplyCont'>" + updateCont + "</textarea>"
		 		 plusTr += 	       "<input type='button' class='btn float-right btn-primary updateReply' " + "id='" + updateReplyNo  + "'" + "value='수정'>"
		 		plusTr  +=     "</th>"
		 		 plusTr += 	   "<th style='width: 200px;' scope='col'></th>"
		 		 plusTr += 	   "<th style='width: 180px;' scope='col'></th>"
		 		 plusTr += "</tr>"
		 		$(this).parent().parent().after(plusTr); 
			});
			
			
			//댓글 수정 버튼 (권한 작성자만)
			
			
			
			$('.ajaxReplyBlock').on('click' ,'.updateReply', function(){
				var r_no = $(this).attr('id');
				var n_no = $('#n_no').val();
				var r_cont = $(this).parent().find('.replyReplyCont').val()
				$.ajax({
					url : "${cp}/note/updateReply", 
					type : "GET" , 
					cache : false ,
					data : { r_no : r_no ,
							n_no : n_no , 
							r_cont : r_cont 
							}, 
					success : function(data){
						$('#replyTable').html(data);
						}, 
					error : function(){
						swal({
							title: "Error",
							text: "에러발생",
							type: "error",
							showCancelButton: false,
							/* cancelButtonClass: 'btn-danger', */
							confirmButtonClass: 'btn-danger',
							confirmButtonText: '확인'
						});
					}
				});
			});
			//댓글 수정 버튼 끝
		});
</script>




<form id="insertForm" action="${cp}/note/viewInsertChildNote" method="get">
	<!-- 현재글코드 이게 답글등록시 부모코드로 간다. -->
	<input type="hidden" value="${noteVo.n_no}" name="n_parent" id="n_parent">
	<!-- 현재글의 최상위 코드 -->
	<input type="hidden" value="${noteVo.n_gno}" name="n_gno" id="n_gno">
	<!-- 현재 p_code -->
	<input type="hidden" value="${noteVo.p_code }" name="p_code">
</form>


<%@ include file="/WEB-INF/views/common/noteSidebar.jsp" %>

<!-- START: Main Content-->
<main>



	<div id="allMain" class="container-fluid site-width">


		<!-- START: Breadcrumbs-->
		<div class="row ">
			<div class="col-12  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">업무노트</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- END: Breadcrumbs-->

		<!-- START: Card Data-->

		<!-- 높이 크기 동일하게 해주는 div -->
		<div id="sameHeight">
			<div class="card" id="firstDiv">
				<div class="card-body">
					<div class="wizard mb-4">



						<div class="connecting-line"></div>
						<ul class="nav nav-tabs d-flex mb-3">
							<li class="nav-item mr-auto"><a class="nav-link position-relative round-tab text-left p-0 active border-0" data-toggle="tab" href="#id1"> <i class="icon-book-open position-relative text-white h5 mb-3"></i> <br>
							</a></li>


						</ul>

						<c:choose>
							<c:when test="${noteVo.n_import == 01 }">
								<input type="button" value="⭐" style="font-size: large; border: none; background: transparent; cursor: default;">
							</c:when>
							<c:otherwise>
								<input type="button" value="★" style="font-size: large; border: none; background: transparent; cursor: default;">
							</c:otherwise>

						</c:choose>
						<input type="hidden" name="starCheck" id="starCheck" value="">
						<div class="tab-content">
							<div class="tab-pane fade active show" id="id1">
								<div class="form">
									<span id="starText"></span> <br>
									
									<div class="form-row">
										<label class="labelCont form-control col-1"><i class="icon-doc icons"></i>업무명</label> <br> <label class="lab form-control col-2">${noteVo.n_title }</label>
									</div>

									<c:if test="${parentTitle != null }">
										<div class="form-row">
											<label class="labelCont form-control col-1" id="upperWork"><i class="icon-action-redo"></i>상위업무 </label> <label class="lab form-control col-2" id="upperWork">${parentTitle}</label>
										</div>
									</c:if>

									<div class="form-row">
										<label class="labelCont form-control col-1"><i class="icon-people icons"></i>담당자 </label> <label class="lab form-control col-2">${noteVo.user_id}</label>
									</div>

									<div class="form-row">
										<label class="labelCont form-control col-1"><i class="icon-docs icons"></i>업무분류 </label> <label class="lab form-control col-2">${noteVo.category}</label>
									</div>

									<div class="form-row">
										<label class="labelCont form-control col-1"><i class="icon-chart icons"></i>상태 </label> <label class="lab form-control col-2">${noteVo.code_name}</label>
									</div>

									<div class="form-row">
										<label class="labelCont form-control col-1"><i class="icon-chart icons"></i>진행률 </label> <label class="lab form-control col-2">${noteVo.progress}%</label>
									</div>


									<div class="form-row">
										<label class="labelCont form-control col-1"><i class="icon-calendar icons"></i>시작일자 </label> <label class="lab form-control col-2">${noteVo.n_sdt}</label>
									</div>
									<div class="form-row">
										<label class="labelCont form-control col-1"><i class="icon-calendar icons"></i>마감일자 </label> <label class="lab form-control col-2">${noteVo.n_edt}</label>
									</div>


									<div class="form-row" style="height: auto;">
										<label class="labelCont form-control col-1"><i class="icon-speech icons"></i>업무내용</label><br> 
										<div class="form-control col-8" style="height: auto;">
											<label class="lab" id="content">${noteVo.n_cont}</label>
										</div>
										<br>
									</div>
								</div>

							</div>


							<!-- session 처리 해주기 수정해주기 -->
								<button type="button" id="cancel" class="btn float-right btn-secondary" style="margin-left: 3px;" value="">취소</button>
								 <c:if test="${noteVo.user_id == S_USER.user_id }"> 
								<button type="button" id="update" class="btn float-right btn-primary" value="">수정</button>
								 </c:if>  
							<!-- <button type="button" id="insertNoteReply"  class="btn float-right btn-primary" value="">답글작성</button> -->

							<!-- 댓글창 -->
							<br> <br> <br> <i id="replyIcon" class="fas fa-pen-square"></i>
							<div>댓글</div>
							<div class="ajaxReplyBlock">
								<!-- 현재 글 코드 -->
								<input type="hidden" value="${noteVo.n_no}" id="n_no">
								<!-- 작성자 -->
								<input type="hidden" value="${S_USER.user_id}" id="user_id">
								<div class="card-body">
									<div class="table-responsive size">
										<table class="table layout-primary" id="replyTable">
											<thead>
												<tr>
													<th scope="col" style="width: 200px;">작성자</th>
													<th colspan="4" scope="col">댓글내용</th>
													<th style="width: 200px;" scope="col">작성일시</th>
													<th style="width: 180px;" scope="col"></th>
												</tr>
											</thead>
											<tbody id="replyBody">
												<c:forEach items="${replyVoList}" var="replyVo">

													<c:choose>
														<c:when test="${replyVo.r_parent_name != null }">
															<tr class="eachReplyTr replyReply" id="${replyVo.r_no}" data-rnumber="${replyVo.r_no}" data-pno="${replyVo.r_parent}">
														</c:when>
														<c:otherwise>
															<tr class="eachReplyTr" id="${replyVo.r_no}" data-rnumber="${replyVo.r_no}" data-pno="${replyVo.r_parent}">
														</c:otherwise>
													</c:choose>
													<th scope="row" style="width: 200px;">${replyVo.user_id }</th>
													<c:choose>
														<c:when test="${replyVo.r_parent_name != null }">
															<td class="Cont" id="${replyVo.r_no}" colspan="4">&emsp;&emsp;&emsp;&emsp;<c:if test="${replyVo.r_cont == '삭제된 댓글입니다.'}">
																	<i id="trashIcon" class="fas fa-trash-alt trashIcon"></i>
																</c:if> <span class="replyParentId">${replyVo.r_parent_name}</span> 답글 :<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span class="replyContSpan">${replyVo.r_cont }</span></td>
														</c:when>

														<c:otherwise>
															<td class="Cont" id="${replyVo.r_no}" colspan="4"><c:if test="${replyVo.r_cont == '삭제된 댓글입니다.'}">
																	<i id="trashIcon" class="fas fa-trash-alt trashIcon"></i>
																</c:if> <span class="replyParentId">${replyVo.r_parent_name}</span><span class="replyContSpan">${replyVo.r_cont }</span></td>
														</c:otherwise>
													</c:choose>

													<td style="width: 200px;">${replyVo.r_regdt }</td>
													<td class="deleteAjaxTd" style="width: 180px;"><c:choose>
															<c:when test="${replyVo.r_cont == '삭제된 댓글입니다.'}">
															</c:when>
															<c:otherwise>
																<!-- 수정이가 수정함 id data로 변해버림 -->
																<c:if test="${ S_USER.user_id == replyVo.user_id  }">
																	<button class="btn btn-outline-primary deleteReply" data-delete="${replyVo.r_no }">
																		<i class="fa fa-trash deleteIcon"></i>
																	</button>
																	<!-- 댓글 수정하는 버튼 -->
																	<button class="btn btn-outline-primary updateReplyView" data-rno="${replyVo.r_cont }" data-rnono="${replyVo.r_no}">
																		<i class="far fa-edit updateIcon"></i>
																	</button>
																</c:if>
																<!-- 대댓글 작성하는 버튼 -->
																<!-- 수정이가 수정함 id data로 변해버림 -->
																<button class="btn btn-outline-primary ChildReplyViewBtn" data-up="${replyVo.r_no }">
																	+ <i class="far fa-edit updateIcon"></i>
																</button>
															</c:otherwise>
														</c:choose></td>

												</c:forEach>
											</tbody>
										</table>
										<table>
											<!-- 최상위 댓글 입력 -->
											<tr>
												<th>댓글 입력</th>
											</tr>
											<tr>

												<th scope="col" style="width: 200px;">작성자 : ${S_USER.user_id}</th>
												<td colspan="4" scope="col"></td>
												<td colspan="4"><textarea rows="3" cols="150" name="r_cont" id="replyWrite"></textarea></td>
												<td></td>
												<td style="width: 180px;" scope="col" id="replyBtnTd"><input type="button" class="btn float-right btn-primary" id="GroupReplyInsertBtn" value="댓글등록"></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							<!-- 댓글 끝 -->



						</div>








					</div>
				</div>
			</div>

			<!-- 답글리스트  -->
			<div class="card" id="secondDiv">
				<button type="button" id="insertNoteReply" class="btn float-right btn-primary" value="">답글작성</button>
				<div class="card-body">
					<div class="wizard mb-4">

						<!-- <div class="nav-item mr-auto" id="replyView"> -->
						<a class="nav-link position-relative round-tab text-left p-0 active border-0" data-toggle="tab" href="#id1"> <i class="icon-event icons position-relative text-white h6 mb-2"></i> <span id="replySpan"> 업무노트 답글 리스트</span> <br> <br>
						</a>
						<!--  </div> -->
						<br>
						<!-- 답글 리스트 보여주기 -->

						<c:forEach items="${noteReplyVoList}" var="noteReplyVo">

							<a href="${cp}/note/viewOneNote?n_no=${noteReplyVo.n_no}"><i class=icon-tag></i><span id="title"> ${noteReplyVo.n_title}</span><br></a>


						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>



