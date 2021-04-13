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
	$(".todo-item").on("click", function(){
	   	if($(this).data("p_act") == 'Y'){
	         swal({
					title: "Error",
					text: "삭제된 게시글 입니다.",
					type: "error",
					showCancelButton: false,
					/* cancelButtonClass: 'btn-danger', */
					confirmButtonClass: 'btn-primary',
					confirmButtonText: '확인'
				});
      	}
		else{
	         var page = $(this).data("page");
	         $("#select_page").val(page);
	         var p_no = $(this).data("p_no");
	         $("#p_no").val(p_no)
	         $("#frm").submit();
	   	}
	});
  	$("#goinsert").on("click", function(){
      	$("#insertFrm").submit();
   	});
	<c:if test="${key != null }">
		$("#key").val("${key}");
	</c:if>
});
</script>
        
        
<style>
     .nav-link:hover {color: var(--primarycolor);}
     .todo-item:hover {background: var(--sidebarbordercolor);
     cursor: pointer;}
</style>

    <!-- START: Body-->    
    	<form id="insertFrm" action="${cp }/board/insertPost" >
    		<input type="hidden" id="insert_page" name="page" value="${page.page }"/>
			<input type="hidden" id="b_no" name="b_no" value="${bno }"/>
		</form>
    	<form id="frm" action="${cp }/board/selectPost" >
			<input type="hidden" id="select_page" name="page"/>
			<input type="hidden" id="p_no" name="p_no"/>
			<input type="hidden" id="b_no" name="b_no" value="${bno }"/>
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
	                            <div class="input-group row col-6" style="height: 36px;">
		                            <form class="input-group row" action="${cp }/board/searchView" method="post">
										<input type="hidden" id="b_no" name="b_no" value="${bno }"/>
				                        <input class="form-control" type="text" id="key" name="keyword" placeholder="검색어를 입력하세요." value="" style="margin-left: 2%;">
				                        <span class="input-group-append">
				                           <button class="btn btn-primary" type="submit" id="searchBtn" data-card-widget="search">
				                              <i class="fa fa-fw fa-search"></i>
				                           </button>
				                        </span>
				                    </form>
			                    </div>
	                            <c:choose>
									<c:when test="${S_USER.purpose == 'M'}">	
											 <a id="goinsert" class="btn btn-primary py-2 px-2 rounded ml-auto text-white">
			                                   <i class="fa fa-plus"></i> <span>새글 등록</span>
				                             </a>
	                             	</c:when>
	                             	<c:when test="${selectBoard.b_nm == '건의사항'}">
											 <a id="goinsert" class="btn btn-primary py-2 px-2 rounded ml-auto text-white">
			                                   <i class="fa fa-plus"></i> <span>새글 등록</span>
				                             </a>
	                             	</c:when>
	                            </c:choose>
                            </div>
	                            
                            <div class="card-body p-0">
                                <ul class="todo-list" style="margin-bottom: 0px;">
                              	  <c:forEach items="${postList }" var="post">
                                      <li class="todo-item" id="post" data-p_no="${post.p_no }" data-page="${page.page }"data-p_act="${post.p_act }">
                                          <div class="todo-content">                                                        
                                              <h3 class="postno">
                                                 <c:forEach begin="1" end="${post.level -1}">
                                        			&nbsp;
                                        			<i class="mdi h6 mr-2 mdi-subdirectory-arrow-right"></i>
                                                 </c:forEach>
                                                 <c:choose>
                                                 	<c:when test="${post.p_act == 'Y' }">
                                                 		삭제된 게시글 입니다
                                                 	</c:when>
                                                 	<c:otherwise>
                                                 		${post.p_title }
                                                 	</c:otherwise>
                                                 </c:choose>
                                              </h3>  
                                              <p class="text-muted mb-0 font-weight-bold todo-date">
                                                 <fmt:formatDate value="${post.p_regdt }" pattern="yyyy-MM-dd"/>
                                              </p>
                                              <p class="small-content text-muted mb-0">
                                              	<c:if test="${post.user_id == '1'}">
	                                           		작성자 : 관리자
	                                           	</c:if>
	                                           	<c:if test="${post.user_id != '1'}">
		                                           	작성자 : ${post.user_id }
	                                           	</c:if>
                                             &nbsp;&nbsp;&nbsp;&nbsp; 조회 수 : ${post.p_view }</p>
                                          </div>
                                      </li>
                                   </c:forEach>
                                </ul>
                                <div class="col-sm-12 col-md-12" style="padding-top: 15px; border-top: 1px solid rgba(72, 94, 144, 0.2);">
									<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate" style="float: right; margin-right: 43%;">
										<ul class="pagination">
											<c:choose>
												<c:when test="${page.page == 1 }">
													<li class="paginate_button page-item previous disabled" id="dataTable_previous">
														<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-double-left"></i></a>
													</li>
													<li class="paginate_button page-item previous disabled" id="dataTable_previous">
														<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-left"></i></a>
													</li>	
												</c:when>
												<c:otherwise>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="${cp }/board/searchView?b_no=${page.b_no }&page=1&keyword=${page.p_field}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-double-left"></i></a>
													</li>
													<li class="paginate_button page-item previous" id="dataTable_previous">
														<a href="${cp }/board/searchView?b_no=${page.b_no }&page=${page.page - 1}&keyword=${page.p_field}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-left"></i></a>
													</li>	
												</c:otherwise>
											</c:choose>
											<c:forEach begin="1" end="${pagination }" var="i">
												<c:choose>
													<c:when test="${page.page == i}">
														<li class="paginate_button page-item active">
															<span class="page-link">${i }</span>
														</li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button page-item">
															<a href="${cp }/board/searchView?b_no=${page.b_no }&page=${i}&keyword=${page.p_field}" aria-controls="dataTable" class="page-link">${i }</a>
														</li>		
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${page.page == pagination }">
													<li class="paginate_button page-item next disabled" id="dataTable_previous">
														<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-right"></i></a>
													</li>
													<li class="paginate_button page-item next disabled" id="dataTable_previous">
														<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-double-right"></i></a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="paginate_button page-item next" id="dataTable_previous">
														<a href="${cp }/board/searchView?b_no=${page.b_no }&page=${page.page +1}&keyword=${page.p_field}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-right"></i></a>
													</li>
													<li class="paginate_button page-item next" id="dataTable_previous">
														<a href="${cp }/board/searchView?b_no=${page.b_no }&page=${pagination}&keyword=${page.p_field}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><i class="fas fa-angle-double-right"></i></a>
													</li>
												</c:otherwise>
											</c:choose>
										</ul>
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