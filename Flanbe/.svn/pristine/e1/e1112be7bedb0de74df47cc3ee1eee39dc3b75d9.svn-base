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
<script>
//문서 로딩이 완료되고 나서 실행되는 영역
$(function(){
	$("#goinsert").on("click", function(){
		$("#insertFrm").submit();
	});
	$("#goupdate").on("click", function(){
		$("#updateFrm").submit();
	});
	$("#godelete").on("click", function(){
		swal({
			title: "Success!!",
			text: "삭제 성공",
			type: "success",
			showCancelButton: false,
			/* cancelButtonClass: 'btn-danger', */
			confirmButtonClass: 'btn-success',
			confirmButtonText: '확인'
		});
		setTimeout(function() {
			$("#deleteFrm").submit();
        	}, 1000);
	});
});
</script>
<style>
     .nav-link:hover {color: var(--primarycolor);}
     .todo-item:hover {background: rgba(72, 94, 144, 0.16);}
     .nav-item:hover {text-decoration: underline;}
</style>

<form id="insertFrm" action="${cp }/board/insertRePost" >
	<input type="hidden" name="pa_no" value="${selectPost.p_no }"/>
	<input type="hidden" name="b_no" value="${bno }"/>
	<input type="hidden" name="page" value="${page }"/>
</form>
<form id="updateFrm" action="${cp }/board/updatePost" >
	<input type="hidden" name="p_no" value="${selectPost.p_no }"/>
	<input type="hidden" name="b_no" value="${bno }"/>
	<input type="hidden" name="page" value="${page }"/>
</form>
<form id="deleteFrm" action="${cp }/board/deletePost" >
	<input type="hidden" name="p_no" value="${selectPost.p_no }"/>
	<input type="hidden" name="b_no" value="${bno }"/>
</form>

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
								 	<c:choose>
										<c:when test="${S_USER.user_id == '1'}">	
												 <a id="goinsert" class="btn btn-primary py-2 px-2 rounded ml-auto text-white">
				                                   <i class="fa fa-plus"></i> <span>답글 등록</span>
					                             </a>
		                             	</c:when>
		                             	<c:when test="${selectBoard.b_nm == '건의사항'}">
												 <a id="goinsert" class="btn btn-primary py-2 px-2 rounded ml-auto text-white">
				                                   <i class="fa fa-plus"></i> <span>답글 등록</span>
					                             </a>
		                             	</c:when>
		                            </c:choose>
								</div>
                            </div>
                            <div class="card-body p-0">
								<div class="col-md-12 col-lg-12">
                                    <div class="card-body border brd-gray border-top-0 border-right-0 border-left-0">
                                        <h3 class="mb-0"><a class="f-weight-500 text-primary">${selectPost.p_title }</a></h3>
                                        <div class="clearfix" style="margin-top: 4px;">
                                           	<c:if test="${selectPost.user_id == '1'}">
	                                           	<span>작성자 : 관리자</span>
                                           	</c:if>
                                           	<c:if test="${selectPost.user_id != '1'}">
	                                           	<span>작성자 : ${selectPost.user_id }</span>
                                           	</c:if>
                                           	<span>&nbsp;&nbsp;&nbsp;&nbsp;작성 일자 : <fmt:formatDate value="${selectPost.p_regdt }" pattern="yyyy.MM.dd"/></span>
                                            <span>&nbsp;&nbsp;&nbsp;&nbsp;조회수 : ${selectPost.p_view }</span>
                                        </div>
                                    </div>
                                    <div class="card-body border brd-gray border-top-0 border-right-0 border-left-0">
                                        <p class="mb-0" lang="ca">${selectPost.p_cont }</p>
                                    </div>
									<c:if test="${attachList[0] != null}">
                                       <div class="card-body border brd-gray border-top-0 border-right-0 border-left-0">
                                           <span>첨부파일</span>
										<c:forEach items="${attachList }" var="attach">
											<li class="nav-item" style="padding: 5px 15px; cursor: pointer;"  onclick="location.href='/board/fileDownload?a_no=${attach.a_no}'">${attach.a_nm }</li>					
										</c:forEach>								                            	
                                       </div>
									</c:if>	
                                    <c:if test="${S_USER.user_id == selectPost.user_id || S_USER.user_id == '1'}">
                                      <div class="card-body border brd-gray border-top-0 border-right-0 border-left-0 border-bottom-0">
                                          <div class="d-inline-block mr-12" style="float: right; margin-bottom: 15px;">
                                              <a id="goupdate" class="btn btn-primary py-2 px-2 rounded ml-auto text-white"><span> 수 정 </span></a>
                                              <a id="godelete" class="btn btn-secondary py-2 px-2 rounded ml-auto text-white"><span> 삭 제 </span></a>
                                          </div>
                                      </div>
                               	 	</c:if>
                                </div> 
                             </div>
                        </div>
                    </div>
                </div>
		        <!-- END: Card DATA-->
            </div>
        </main>