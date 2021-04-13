<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function() {
		$("#sendbtn").on('click',function(){
			$('#sendfrom').submit();
		})
		
	})
</script>


<!-- START: Main Content-->


	<div class="sidebar">
	    <div class="site-width">
	        <!-- START: Menu-->
	        <ul id="side-menu" class="sidebar-menu">
	           <li class="dropdown"><a href="#" style="text-align:center; font-size: 15px;">쪽지함</a>                  
	                <ul>
	                    <li><a href="${cp }/message/main?num=1">
	                    	<i class="icon-paper-plane pr-2"></i>  받은 쪽지함
	                    	<span class="ml-auto badge badge-pill badge-success bg-success">${messagecont} </span>
	                    	</a>
	                    </li>
	                    <li><a href="${cp }/message/main?num=2">
	                   <i class="icon-envelope pr-2"></i> 보낸 쪽지함</a></li>
	                </ul>                   
	            </li>
			</ul>
			<div class="eagle-divider"></div>
	    </div>
	</div>
<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<div class="row">
			<div class="col-12  align-self-center">
				<div
					class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">

					<ol class="breadcrumb bg-transparent align-self-center m-0 p-0">
<!-- 						<li class="breadcrumb-item">Home</li> -->
<!-- 						<li class="breadcrumb-item active"><a -->
<!-- 							href="javascript:history.back();">Message</a></li> -->
<!-- 						<li class="breadcrumb-item active"><a href="#">MessageDetail</a></li> -->
					</ol>
				</div>
			</div>
		</div>
		<!-- END: Breadcrumbs-->

		<!-- START: Card Data-->
		<div class="row" style="min-height: 680px; margin-left: 100px;">
			<div class="col-12 col-lg-9 col-xl-10 mb-4 mt-3 pl-lg-0">
				<div class="card border h-mail-list-section">
					<!-- <div class="view-email" style="display: block;"> -->
						<div class="card-body p-15">
							<a href="${cp }/message/main?user_id=${S_USER.user_id}"
								class="bg-primary float-left mr-3  py-1 px-2 rounded text-white back-to-email">
								Back</a>
							<div class="media mb-5 mt-5">
								<div class="align-self-center">
									<img src="${cp }/dist/images/author1.jpg" alt=""
										class="img-fluid rounded-circle d-flex mr-3" width="40">
								</div>
								<div class="media-body">
								<c:choose>
									<c:when test="${S_USER.user_id == detailList.r_id }">
										<h6 class="mb-0 view-author">보낸 사람 : ${detailList.s_id }</h6>
									</c:when>
									<c:otherwise>
										<h6 class="mb-0 view-author">받는 사람 : ${detailList.r_id }</h6>
									</c:otherwise>
								</c:choose>
									<small class="view-date"><fmt:formatDate
											value="${detailList.m_regdt }" pattern="yyyy-MM-dd hh:mm:ss" /></small>
								</div>
							</div>
							<p>${detailList.m_cont}</p>
							<br> <br> <br> <br> <br> <br>

							<hr>
							<c:if test="${S_USER.user_id == detailList.r_id }">
								<div class="media d-block text-center p-3"
									style="text-align: right !important;">
									<a href="#" class="bg-primary w-40d-block py-2 px-2 rounded text-white" data-toggle="modal" data-target="#composeemail"> 
									<i class="icon-plus align-middle text-white"></i> <span>답장하기</span>
									</a>
								</div>
							</c:if>

							<!-- Compose Email -->
							<div class="modal fade" id="composeemail">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title"><i class="icon-pencil"></i> 쪽지 쓰기</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<i class="icon-close"></i>
											</button>
										</div>
										<!-- 모달창 -->
										<form id="sendfrom" action="${cp }/message/messageRegist" method="POST">
											<input type="hidden" name="s_id" value="${S_USER.user_id }">
											<input type="hidden" name="m_no" value="${detailList.m_no }">
											<div class="modal-body">
												<div class="form-group">
													<input type="text" class="form-control" placeholder="To." name="r_id" value="${detailList.s_id }" readonly />
												</div>

												<textarea name="m_cont" style="width: 465px; height: 300px; resize: none;"></textarea>
											</div>
											<div class="modal-footer">
												<button id="sendbtn" type="button"
													class="btn btn-primary send-email">Send</button>
											</div>
										</form>
										<!-- 모달창 -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	<!-- END: Card DATA-->
</main>
<!-- END: Content-->