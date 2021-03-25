<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="sidebar">
	<div class="site-width">
		<!-- START: Menu-->
		<ul id="side-menu" class="sidebar-menu">
			<li class="dropdown">
			<a href="#" style="text-align: center; font-size: 15px;">프렌비 소식</a></li>
		</ul>
	</div>
	<div class="site-width">
		<ul class="list-unstyled inbox-nav  mb-0 mt-2 notes-menu" id="myTab1" role="tablist">
			<c:forEach items="${boardList }" var="board" varStatus="loop">
	        	<li class="nav-item">
		        <c:choose>
					<c:when test="${board.b_no == bno}">
						<a class="nav-link active" href="${cp }/board/view?b_no=${board.b_no }">
			              	<input type="hidden" name="b_no" value="${board.b_no }">
							${board.b_nm }
			            </a>
					</c:when>
					<c:otherwise>
						<a class="nav-link" href="${cp }/board/view?b_no=${board.b_no }">
				        	<input type="hidden" name="b_no" value="${board.b_no }">
				        	${board.b_nm }
				        </a>
					</c:otherwise>
				</c:choose>
	            </li>
            </c:forEach>
		</ul>
	</div>
	
</div>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>
<script>
		//문서 로딩이 완료되고 나서 실행되는 영역
		$(function(){
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
			
			var i = ${attachList.size() };
/* 			alert(i); */
			
			$('.adelete').on('click',function(){
				var a_no = $(this).data("a_no");
				var th = $(this);
				$.ajax({
					url:'${cp}/board/fileDelete',
					type:'get',
					dateType:'json',
					data : {
						a_no : a_no
					},
					success:function(data){
						$(th).parent().remove();
						swal({
							title: "Success!!",
							text: "삭제 성공",
							type: "success",
							showCancelButton: false,
							/* cancelButtonClass: 'btn-danger', */
							confirmButtonClass: 'btn-success',
							confirmButtonText: '확인'
						});
						i--;
					},
					error:function(xhr){
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
				})
			});
			
			
			$('#aAdd').on('click',function() {
				if(i < 5) {
					$('#attachL').append('<div> <input type="file" id='+ i +' name="file" style="margin-left: 20px;"> <input type="button" id="bdelete" class="btn btn-primary" value="X"><br><br></div>')
					i++;
				}
				else {
					swal({
						title: "Info",
						text: "5개까지만 가능합니다.",
						type: "info",
						showCancelButton: false,
						confirmButtonClass: 'btn-info',
						confirmButtonText: '확인',	
						closeOnConfirm: false
					});
				}
			})
			$(document).on('click', '#bdelete',function(){
				if(i != 1) {
					i--;
					$(this).parent().remove();
				} else {
					swal({
						title: "Info",
						text: "최소 1개는 유지",
						type: "info",
						showCancelButton: false,
						confirmButtonClass: 'btn-info',
						confirmButtonText: '확인',	
						closeOnConfirm: false
					});
				}
			})
			
			$("#goupdate").on("click", function(){
				var p_title = $("#posttitle").val()
				$("#p_title").val(p_title);
				var p_cont = $("#summernote").val()
				$("#p_cont").val(p_cont);
				$("#updateFrm").submit();
			});
		});
</script>
<style>
     .nav-link:hover {color: var(--primarycolor);}
     .todo-item:hover {background: rgba(72, 94, 144, 0.16);}
</style>



        <!-- START: Main Content-->
        <main>
            <div class="container-fluid site-width">
                <!-- START: Breadcrumbs-->
                <div class="row ">
                    <div class="col-11  align-self-center">
                        <div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
                            <div class="w-sm-100 mr-auto">
                            	<h4 class="mb-0">${selectBoard.b_nm }</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END: Breadcrumbs-->

                <!-- START: Card Data-->
                <div class="row">
					<div class="col-11 mt-3">
						<div class="card">
							<div class="col-12" style="padding-top: 0px;">
                                <div class="card-header border-bottom p-2 d-flex">
	                           		<a href="${cp }/board/view?b_no=${bno }&page=${page}" class="btn btn-primary py-2 px-2 rounded ml-auto text-white" style="margin-left: 0px!important;">
									<i class="fas fa-list"></i> 목록</a>
									 <a id="goupdate" class="btn btn-primary py-2 px-2 rounded ml-auto text-white">
		                                   <i class="icon-plus align-middle text-white"></i> <span>수정</span>
		                             </a>
                            	</div>
                            </div>
                            <div class="card-body p-0">
                                <div class="col-12 mt-3" style="padding-bottom: 20px;">
			                        <div class="card h-100">
			                            <div class="card-content">
			                                <div class="card-body py-5" style="padding-top: 1rem!important; padding-bottom: 2rem!important;">                                   
			                                    <form>
			                                        <div class="form-group row">                                                  
			                                            <div class="col-sm-12">
			                                                <input type="text" class="form-control" id="posttitle" value="${post.p_title }">
			                                            </div>                                                    
			                                        </div>
			                                    </form>
			                                    <textarea id="summernote" name= summernote>${post.p_cont }</textarea>
			                                    <br>					                                    
		                                    	<div class="card">
                 		                                    <div class="card-body border brd-gray border-top-0 border-right-0 border-left-0">
			                                            <span>첨부파일</span>
															<c:forEach items="${attachList }" var="attach" varStatus="loop">
																<div>
																	${loop.count }. ${attach.a_nm } 
																	<!-- <input type="button" class="adelete" value="X"" style="background: none; border: none; color: #f64e60;"> -->
								                            		<button class="adelete" data-a_no="${attach.a_no }" style="background: none; border: none; color: lightcoral;"><i class='fa fa-times'></i></button>
																</div>					
															</c:forEach>								                            	
			                                        </div>
		                                    		<div class="card-body">
					                            		<button class="btn btn-primary"  id="aAdd"><i class='fa fa-plus'></i> 파일 추가</button>
					                            		<br><br>
				                           		       	<form id="updateFrm" action="${cp }/board/updatePost" method="post" enctype="multipart/form-data">
															<input type="hidden" name="b_no" value="${post.b_no }"/>
															<input type="hidden" name="p_no" value="${post.p_no }"/>
															<input type="hidden" name="page" value="${page }"/>
															<input type="hidden" id="p_title" name="p_title"/>
															<input type="hidden" id="p_cont" name="p_cont"/>
															<input type="hidden" name="user_id" value="${S_USER.user_id}"/>
																					
						                            		<div class="card" id="attachL" style="border: none;">
					                            				<br>
						                            		</div>
														</form>
													</div>
		                                    	</div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END: Card DATA-->
            </div>
        </main>
        <!-- END: Content-->

